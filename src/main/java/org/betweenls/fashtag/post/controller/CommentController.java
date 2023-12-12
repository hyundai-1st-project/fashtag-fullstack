package org.betweenls.fashtag.post.controller;

import lombok.AllArgsConstructor;
import lombok.extern.java.Log;
import org.betweenls.fashtag.post.domain.CommentVO;
import org.betweenls.fashtag.post.domain.PostVO;
import org.betweenls.fashtag.post.service.CommentService;
import org.betweenls.fashtag.post.service.DetailService;
import org.springframework.http.HttpStatus;
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
    @GetMapping(value ="/list/{postId}", produces = "application/json; charset=utf-8")
    @ResponseBody
    public ResponseEntity<List<CommentVO>> getCommentList(Model model, @PathVariable Long postId) {

        log.info("get Comment List postId: " + postId);

        return new ResponseEntity<>(service.getCommentList(postId), HttpStatus.OK);
    }
}
