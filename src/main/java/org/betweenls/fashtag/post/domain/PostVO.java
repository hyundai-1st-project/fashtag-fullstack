package org.betweenls.fashtag.post.domain;

import lombok.Data;

import java.util.Date;
import java.util.List;

@Data
public class PostVO {
    private Long postId;
    private String postContent;
    private String picture;
    private Date createdAt;
    private Date updatedAt;
    private Long readCount;
    private Long userId;
    private Long likeCount;
    private String nickname;
    private List<String> hashtags;
}
