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

    @Override
    public int addLike(LikeVO like) {
        return mapper.insertLike(like);
    }

    @Override
    public int cancelLike(LikeVO like){
        return mapper.deleteLike(like);
    }

    @Override
    public String getLikeStatus(Long postId, Long userId){
        LikeVO like = new LikeVO();
        like.setPostId(postId);
        like.setUserId(userId);
        return mapper.getLikeStatus(like);
    }
}