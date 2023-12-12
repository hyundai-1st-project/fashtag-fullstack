package org.betweenls.fashtag.post.controller;

import lombok.AllArgsConstructor;
import lombok.extern.java.Log;
import lombok.extern.slf4j.Slf4j;
import org.betweenls.fashtag.post.domain.PostVO;
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
    public String list(HttpServletRequest request, Model model, @RequestParam(name="s",defaultValue = "popular", required = false) String order) {

        String DATA_DIRECTORY = request.getServletContext().getRealPath("/resources/image/hashtag-image/");
        File dir = new File(DATA_DIRECTORY);
        File[] files = dir.listFiles();
        List<String> hashtagName = new ArrayList<>();
        List<String> hashtagExtension = new ArrayList<>();
        hashtagBarListAdd(files, hashtagName, hashtagExtension);

        List<PostVO> AllPosts = null;
        if (order.equals("popular")) {
            AllPosts = service.getAllPost("likeCount"); //좋아요 갯수 순서
        } else if (order.equals("newest")) {
            AllPosts = service.getAllPost("createdAt"); //생성일 순서
        }
        model.addAttribute("order", order);
        model.addAttribute("list", AllPosts);
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



    private static void hashtagBarListAdd(File[] files, List<String> hashtagName, List<String> hashtagExtension) {
        for (File file : files) {
            String filename = file.getName();
            hashtagName.add(FilenameUtils.getBaseName(filename));
            hashtagExtension.add(FilenameUtils.getExtension(filename));
        }
    }
}