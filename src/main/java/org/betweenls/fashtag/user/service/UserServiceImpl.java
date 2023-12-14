package org.betweenls.fashtag.user.service;

import java.util.UUID;
import lombok.extern.java.Log;
import org.betweenls.fashtag.global.s3.S3UploaderService;
import org.betweenls.fashtag.post.service.PostService;
import org.betweenls.fashtag.user.domain.*;
import org.betweenls.fashtag.user.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;

@Service
@Log
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    @Autowired
    private S3UploaderService s3UploaderService;

    @Override
    @Transactional
    public void join(UserVO userVO, MultipartFile file) throws IOException {
        userVO.setPassword(bCryptPasswordEncoder.encode(userVO.getPassword()));
        userMapper.join(userVO);
        userMapper.setAuth(userVO.getUserId());

        // 프로필 사진 저장
        saveProfile(userVO, file);
    }

    @Override
    public UserVO getUserByUserId(long userId) {
        return userMapper.getUserDetail(userId);
    }

    @Override
    public UserVO getUserById(String id) {
        return userMapper.getUserById(id);
    }

    @Override
    public int idcheck(String id) {
        return userMapper.idcheck(id);
    }

    @Override
    public int nicknameCheck(String nickname) {
        return userMapper.nicknameCheck(nickname);
    }

    @Override
    public MyPageVO getMyPage(UserVO userVO) {
        List<PostPictureVO> postVO = userMapper.getPost(userVO.getUserId());
        List<String> hashtags = userMapper.getHashTage(userVO.getUserId());
        return MyPageVO.of(userVO,postVO,hashtags);
    }

    @Autowired
    private PostService postService;

    @Override
    @Transactional
    public boolean deleteUser(UserVO userVo) {
        String profile = userVo.getProfile();

        // post 삭제하기
        List<Long> postIdList = postService.getPostByUserId(userVo.getUserId());
        postIdList.forEach(postService::deletePostByPostId);

        // 유저 삭제
        int authDelete = userMapper.deleteAuth(userVo.getUserId());
        if(authDelete < 1){
            throw new RuntimeException("권한 삭제가 불가능합니다.");
        }

        int userDelete = userMapper.deleteUser(userVo.getUserId());
        if(userDelete < 1){
            throw new RuntimeException("유저 삭제가 불가능합니다.");
        }

        if(!profile.equals("user/user-profile-image/defaultImage")){
            s3UploaderService.deleteFile(profile);
        }

        return true;
    }

    @Override
    public boolean editUser(EditUserVO editUserVO, MultipartFile file) throws IOException {
        // 프로필 사진 수정
        UserVO userVO = loginCheck();
        saveProfile(userVO, file);

        return userMapper.editUser(userVO.getUserId(), editUserVO);
    }

    private void saveProfile(UserVO userVO, MultipartFile file) throws IOException {
        if(file.getSize() != 0 && !file.equals("") && file != null && !file.isEmpty()){
            // UUID 생성
            String uuid = UUID.randomUUID().toString();
            String basicFileName = userVO.getUserId() + uuid ;
            String dirName = "user/" + userVO.getUserId();  // 폴더 이름
            String photoKey = s3UploaderService.convertFile(file, dirName, basicFileName);
            userMapper.updateProfile(userVO.getUserId(), photoKey);
        }
    }

    @Override
    public UserVO loginCheck() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication != null && "anonymousUser".equals(authentication.getPrincipal())) {
            log.info("not Login");
            return null;
        }else{
            return ((CustomUser) authentication.getPrincipal()).getUserVO();
        }
    }
}
