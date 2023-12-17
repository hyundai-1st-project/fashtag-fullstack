package org.betweenls.fashtag.post.service;

import org.betweenls.fashtag.post.domain.LikeVO;

public interface LikeService {
	public String getLikeStatus(Long postId, Long userId);

	public int addLike(LikeVO like);

	public int cancelLike(LikeVO like);
}
