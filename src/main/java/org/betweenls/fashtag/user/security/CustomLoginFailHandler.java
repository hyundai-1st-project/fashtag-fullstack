package org.betweenls.fashtag.user.security;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lombok.extern.log4j.Log4j;
import org.springframework.security.authentication.*;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationFailureHandler;
import org.springframework.stereotype.Service;

@Log4j
public class CustomLoginFailHandler extends SimpleUrlAuthenticationFailureHandler {

    @Override
    public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
                                        AuthenticationException exception) throws IOException, ServletException {

        log.error("Access Denied Handler");
        log.error("Redirect....");

        String errorMessage;
        if(exception instanceof UsernameNotFoundException){
            errorMessage = "*존재하지 않는 계정입니다. 회원가입 후 로그인해주세요.";
        } else if (exception instanceof BadCredentialsException) {
            errorMessage = "*아이디 또는 비밀번호가 맞지 않습니다. 다시 확인해주세요.";
        } else if (exception instanceof InternalAuthenticationServiceException) {
            errorMessage = "*내부 시스템 문제로 로그인 요청을 처리할 수 없습니다. 관리자에게 문의하세요.";
        } else if (exception instanceof AuthenticationCredentialsNotFoundException) {
            errorMessage = "*인증 요청이 거부되었습니다. 관리자에게 문의하세요.";
        } else {
            errorMessage = "*알 수 없는 오류로 로그인 요청을 처리할 수 없습니다. 관리자에게 문의하세요.";
        }

        log.info("failureHandler : " + errorMessage);

        errorMessage = URLEncoder.encode(errorMessage, "UTF-8"); /* 한글 인코딩 깨지는 문제 방지 */
        setDefaultFailureUrl("/login?error=true&exception=" + errorMessage);
        super.onAuthenticationFailure(request, response, exception);
    }

}