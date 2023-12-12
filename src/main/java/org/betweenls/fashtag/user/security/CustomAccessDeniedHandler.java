package org.betweenls.fashtag.user.security;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.web.access.AccessDeniedHandler;
import org.springframework.stereotype.Service;

public class CustomAccessDeniedHandler implements AccessDeniedHandler{
    @Override
    public void handle(HttpServletRequest request, HttpServletResponse response,
                       AccessDeniedException accessDeniedException) throws IOException, ServletException {
        response.sendRedirect("/login");

    }

//    @Override
//    public void handle(HttpServletRequest request,
//                       HttpServletResponse response,
//                       AccessDeniedException accessDeniedException) throws IOException, ServletException {
//        // TODO Auto-generated method stub
//        if(accessDeniedException instanceof AccessDeniedException) {
//            request.setAttribute("error", "접근 권한이 없는 계정입니다.");
//        }
//        RequestDispatcher dispatcher = request.getRequestDispatcher("/login");
//        dispatcher.forward(request, response);
//    }

}