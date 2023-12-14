package org.betweenls.fashtag.user.mapper;

import org.apache.ibatis.annotations.Param;
import org.betweenls.fashtag.user.domain.EditUserVO;
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

    void updateProfile(@Param("userId") long userId, @Param("photoKey") String photoKey);

    int deleteAuth(long userId);
    int deleteUser(long userId);

    boolean editUser(@Param("userId") long userId, @Param("user") EditUserVO user);

    void removeProfile();

    int getCommentSize(long userId);
}
