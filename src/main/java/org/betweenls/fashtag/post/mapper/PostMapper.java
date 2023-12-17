package org.betweenls.fashtag.post.mapper;

import org.apache.ibatis.annotations.Param;
import org.betweenls.fashtag.post.domain.PostVO;


import java.util.List;

public interface PostMapper {
	public List<PostVO> getAllPost( @Param("order") String order, @Param("userId") Long userId);
	public List<PostVO> getHashtagPost(String hashtag);
	public List<PostVO> getPostByHashtagWithPaging(@Param("hashtag") String hashtag,@Param("userId") Long userId, @Param("page")Long page, @Param("limit")Long limit);
	public List<PostVO> getPostWithPaging(@Param("order") String order, @Param("userId") Long userId, @Param("page")Long page, @Param("limit")Long limit);
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
}