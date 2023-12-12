package org.betweenls.fashtag.post.service;

import org.betweenls.fashtag.post.domain.CommentVO;
import java.util.List;

public interface CommentService {
	public List<CommentVO> getCommentList(Long postId);
}