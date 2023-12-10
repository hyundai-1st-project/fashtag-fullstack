package org.betweenls.fashtag.user.service;

import org.betweenls.fashtag.user.domain.UserVO;

public interface UserService {
    void test();

    void join(UserVO userVO);

    UserVO getUserDetail(long id);

}
