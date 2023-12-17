package org.betweenls.fashtag.post.service;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.betweenls.fashtag.post.domain.CommentVO;
import org.betweenls.fashtag.post.domain.PostVO;
import org.betweenls.fashtag.post.mapper.CommentMapper;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.List;

@Slf4j
@Service
@AllArgsConstructor
public class CommentServiceImpl implements CommentService {
    private CommentMapper mapper;

    @Override
    public List<CommentVO> getCommentList(Long postId, Long page, int pageNum) {
        Long startPage = (page-1)*pageNum + 1;
        Long endPage = page*pageNum;
        List<CommentVO> commentList = mapper.getCommentListByPostId(postId, startPage, endPage);

        //댓글 각각의 createdAt을 String변환한 후 CommentVO에 set
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'");
        for (CommentVO comment : commentList) {
            comment.setFormattedCreatedAt(sdf.format(comment.getCreatedAt()));
        }

        return commentList;
    }

    @Override
    public Long getCommentNum(Long postId){
        return mapper.getCommentNum(postId);
    }

    @Override
    public int insertComment(CommentVO comment) {
        return mapper.insertComment(comment);
    }

    @Override
    public int removeComment(Long commentId){
        return mapper.deleteCommentByCommentId(commentId);
    }
}