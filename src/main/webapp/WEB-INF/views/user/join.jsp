<%--
  Created by IntelliJ IDEA.
  User: sangmin
  Date: 12/10/23
  Time: 5:13 AM
  To change this template use File | Settings | File Templates.
--%>

<%@ page pageEncoding="utf-8"%>
<%@include file="../includes/header.jsp"%>

<h1>회원가입 화면</h1>
<form role="form" method='post' action="/user/join">
    <div>아이디 : <label for='id'></label><input type='text' id='id' name='id'></div>
    <div>비밀번호 : <input type='password' id='password' name='password'></div>
    <div>닉네임 : <input type='text' id='nickname' name='nickname'></div>
    <div>이름 : <input type='text' id='username' name='username'></div>
    <button>가입하기</button>
</form>

</body>
</html>

<%@include file="../includes/footer.jsp"%>
