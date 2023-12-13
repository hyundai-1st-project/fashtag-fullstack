package org.betweenls.fashtag.user.service;

import org.betweenls.fashtag.user.domain.MyPageVO;
import org.betweenls.fashtag.user.domain.UserVO;

public interface UserService {

    void join(UserVO userVO);

    UserVO getUserByUserId(long id);

    UserVO getUserById(String username);

    int idcheck(String userid);

    int nicknameCheck(String nickname);
    public UserVO loginCheck();

    MyPageVO getMyPage(UserVO userVO);
}
