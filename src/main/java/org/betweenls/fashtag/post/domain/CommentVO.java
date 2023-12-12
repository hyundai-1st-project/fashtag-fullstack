package org.betweenls.fashtag.post.domain;

import lombok.Data;

import java.util.Date;
import java.util.List;

@Data
public class CommentVO {
    private Long commentId;
    private String commentContent;
    private Date createdAt;
    private Date updatedAt;//일단 수정은 안넣을 예정
    //부모 외래키
    private Long postId;
    private Long userId;

    //comments 테이블에 없는것
    private String nickname;
    private String formattedCreatedAt;
}
