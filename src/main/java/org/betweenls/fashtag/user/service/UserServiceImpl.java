package org.betweenls.fashtag.user.service;

import lombok.extern.java.Log;
import org.betweenls.fashtag.global.s3.S3UploaderService;
import org.betweenls.fashtag.post.domain.PostVO;
import org.betweenls.fashtag.user.domain.CustomUser;
import org.betweenls.fashtag.user.domain.MyPageVO;
import org.betweenls.fashtag.user.domain.PostPictureVO;
import org.betweenls.fashtag.user.domain.UserVO;
import org.betweenls.fashtag.user.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.Authentication;
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

        // 파일 저장
        if(file != null || !file.isEmpty()){
            String basicFileName = userVO.getUserId() +"-img" ;
            String dirName = "user/" + userVO.getUserId();  // 폴더 이름
            String photoKey = s3UploaderService.convertFile(file, dirName, basicFileName);
            userMapper.updateProfile(userVO.getUserId(), photoKey);
        }
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
