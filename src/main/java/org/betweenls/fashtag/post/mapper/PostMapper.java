package org.betweenls.fashtag.post.mapper;

import org.betweenls.fashtag.post.domain.PostVO;


import java.util.List;

public interface PostMapper {
//	public List<PostVO> getPost();
	public List<PostVO> getAllPost(String order);
	public List<PostVO> getHashtagPost(String hashtag);

//	public List<PostVO> getListWithPaging(Criteria cri);

//	public void insert(PostVO post);
//
//	public void insertSelectKey(PostVO post);
//
//	public PostVO read(Long postId);
//
//	public int delete(long postId);
//
//	public int update(PostVO post);
}