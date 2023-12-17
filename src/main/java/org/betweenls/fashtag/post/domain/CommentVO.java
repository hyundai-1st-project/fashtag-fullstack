package org.betweenls.fashtag.post.domain;

import lombok.Data;

import java.util.Date;
import java.util.List;

@Data
public class CommentVO {
    private Long commentId;
    private String commentContent;
    private Date createdAt;
    private Date updatedAt;
    private Long postId;
    private Long userId;
    private String nickname;
    private String profile;
    private String formattedCreatedAt;
}
