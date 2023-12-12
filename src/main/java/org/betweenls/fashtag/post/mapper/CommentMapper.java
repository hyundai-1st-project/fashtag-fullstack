package org.betweenls.fashtag.post.mapper;

import org.betweenls.fashtag.post.domain.CommentVO;

import java.util.List;

public interface CommentMapper {
	public List<CommentVO> getCommentList(Long postId);

}