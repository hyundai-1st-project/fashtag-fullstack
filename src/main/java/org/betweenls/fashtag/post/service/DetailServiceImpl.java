package org.betweenls.fashtag.post.service;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.betweenls.fashtag.post.domain.PostVO;
import org.betweenls.fashtag.post.mapper.DetailMapper;
import org.springframework.stereotype.Service;
import java.text.SimpleDateFormat;

@Slf4j
@Service
@AllArgsConstructor
public class DetailServiceImpl implements DetailService {
    private DetailMapper mapper;
//	@Override
//	public List<PostVO> getAllPost() {
////		log.info("get AllPost ");
//		return mapper.getAllPost();
//	}

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
    @Override
    public PostVO getDetail(Long postId) {
        log.info("get...." + postId);

        //날짜변환
        PostVO postDetail = mapper.getPostDetail(postId);
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'");
        postDetail.setFormattedCreatedAt(sdf.format(postDetail.getCreatedAt()));
        log.info("formattedDate..." + postDetail.getFormattedCreatedAt());

        postDetail.setLikeCount(Long.parseLong("0"));

        return postDetail;
    }
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