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
    public List<CommentVO> getCommentList(Long postId) {
        log.info("get...." + postId);
        List<CommentVO> commentList = mapper.getCommentList(postId);

        //댓글 각각의 createdAt을 String변환한 후 CommentVO에 set
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'");
        for (CommentVO comment : commentList) {
            comment.setFormattedCreatedAt(sdf.format(comment.getCreatedAt()));
        }

        return commentList;
    }
}