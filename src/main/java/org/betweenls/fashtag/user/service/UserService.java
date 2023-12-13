package org.betweenls.fashtag.user.service;

import org.betweenls.fashtag.user.domain.UserVO;

public interface UserService {
    void test();

    void join(UserVO userVO);

    UserVO getUserByUserId(long id);

    UserVO getUserById(String username);
<<<<<<< Updated upstream

    int idcheck(String userid);

    int nicknameCheck(String nickname);
=======
    public UserVO loginCheck();
>>>>>>> Stashed changes
}
