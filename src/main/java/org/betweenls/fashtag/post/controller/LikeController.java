package org.betweenls.fashtag.post.controller;

import lombok.AllArgsConstructor;
import lombok.extern.java.Log;
import org.betweenls.fashtag.post.domain.CommentVO;
import org.betweenls.fashtag.post.domain.LikeVO;
import org.betweenls.fashtag.post.service.CommentService;
import org.betweenls.fashtag.post.service.LikeService;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@Log
@AllArgsConstructor
@RequestMapping("/api/like")
public class LikeController {
    private LikeService service;

//    @GetMapping(value ="/{postId}", produces = "application/json; charset=utf-8")
//    @ResponseBody
//    public ResponseEntity<List<CommentVO>> getCommentList(@PathVariable Long postId) {
//
//        log.info("get Comment List postId: " + postId);
//
//        return new ResponseEntity<>(service.getCommentList(postId), HttpStatus.OK);
//    }

    @PostMapping("/insert")
    public ResponseEntity<String> addLike(@RequestBody LikeVO likeRequest) {
        log.info("likeRequest: " + likeRequest);

        return service.addLike(likeRequest) == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
                : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
    }

    @PostMapping("/delete")
    public ResponseEntity<String> cancelLike(@RequestBody LikeVO likeRequest) {
        log.info("likeRequest: " + likeRequest);

        return service.cancelLike(likeRequest) == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
                : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
    }


}
