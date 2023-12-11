package org.betweenls.fashtag.post.controller;

import lombok.AllArgsConstructor;
import lombok.extern.java.Log;
import lombok.extern.slf4j.Slf4j;
import org.betweenls.fashtag.post.service.PostService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.apache.commons.io.FilenameUtils;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;


@Controller
@Slf4j
@AllArgsConstructor
public class PostController {
    private PostService service;

    @GetMapping("/posts")
    public String list(HttpServletRequest request, Model model, @RequestParam(defaultValue = "popular", required = false) String order) {

        // to-do 페이징 처리해서 requestparam에 따라 다른 정렬 순서 ㄱㄱ
        String DATA_DIRECTORY = request.getServletContext().getRealPath("/resources/image/hashtag-image/");
        File dir = new File(DATA_DIRECTORY);
        File[] files = dir.listFiles();
        if (files == null) {
            log.info("files null");
        }

        List<String> hashtagName = new ArrayList<>();
        List<String> hashtagExtension = new ArrayList<>();
        for (File file : files) {
            String filename = file.getName();
            hashtagName.add(FilenameUtils.getBaseName(filename));
            hashtagExtension.add(FilenameUtils.getExtension(filename));
        }

        model.addAttribute("list", service.getAllPost()); // 모든 포스트 가져오는 것
        model.addAttribute("pageTitle", "#POSTS");
        model.addAttribute("hashtagName", hashtagName);
        model.addAttribute("hashtagExtension", hashtagExtension);

        return "community/posts";
    }

    @GetMapping("/posts/tags/{hashtag}")
    public String list(Model model,
                       @RequestParam(defaultValue = "popular", required = false) String order,
                       @PathVariable("hashtag") String hashtag) {

        hashtag= "#" + hashtag;
        model.addAttribute("list", service.getHashtagPost(hashtag));
        model.addAttribute("pageTitle", hashtag);
        return "community/posts";
    }
}