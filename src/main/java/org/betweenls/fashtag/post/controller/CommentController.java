package org.betweenls.fashtag.post.controller;

import lombok.AllArgsConstructor;
import lombok.extern.java.Log;
import org.betweenls.fashtag.post.domain.CommentVO;
import org.betweenls.fashtag.post.domain.PostVO;
import org.betweenls.fashtag.post.service.CommentService;
import org.betweenls.fashtag.post.service.DetailService;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.text.SimpleDateFormat;
import java.util.List;

@RestController
@Log
@AllArgsConstructor
@RequestMapping("comment")
public class CommentController {
    private CommentService service;

    @GetMapping(value ="/{postId}", produces = "application/json; charset=utf-8")
    @ResponseBody
    public ResponseEntity<List<CommentVO>> getCommentList(@PathVariable Long postId) {

        log.info("get Comment List postId: " + postId);

        return new ResponseEntity<>(service.getCommentList(postId), HttpStatus.OK);
    }

    @PostMapping("/insert")
    public ResponseEntity<String> insertComment(@RequestBody CommentVO commentRequest) {
        log.info("commentRequest: " + commentRequest);

        return service.insertComment(commentRequest) == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
                : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
    }

    @DeleteMapping(value = "/delete/{commentId}", produces = { MediaType.TEXT_PLAIN_VALUE })
    public ResponseEntity<String> removeComment(@PathVariable("commentId") Long commentId) {

        log.info("remove: " + commentId);

        return service.removeComment(commentId) == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
                : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);

    }


}
