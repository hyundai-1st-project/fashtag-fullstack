package org.betweenls.fashtag.post.service;

import org.betweenls.fashtag.post.domain.PostVO;

public interface DetailService {
    public PostVO getPostDetail(Long postId);
}
