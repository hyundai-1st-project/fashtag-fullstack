package org.betweenls.fashtag.post.service;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.annotations.Param;
import org.betweenls.fashtag.post.domain.PostVO;
import org.betweenls.fashtag.post.mapper.PostMapper;
import org.springframework.stereotype.Service;
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
	public List<PostVO> getAllPost(String order) {
		return mapper.getAllPost(order);
	}
	@Override
	public List<PostVO> getHashtagPost(String hashtag) {
		return mapper.getHashtagPost(hashtag);
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
	public int delete(long postId) {
		return mapper.delete(postId);
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

	//	@Autowired
//	public PostServiceImpl(PostMapper mapper) {
//		this.mapper = mapper;
//	}

	//	@Override
//	public void register(PostVO board) {
//		log.info("register...." + board);
//		mapper.insertSelectKey(board);
//	}
//
//	@Override
//	public PostVO get(Long postId) {
//		log.info("get...." + postId);
//		return mapper.read(postId);
//	}
//
//	@Override
//	public boolean modify(PostVO board) {
//		log.info("modify...." + board);
//
//		return mapper.update(board) == 1;
//	}
//
//	@Override
//	public boolean remove(Long bno) {
//		log.info("remove...." + bno);
//		return mapper.delete(bno) == 1;
//	}
//
////	@Override
////	public List<PostVO> getList() {
////		log.info("getList .......");
////		return mapper.getList();
////	}
//
//	@Override
//	public List<PostVO> getList(Criteria cri) {
//		log.info("get List with criteria: " + cri);
//		return mapper.getListWithPaging(cri);
//	}
}
