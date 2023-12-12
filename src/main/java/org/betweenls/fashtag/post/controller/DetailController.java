package org.betweenls.fashtag.post.controller;

import lombok.AllArgsConstructor;
import lombok.extern.java.Log;
import org.betweenls.fashtag.post.domain.PostVO;
import org.betweenls.fashtag.post.service.DetailService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import java.text.SimpleDateFormat;

@Controller
@Log
@AllArgsConstructor
public class DetailController {
    private DetailService service;
    @GetMapping("/posts/{postId}")
    public String list(Model model, @PathVariable Long postId) {
        PostVO postDetail = service.getDetail(postId);
        model.addAttribute("post", postDetail);

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'");
        String formattedCreatedAt = sdf.format(postDetail.getCreatedAt());
        model.addAttribute("formattedCreatedAt", formattedCreatedAt);

        return "community/detail";
    }
}
