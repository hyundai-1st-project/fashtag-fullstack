<%--
  Created by IntelliJ IDEA.
  User: sangmin
  Date: 12/10/23
  Time: 4:49 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding="utf-8"%>
<%@include file="../includes/header.jsp"%>

<h1>로그인 화면</h1>
<form method='post' action="/login">
    <div><input type='text' name='id'></div>
    <div><input type='password' name='password'></div>
    <div><input type='submit'></div>
</form>


<%@include file="../includes/footer.jsp"%>