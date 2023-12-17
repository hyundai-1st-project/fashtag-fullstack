package org.betweenls.fashtag.post.controller;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.betweenls.fashtag.global.s3.S3UploaderService;
import org.betweenls.fashtag.post.domain.PostVO;
import org.betweenls.fashtag.post.service.DetailService;
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
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;


@Controller
@Slf4j
@AllArgsConstructor
public class PostController {
    private PostService postService;
    private UserService userService;
    private DetailService detailService;
    private S3UploaderService s3UploaderService;


    @GetMapping("/posts")
    public String list(HttpServletRequest request, Model model, @RequestParam(name="s",defaultValue = "popular", required = false) String order) {


        UserVO user = userService.loginCheck();
        Long userId = -1L;
        if (user != null) {
            userId = user.getUserId();
        }

        List<PostVO> AllPosts = null;
        if (order.equals("popular")) {
            AllPosts = postService.getPostWithPaging("likeCount", userId,0L,20L); //좋아요 갯수 순서
        } else if (order.equals("newest")) {
            AllPosts = postService.getPostWithPaging("createdAt", userId,0L,20L); //생성일 순서
        }

        String DATA_DIRECTORY = request.getServletContext().getRealPath("/resources/image/hashtag-image/");
        File dir = new File(DATA_DIRECTORY);
        File[] files = dir.listFiles();
        List<String> hashtagName = new ArrayList<>();
        List<String> hashtagExtension = new ArrayList<>();
        hashtagBarListAdd(files, hashtagName, hashtagExtension);
        model.addAttribute("userId", userId);
        model.addAttribute("url", s3UploaderService.getUrl());
        model.addAttribute("order", order);
        model.addAttribute("list", AllPosts);
        model.addAttribute("pageTitle", "#POSTS");
        model.addAttribute("hashtagName", hashtagName);
        model.addAttribute("hashtagExtension", hashtagExtension);

        return "community/posts";
    }

    @GetMapping("/posts/tags/{hashtag}")
    public String list(HttpServletRequest request ,Model model,
                       @RequestParam(defaultValue = "popular", required = false) String order,
                       @PathVariable("hashtag") String hashtag) {

        String DATA_DIRECTORY = request.getServletContext().getRealPath("/resources/image/hashtag-image/");
        File dir = new File(DATA_DIRECTORY);
        File[] files = dir.listFiles();
        List<String> hashtagName = new ArrayList<>();
        List<String> hashtagExtension = new ArrayList<>();
        hashtagBarListAdd(files, hashtagName, hashtagExtension);
        hashtag= "#" + hashtag;
        UserVO user = userService.loginCheck();
        Long userId = -1L;
        if (user != null) {
            userId = user.getUserId();
        }
        model.addAttribute("userId", userId);
        model.addAttribute("list", postService.getPostByHashtagWithPaging(hashtag,userId, 0L,20L));
        model.addAttribute("pageTitle", hashtag);
        model.addAttribute("url", s3UploaderService.getUrl());
        model.addAttribute("hashtagName", hashtagName);
        model.addAttribute("hashtagExtension", hashtagExtension);
        return "community/posts";
    }

    @PostMapping("/posts")
    public String register(PostVO postVO, MultipartFile uploadFile) throws IOException {

        UserVO user = userService.loginCheck();
        if (user == null) {
            return "/login";
        }
        String dirName = "posts/post-upload-image";  // 폴더 이름
        UUID uuid = UUID.randomUUID();
        String basicFileName = uuid.toString() + "_" + uploadFile.getOriginalFilename(); // 파일 이름
        postVO.setPicture(s3UploaderService.convertFile(uploadFile, dirName, basicFileName));
        postVO.setUserId(user.getUserId());
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




    @PostMapping("/posts/{postId}")
    public String delete(@PathVariable Long postId) {
        postService.deletePostWithForeignKey(postId);
        return "redirect:/posts?s=newest";
    }

    @GetMapping("/posts/update/{postId}")
    public String update(@PathVariable Long postId, Model model) {
        PostVO postDetail = detailService.getPostDetail(postId);
        model.addAttribute("post", postDetail);

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'");
        String formattedCreatedAt = sdf.format(postDetail.getCreatedAt());
        model.addAttribute("formattedCreatedAt", formattedCreatedAt);
        UserVO userVO = userService.loginCheck();
        model.addAttribute("user", userVO);
        model.addAttribute("url", s3UploaderService.getUrl());
        return "community/update";
    }
    @PostMapping("/posts/update/{postId}")
    public String update(@PathVariable Long postId, PostVO postVO, MultipartFile uploadFile) throws IOException {

        UserVO user = userService.loginCheck();
        if (user == null) {
            return "/login";
        }

        if (!uploadFile.isEmpty()) {
            String dirName = "posts/post-upload-image";  // 폴더 이름
            UUID uuid = UUID.randomUUID();
            String basicFileName = uuid.toString() + "_" + uploadFile.getOriginalFilename(); // 파일 이름
            postVO.setPicture(s3UploaderService.convertFile(uploadFile, dirName, basicFileName));
        }
        postVO.setUserId(user.getUserId());
        postService.updatePost(postVO);
        postService.deletePost_hashtagByPostId(postId);
        linkPostHashtag(postVO);
        return "redirect:/posts/"+postId;
    }




    private void insertPostAndHashtag(PostVO postVO) {
        postService.insertPost(postVO);
        linkPostHashtag(postVO);
    }

    private void linkPostHashtag(PostVO postVO) {
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