package org.betweenls.fashtag.user.mapper;

import org.betweenls.fashtag.user.domain.PostPictureVO;
import org.betweenls.fashtag.user.domain.UserVO;

import java.util.List;

public interface UserMapper {
    void join(UserVO userVO);
    void setAuth(long userId);

    UserVO getUserDetail(long userId); // pk 값

    UserVO getUserById(String id); // 아이디

    int idcheck(String id);

    int nicknameCheck(String nickname);

    List<PostPictureVO> getPost(long userId);

    List<String> getHashTage(long userId);
}
