package org.betweenls.fashtag.user.controller;

import lombok.extern.log4j.Log4j;
import org.betweenls.fashtag.user.domain.UserVO;
import org.betweenls.fashtag.user.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
@Log4j
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

    @GetMapping("/test")
    public void test(){
        log.info("테스트");
        userService.test();
    }

    @GetMapping(value = "/join")
    public void getJoin(){
        log.info("회원가입 페이지");
    }

    @PostMapping( "/join")
    public @ResponseBody String postJoin(UserVO joinUser){
        log.info("회원 가입 : " + joinUser);
        userService.join(joinUser);
        return "join";
    }

    @GetMapping("/login")
    public String getLogin(){
        return "/user/login";
    }

    @GetMapping("/my")
    public String myPage(){
        UserVO userVO = userService.getUserDetail(10020);
        log.info(userVO);
        return "/user/mypage";
    }

}
