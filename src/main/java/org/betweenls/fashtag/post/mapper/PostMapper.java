package org.betweenls.fashtag.post.mapper;

import org.apache.ibatis.annotations.Param;
import org.betweenls.fashtag.post.domain.PostVO;


import java.util.List;

public interface PostMapper {
	public List<PostVO> getAllPost( @Param("order") String order, @Param("userId") Long userId);
	public List<PostVO> getHashtagPost(String hashtag);
	public void insertPost(PostVO postVO);
	public Long getHashtagIdByHashtagName(String hashtagName);
	public void insertHashtag(String hashtagName);
	public void insertPost_hashtag(@Param("postId") Long postId, @Param("hashtagId") Long hashtagId);
	public int deletePostByPostId(long postId);
	public int deletePost_hashtagByPostId(long postId);
	public int deleteLikeByPostId(long postId);
	public int deleteCommentByPostId(long postId);
	public int updatePost(PostVO postVO);

    List<Long> getPostByUserId(long userId);


//	public void insertSelectKey(PostVO post);
//	public PostVO read(Long postId);

//	public int update(PostVO post);
//	public List<PostVO> getListWithPaging(Criteria cri);
// 	public List<PostVO> getPost();
}