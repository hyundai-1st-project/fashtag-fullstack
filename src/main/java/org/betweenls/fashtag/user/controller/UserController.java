package org.betweenls.fashtag.user.controller;

import lombok.extern.log4j.Log4j;
import org.betweenls.fashtag.user.domain.CustomUser;
import org.betweenls.fashtag.user.domain.UserVO;
import org.betweenls.fashtag.user.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
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

    @GetMapping("/user/join")
    public void getJoin(){
        log.info("회원가입 페이지");
    }

    @PostMapping( "/join")
    public String postJoin(UserVO joinUser){
        log.info("회원 가입 : " + joinUser);
        userService.join(joinUser);
        return "redirect:/login";
    }

    @GetMapping("/login")
    public String login(@RequestParam(value = "error", required = false) String error,
                        @RequestParam(value = "exception", required = false) String exception,
                        Model model) {

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

    @GetMapping("/mypage")
    public String myPage(Model model) { // @AuthenticationPrincipal CustomUser customUser

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        CustomUser user = (CustomUser) authentication.getPrincipal();
        long userId = user.getUserVO().getUserId();

        log.info(user.getUserVO().getId());

        model.addAttribute("userVO", user.getUserVO());

//        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
//        if (customUser != null) {
//            // CustomUser를 이용한 작업 수행
////            UserVO userVO = customUser.getUserVO();
//            log.info(customUser.getUserVO());
//            // 사용자 정보 활용
//        }

        return "/user/mypage";
    }

    @GetMapping("/edit")
    @PreAuthorize("isAuthenticated()")
    public String edit(){
        return "/user/edit";
    }

    @PostMapping("/edit")
    @PreAuthorize("isAuthenticated()")
    public String editForm(){
        return "redirect:/mypage";
    }

}
