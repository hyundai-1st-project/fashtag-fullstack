package org.betweenls.fashtag.post.service;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.annotations.Param;
import org.betweenls.fashtag.post.domain.PostVO;
import org.betweenls.fashtag.post.mapper.PostMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

@Slf4j
@Service
@AllArgsConstructor
public class PostServiceImpl implements PostService {
	private PostMapper mapper;
	@Override
	public List<PostVO> getAllPost(String order, Long userId) {
		return mapper.getAllPost(order, userId);
	}

	@Override
	public List<PostVO> getHashtagPost(String hashtag) {
		return mapper.getHashtagPost(hashtag);
	}
	public List<PostVO> getPostByHashtagWithPaging(String hashtag,Long userId, Long page, Long limit) {
		return mapper.getPostByHashtagWithPaging(hashtag,userId, page*limit, limit);
	}

	@Override
	public List<PostVO> getPostWithPaging(String order, Long userId, Long page, Long limit) {
		return mapper.getPostWithPaging(order, userId, page*limit, limit);
	}
	@Override
	public void insertPost(PostVO postVO) {
		mapper.insertPost(postVO);
	}

	@Override
	public Long getHashtagIdByHashtagName(String hashtagName) {
		return mapper.getHashtagIdByHashtagName(hashtagName);
	}

	@Override
	public void insertHashtag(String hashtagName) {
		mapper.insertHashtag(hashtagName);
	}

	@Override
	public void insertPost_hashtag(@Param("postId") Long postId, @Param("hashtagId") Long hashtagId){
		mapper.insertPost_hashtag(postId, hashtagId);
	}

	@Override
	public int deletePostByPostId(long postId) {
		return mapper.deletePostByPostId(postId);
	}

	@Override
	public int deletePost_hashtagByPostId(long postId) {
		return mapper.deletePost_hashtagByPostId(postId);
	}

	@Override
	public int deleteLikeByPostId(long postId) {
		return mapper.deleteLikeByPostId(postId);
	}

	@Override
	public int deleteCommentByPostId(long postId) {
		return mapper.deleteCommentByPostId(postId);
	}

//	@Transactional
	@Override
	public void deletePostWithForeignKey(Long postId) {
		deleteCommentByPostId(postId);
		deleteLikeByPostId(postId);
		deletePost_hashtagByPostId(postId);
		deletePostByPostId(postId);
	}
	@Override
	public String uploadFile(MultipartFile uploadFile, HttpServletRequest request) {

		String uploadDirectory = request.getServletContext().getRealPath("/resources/image/posts-upload-image/");

		//추후 S3 도입하면 적용 예정
		File uploadPath = new File(uploadDirectory);
		if (!uploadPath.exists()) {
			uploadPath.mkdirs();
		}


		UUID uuid = UUID.randomUUID();
		String uploadFileName = uuid.toString() + "_" + uploadFile.getOriginalFilename();
		File saveFile = new File(uploadPath, uploadFileName);
		try {
			uploadFile.transferTo(saveFile);
		} catch (IOException e) {
			throw new RuntimeException(e);
		}
		return "/resources/image/posts-upload-image/" + uploadFileName;

	}
	@Override
	public int updatePost(PostVO postVO) {
		return mapper.updatePost(postVO);
	}

	@Override
	public List<Long> getPostByUserId(long userId) {
		return mapper.getPostByUserId(userId);
	}

}
