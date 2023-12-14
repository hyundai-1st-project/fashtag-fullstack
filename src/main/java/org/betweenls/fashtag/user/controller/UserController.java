package org.betweenls.fashtag.user.controller;

import lombok.extern.log4j.Log4j;
import org.betweenls.fashtag.user.domain.EditUserVO;
import org.betweenls.fashtag.user.domain.MyPageVO;
import org.betweenls.fashtag.user.domain.UserVO;
import org.betweenls.fashtag.user.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

@Controller
@Log4j
public class UserController {

    @Autowired
    private UserService userService;

    @GetMapping("/join")
    public String getJoin(){
        log.info("회원가입 페이지");
        return "/user/join";
    }

    @PostMapping( "/join")
    public String postJoin(UserVO joinUser, @RequestParam("fileName") MultipartFile file) throws IOException {
        log.info("회원 가입 : " + joinUser);
        userService.join(joinUser,file);
        return "redirect:/login";
    }

    @PostMapping("/idcheck")
    public ResponseEntity<String> idcheck(@RequestParam("id") String id) {
        int cnt = userService.idcheck(id); // 1 : 아이디 존재
        log.info(cnt);
        if (cnt == 0) {
            return new ResponseEntity<>("available", HttpStatus.OK);
        } else {
            return new ResponseEntity<>("duplicate", HttpStatus.OK);
        }
    }

    @PostMapping("/nicknamecheck")
    public ResponseEntity<String> nicknameCheck(@RequestParam("nickname") String nickname) {
        int cnt = userService.nicknameCheck(nickname); // 1 : nickname
        log.info(cnt);
        if (cnt == 0) {
            return new ResponseEntity<>("available", HttpStatus.OK);
        } else {
            return new ResponseEntity<>("duplicate", HttpStatus.OK);
        }
    }

    @GetMapping("/login")
    public String login(@RequestParam(value = "error", required = false) String error,
                        @RequestParam(value = "exception", required = false) String exception,
                        Model model) {

        UserVO loginUser = userService.loginCheck();
        if(loginUser != null){
            return "redirect:/posts";
        }

        if ("true".equals(error)) {
            model.addAttribute("error", error);
            model.addAttribute("exception", exception);
        }
        return "/user/login";
    }

    @GetMapping("/logout")
    public void logout(){
        log.info("로그아웃");
    }

    @GetMapping("/mypage/{userId}")
    public String myPage(Model model, @PathVariable Long userId) { // @AuthenticationPrincipal CustomUser customUser
        UserVO userVO = userService.getUserByUserId(userId);
        String title = "#"+userVO.getNickname();
        MyPageVO myPage = userService.getMyPage(userVO);
        model.addAttribute("myPage", myPage);
        model.addAttribute("pageTitle", title);

        return "/user/mypage";
    }

    @GetMapping("/user/{userId}/edit")
    public String edit(@PathVariable Long userId, Model model){
        UserVO loginUser = userService.loginCheck();
        if(loginUser.getUserId() != userId){
            // 로직 처리
        }
        model.addAttribute("user", loginUser);
        return "/user/edit";
    }

    @PostMapping("/edit")
    public String editUser(EditUserVO editUserVO,
                           @RequestParam("fileName") MultipartFile file,
                           RedirectAttributes rttr) throws IOException {
        boolean updateSuccess = userService.editUser(editUserVO, file);

        if (updateSuccess) {
            rttr.addFlashAttribute("successMessage", "수정이 완료되었습니다.");
        } else {
            rttr.addFlashAttribute("errorMessage", "수정을 실패했습니다");
        }
        return "redirect:/posts";
    }

    @DeleteMapping(value = "/withdraw/{userId}", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    public @ResponseBody ResponseEntity<Map<String , String>> deleteUser(@PathVariable long userId,
                                                                         HttpSession httpSession){
        UserVO loginUser = userService.loginCheck();
        Map<String , String> map = new HashMap<>();
        try {
            if (loginUser.getUserId() != userId) {
                return null;
            }
            String result = "";
            if (userService.deleteUser(loginUser)) {
                result = "탈퇴되었습니다";
                httpSession.invalidate(); // 세션 삭제
            }
            map.put("key", result);
            return ResponseEntity.ok(map);
        }catch (Exception e){
            map.put("key", e.getMessage());
            return ResponseEntity.badRequest().body(map);
        }
    }

}
