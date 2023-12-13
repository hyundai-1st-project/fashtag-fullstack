package org.betweenls.fashtag.post.mapper;

import org.apache.ibatis.annotations.Param;
import org.betweenls.fashtag.post.domain.PostVO;


import java.util.List;

public interface PostMapper {
	public List<PostVO> getAllPost(String order);
	public List<PostVO> getHashtagPost(String hashtag);
	public List<String> getHashtagByPostId(Long postId);


	public void insertPost(PostVO postVO);
	public Long getHashtagIdByHashtagName(String hashtagName);
	public void insertHashtag(String hashtagName);
	public void insertPost_hashtag(@Param("postId") Long postId, @Param("hashtagId") Long hashtagId);
//	public void insertSelectKey(PostVO post);
//	public PostVO read(Long postId);
//	public int delete(long postId);
//	public int update(PostVO post);
//	public List<PostVO> getListWithPaging(Criteria cri);
// 	public List<PostVO> getPost();
}