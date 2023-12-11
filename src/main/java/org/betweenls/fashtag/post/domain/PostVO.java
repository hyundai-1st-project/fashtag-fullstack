package org.betweenls.fashtag.post.domain;

import lombok.Data;

import java.util.Date;
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

    //Date String Formatting
    private String formattedCreatedAt;
}
