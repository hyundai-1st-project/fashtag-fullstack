<%--
  Created by IntelliJ IDEA.
  User: sangmin
  Date: 12/10/23
  Time: 4:49 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding="utf-8"%>
<%@include file="../includes/header.jsp"%>

<h2><c:out value="${error}"/></h2>
<h2><c:out value="${logout}"/></h2>

<h1>로그인 화면</h1>
<form method='post' action="/login">
    <div><input type='text' name="id" placeholder="아이디"></div>
    <div><input type='password' name="password" placeholder="비밀번호"></div>
    <div><input type='submit' value="로그인"></div>
</form>


<%@include file="../includes/footer.jsp"%>