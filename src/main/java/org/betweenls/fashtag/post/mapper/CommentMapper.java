package org.betweenls.fashtag.post.mapper;

import org.apache.ibatis.annotations.Param;
import org.betweenls.fashtag.post.domain.CommentVO;

import java.util.List;

public interface CommentMapper {
	public List<CommentVO> getCommentListByPostId(@Param("postId") Long postId, @Param("startPage") Long startPage, @Param("endPage") Long endPage);
	Long getCommentNum(Long postId);

	public int insertComment(CommentVO comment);

	public int deleteCommentByCommentId(Long commentId);
}