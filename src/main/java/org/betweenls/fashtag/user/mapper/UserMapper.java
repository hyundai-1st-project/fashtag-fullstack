package org.betweenls.fashtag.user.mapper;

import org.betweenls.fashtag.user.domain.UserVO;

public interface UserMapper {
    void join(UserVO userVO);
    void setAuth(long userId);

    UserVO getUserDetail(long userId); // pk 값

    UserVO read(String id); // 아이디
}