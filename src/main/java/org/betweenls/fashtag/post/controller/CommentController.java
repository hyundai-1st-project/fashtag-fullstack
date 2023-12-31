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
@RequestMapping("/api/comment")
public class CommentController {
    private CommentService service;

    @GetMapping(value ="/{postId}")
    @ResponseBody
    public ResponseEntity<Long> getCommentNum(@PathVariable Long postId) {
        return new ResponseEntity<>(service.getCommentNum(postId), HttpStatus.OK);
    }

    @PostMapping(value ="/{postId}")
    @ResponseBody
    public ResponseEntity<List<CommentVO>> getCommentList(@PathVariable Long postId,
                                                          @RequestParam("page") Long page,
                                                          @RequestParam("pageNum") int pageNum) {
        return new ResponseEntity<>(service.getCommentList(postId, page, pageNum), HttpStatus.OK);
    }

    @PostMapping("/insert")
    public ResponseEntity<String> insertComment(@RequestBody CommentVO commentRequest) {
        return service.insertComment(commentRequest) == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
                : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
    }

    @DeleteMapping(value = "/delete/{commentId}", produces = { MediaType.TEXT_PLAIN_VALUE })
    public ResponseEntity<String> removeComment(@PathVariable("commentId") Long commentId) {
        return service.removeComment(commentId) == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
                : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);

    }


}
