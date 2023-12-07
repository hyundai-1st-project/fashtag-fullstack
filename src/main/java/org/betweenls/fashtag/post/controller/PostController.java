package org.betweenls.fashtag.post.controller;

import lombok.AllArgsConstructor;
import lombok.extern.java.Log;
import org.betweenls.fashtag.post.service.PostService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Controller
@Log
@AllArgsConstructor
public class PostController {
    private PostService service;

    @GetMapping("/posts")
    public String list(Model model, @RequestParam(defaultValue = "popular", required = false) String order) {
        model.addAttribute("list", service.getAllPost()); // 모든 포스트 가져오는 것
        // to-do 페이징 처리해서 requestparam에 따라 다른 정렬 순서 ㄱㄱ
        List<String> hashtagList = new ArrayList<>(Arrays.asList
                ("#오뭐입", "#오오티디", "#김태희룩", "#얼죽코", "#패딩추천", "#겨울 핫트렌드","#꾸안꾸", "#나나누누"));
        model.addAttribute("hashtagList", hashtagList);
        return "community/posts";
    }
}