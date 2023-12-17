package org.betweenls.fashtag.post.mapper;

import org.betweenls.fashtag.post.domain.PostVO;

import java.util.List;

public interface DetailMapper {
	public PostVO getPostDetailByPostId(Long postId);
	public List<String> getHashtagByPostId(Long postId);
}