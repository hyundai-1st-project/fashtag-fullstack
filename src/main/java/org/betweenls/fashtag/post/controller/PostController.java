package org.betweenls.fashtag.post.controller;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.betweenls.fashtag.global.s3.S3UploaderService;
import org.betweenls.fashtag.post.domain.PostVO;
import org.betweenls.fashtag.post.service.PostService;
import org.betweenls.fashtag.user.domain.UserVO;
import org.betweenls.fashtag.user.service.UserService;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.apache.commons.io.FilenameUtils;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;


@Controller
@Slf4j
@AllArgsConstructor
public class PostController {
    private PostService postService;
    private UserService userService;
    private S3UploaderService s3UploaderService;


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
            AllPosts = postService.getAllPost("likeCount"); //좋아요 갯수 순서
        } else if (order.equals("newest")) {
            AllPosts = postService.getAllPost("createdAt"); //생성일 순서
        }

        model.addAttribute("url", s3UploaderService.getUrl());
        model.addAttribute("order", order);
        model.addAttribute("list", AllPosts);
        model.addAttribute("pageTitle", "#POSTS");
        model.addAttribute("hashtagName", hashtagName);
        model.addAttribute("hashtagExtension", hashtagExtension);

        return "community/posts";
    }

    @PostMapping("/posts")
    public String register(HttpServletRequest request, PostVO postVO, MultipartFile uploadFile) throws IOException {

        UserVO user = userService.loginCheck();
        if (user == null) {
            return "/login";
        }

        String dirName = "posts/post-upload-image";  // 폴더 이름
        UUID uuid = UUID.randomUUID();
        String basicFileName = uuid.toString() + "_" + uploadFile.getOriginalFilename(); // 파일 이름
//        String courseTitlePhotoKey = s3UploaderService.uploadMultipartFile(uploadFile, dirName, basicFileName);
//        postVO.setPicture(postService.uploadFile(uploadFile, request));
        postVO.setPicture(s3UploaderService.convertFile(uploadFile, dirName, basicFileName));
        postVO.setUserId(user.getUserId());
        log.info(postVO.toString());
        insertPostAndHashtag(postVO);

        return "redirect:/posts?s=newest";
    }

    @GetMapping("/posts/new")
    @PreAuthorize("isAuthenticated()")
    public String NewPosts(Model model) {
        UserVO user = userService.loginCheck();
        model.addAttribute("user", user);
        return "community/new";
    }

    @GetMapping("/posts/tags/{hashtag}")
    public String list(Model model,
                       @RequestParam(defaultValue = "popular", required = false) String order,
                       @PathVariable("hashtag") String hashtag) {

        hashtag= "#" + hashtag;
        model.addAttribute("list", postService.getHashtagPost(hashtag));
        model.addAttribute("pageTitle", hashtag);
        return "community/posts";
    }

    @PostMapping("/posts/{postId}")
    public String delete(@PathVariable Long postId) {

        postService.deletePostWithForeignKey(postId);
        return "redirect:/posts?s=newest";
    }




    private void insertPostAndHashtag(PostVO postVO) {
        postService.insertPost(postVO);
        List<String> hashtags = postVO.getHashtags();
        if (hashtags != null) {
            for (String hashtag : hashtags) {
                if (postService.getHashtagIdByHashtagName(hashtag) == null) {
                    postService.insertHashtag(hashtag);
                }
                Long hashtagId = postService.getHashtagIdByHashtagName(hashtag);
                postService.insertPost_hashtag(postVO.getPostId(), hashtagId);
            }
        }
    }
    private static void hashtagBarListAdd(File[] files, List<String> hashtagName, List<String> hashtagExtension) {
        for (File file : files) {
            String filename = file.getName();
            hashtagName.add(FilenameUtils.getBaseName(filename));
            hashtagExtension.add(FilenameUtils.getExtension(filename));
        }
    }
}