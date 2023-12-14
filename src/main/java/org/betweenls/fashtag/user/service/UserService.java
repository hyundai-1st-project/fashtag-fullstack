package org.betweenls.fashtag.user.service;

import org.betweenls.fashtag.user.domain.MyPageVO;
import org.betweenls.fashtag.user.domain.UserVO;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

public interface UserService {

    void join(UserVO userVO, MultipartFile file) throws IOException;

    UserVO getUserByUserId(long id);

    UserVO getUserById(String username);

    int idcheck(String userid);

    int nicknameCheck(String nickname);
    public UserVO loginCheck();

    MyPageVO getMyPage(UserVO userVO);

    boolean deleteUser(UserVO userId);

    boolean editUser(UserVO userVO, MultipartFile file) throws IOException;
}
