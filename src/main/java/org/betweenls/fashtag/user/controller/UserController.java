package org.betweenls.fashtag.user.controller;

import lombok.extern.log4j.Log4j;
import org.betweenls.fashtag.user.domain.CustomUser;
import org.betweenls.fashtag.user.domain.UserVO;
import org.betweenls.fashtag.user.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

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
    public String postJoin(UserVO joinUser){
        log.info("회원 가입 : " + joinUser);
        userService.join(joinUser);
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

//        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
//        CustomUser user = (CustomUser) authentication.getPrincipal();
//        long userId = user.getUserVO().getUserId();


        UserVO userVO = userService.getUserByUserId(userId);
        model.addAttribute("userVO", userVO);

        log.info(userId);

        return "/user/mypage";
    }

    @GetMapping("/user/{userId}/edit")
    public String edit(@PathVariable Long userId,
                       Model model){
        // 현재 edit 페이지에 접근한 유저가 나인지 판별

        // 내가 현재 로그인한 사용자의 정보


        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication != null && "anonymousUser".equals(authentication.getPrincipal())) {
            // 사용자는 인증되지 않음
            // 로그인 페이지로 리디렉션하거나 인증을 유도할 수 있음
        }else{
            UserVO user = ((CustomUser) authentication.getPrincipal()).getUserVO();
            long getUserId = user.getUserId();
        }
        if (authentication == null) {


//            // 내가 접속한 페이지의 유저 정보
//            UserVO userVO = userService.getUserByUserId(userId);
//            if(getUserId != userVO.getUserId()){
//
//            }
        }

        return "/user/edit";
    }

    @PostMapping("/edit")
    @PreAuthorize("isAuthenticated()")
    public String editForm(){
        return "redirect:/mypage";
    }

}
