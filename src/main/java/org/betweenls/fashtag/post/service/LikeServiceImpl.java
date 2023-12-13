package org.betweenls.fashtag.post.service;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.betweenls.fashtag.post.domain.LikeVO;
import org.betweenls.fashtag.post.mapper.LikeMapper;
import org.springframework.stereotype.Service;

@Slf4j
@Service
@AllArgsConstructor
public class LikeServiceImpl implements LikeService {
    private LikeMapper mapper;

//    @Override
//    public List<CommentVO> getCommentList(Long postId) {
//        log.info("get...." + postId);
//        List<CommentVO> commentList = mapper.getCommentListByPostId(postId);
//
//        //댓글 각각의 createdAt을 String변환한 후 CommentVO에 set
//        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'");
//        for (CommentVO comment : commentList) {
//            comment.setFormattedCreatedAt(sdf.format(comment.getCreatedAt()));
//        }
//
//        return commentList;
//    }

    @Override
    public int addLike(LikeVO like) {
        log.info("insert..." + like);
        return mapper.insertLike(like);
    }

    @Override
    public int cancelLike(LikeVO like){
        log.info("delete..."+like);
        return mapper.deleteLike(like);
    }
}