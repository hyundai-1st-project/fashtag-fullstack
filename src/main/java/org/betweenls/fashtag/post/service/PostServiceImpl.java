package org.betweenls.fashtag.post.service;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.betweenls.fashtag.post.domain.PostVO;
import org.betweenls.fashtag.post.mapper.PostMapper;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
@AllArgsConstructor
public class PostServiceImpl implements PostService {
	private PostMapper mapper;
	@Override
	public List<PostVO> getAllPost() {
//		log.info("get AllPost ");
		return mapper.getAllPost();
	}

	@Override
	public List<PostVO> getHashtagPost(String hashtag) {
//		log.info("get AllPost ");
		return mapper.getHashtagPost(hashtag);
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
