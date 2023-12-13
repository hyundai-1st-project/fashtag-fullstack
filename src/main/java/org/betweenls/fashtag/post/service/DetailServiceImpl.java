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
    @Override
    public PostVO getPostDetail(Long postId) {
        log.info("get...." + postId);

        return mapper.getPostDetailByPostId(postId);
    }

}