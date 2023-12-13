package org.betweenls.fashtag.post.mapper;

import org.betweenls.fashtag.post.domain.LikeVO;

public interface LikeMapper {
//	public List<CommentVO> getCommentListByPostId(Long postId);
	public int insertLike(LikeVO like);

	public int deleteLike(LikeVO like);
}