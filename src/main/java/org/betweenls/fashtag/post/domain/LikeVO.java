package org.betweenls.fashtag.post.domain;

import lombok.Data;

import java.util.Date;

@Data
public class LikeVO {
    private Long likeId;
    private Long postId;
    private Long userId;
}
