package org.betweenls.fashtag.post.service;

import org.apache.ibatis.annotations.Param;
import org.betweenls.fashtag.post.domain.PostVO;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.List;

public interface PostService {
	public List<PostVO> getAllPost(String order);
	public List<PostVO> getHashtagPost(String hashtag);
	public String uploadFile(MultipartFile uploadFile, HttpServletRequest request);
	public void insertPost(PostVO postVO);
	public Long getHashtagIdByHashtagName(String hashtagName);
	public void insertHashtag(String hashtagName);
	public void insertPost_hashtag(@Param("postId") Long postId, @Param("hashtagId") Long hashtagId);
	public int delete(long postId);
//	public PostVO get(Long postId);
//	public boolean modify(PostVO board);
//	public boolean remove(Long bno);
//	public List<PostVO> getList();

}
