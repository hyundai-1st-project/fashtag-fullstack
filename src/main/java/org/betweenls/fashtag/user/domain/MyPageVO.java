package org.betweenls.fashtag.user.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class MyPageVO {
    private UserVO userVO;
    private List<PostPictureVO> posts;
    private int postSize;
    private List<String> hashtags;

    public static MyPageVO of(UserVO userVO, List<PostPictureVO> postVO, List<String> hashtags) {
        return MyPageVO.builder()
                .userVO(userVO)
                .posts(postVO)
                .postSize(postVO.size())
                .hashtags(hashtags)
                .build();
    }

}