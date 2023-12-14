package org.betweenls.fashtag.global.Controller;


import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.betweenls.fashtag.post.domain.PostVO;
import org.betweenls.fashtag.post.service.PostService;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@Slf4j
@AllArgsConstructor
@RequestMapping("/api")
public class ApiController {

    private PostService postService;
    @GetMapping("/posts")
    public ResponseEntity<List<PostVO>> getPost(@RequestParam(defaultValue = "1") Long page,
                                                 @RequestParam(defaultValue = "20") Long limit,
                                                 @RequestParam(defaultValue = "-1") Long userId,
                                                 @RequestParam(defaultValue = "popular") String order) {

        List<PostVO> posts = null;
        if (order.equals("popular")) {
            log.info("popular가 호출됨 likecount");
            posts = postService.getPostWithPaging("likeCount", userId, page, limit);
        } else if (order.equals("newest")) {
            log.info("newest가 호출됨 createdAt");
            posts = postService.getPostWithPaging("createdAt", userId, page, limit);
        }

        return ResponseEntity.ok(posts);
    }

    @GetMapping("/posts/tags")
    public ResponseEntity<List<PostVO>> getPostByHashtag(@RequestParam(defaultValue = "1") Long page,
                                                 @RequestParam(defaultValue = "20") Long limit,
                                                 @RequestParam(defaultValue = "-1") Long userId,
                                                 @RequestParam(defaultValue = "") String hashtag ) {

//        log.info("api link");
        List<PostVO> posts = postService.getPostByHashtagWithPaging(hashtag, userId, page, limit);;


        return ResponseEntity.ok(posts);
    }
}
