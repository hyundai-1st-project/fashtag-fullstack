package org.betweenls.fashtag.post.service;

import org.betweenls.fashtag.post.domain.LikeVO;

public interface LikeService {
//	public List<CommentVO> getCommentList(Long postId);
	public int addLike(LikeVO like);

	public int cancelLike(LikeVO like);
}
