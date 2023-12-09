package org.betweenls.fashtag.user.controller;

import lombok.extern.java.Log;
import org.betweenls.fashtag.user.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
@Log
public class UserController {

    @Autowired
    private UserService userService;

    @GetMapping("/test")
    public void test(){
        log.info("테스트");
        userService.test();
    }

    @GetMapping("/login")
    public String login(){
        return "/user/login";
    }

    @GetMapping("/my")
    public String myPage(){
        return "/user/mypage";
    }

}
