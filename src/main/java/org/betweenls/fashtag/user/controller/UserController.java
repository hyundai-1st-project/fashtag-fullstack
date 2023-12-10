package org.betweenls.fashtag.user.controller;

import lombok.extern.log4j.Log4j;
import org.betweenls.fashtag.user.domain.UserVO;
import org.betweenls.fashtag.user.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@Log4j
public class UserController {

    @Autowired
    private UserService userService;

    @GetMapping("/test")
    public void test(){
        log.info("테스트");
        userService.test();
    }

    @GetMapping("/join")
    public void getJoin(){
        log.info("회원가입 페이지");
    }

    @PostMapping( "/join")
    public @ResponseBody String postJoin(UserVO joinUser){
        log.info("회원 가입 : " + joinUser);
        userService.join(joinUser);
        return "/user/login";
    }

    @GetMapping("/login")
    public String login(String error, String logout, Model model){
        log.info("error : " + error);
        log.info("logout : " + logout);
        if(error != null) {
            model.addAttribute("error", "Login Error Check Your Account");
        }
        if(logout != null) {
            model.addAttribute("logout", "Logout!!");
        }
        return "/user/login";
    }

    @GetMapping("/logout")
    public void logout(){
        log.info("로그아웃");
    }

    @GetMapping("/mypage")
    public String myPage(){
        UserVO userVO = userService.getUserDetail(10020);
        log.info(userVO);
        return "/user/mypage";
    }

}
