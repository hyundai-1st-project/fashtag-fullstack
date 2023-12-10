<%--
  Created by IntelliJ IDEA.
  User: sangmin
  Date: 12/10/23
  Time: 5:03 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding="utf-8"%>
<%@include file="../includes/header.jsp"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<h1>마이페이지</h1>

<p>principal : <sec:authentication property="principal"/></p>


<p>UserVO : <sec:authentication property="principal.userVO"/></p>
<%--<p>사용자이름 : <sec:authentication property="principal.userVO"/></p>--%>
<%--<p>사용자아이디 : <sec:authentication property="principal.userVO.id"/></p>--%>

<%--<p>사용자 권한 리스트 : <sec:authentication property="principal.member.authList"/></p>--%>

<%@include file="../includes/footer.jsp"%>