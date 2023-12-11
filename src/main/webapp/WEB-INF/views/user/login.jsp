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

<style>

    .loginForm h2 {
        text-align: center;
        margin-top: 100px;
    }

    .loginForm {
        position:absolute;
        width:400px;
        height:400px;
        padding: 30px, 20px;
        background-color:#FFFFFF;
        text-align:center;
        top:40%;
        left:50%;
        transform: translate(-50%,-50%);
        border-radius: 15px;
    }

    .textForm {
        border-bottom: 2px solid rgba(204, 204, 204, 0.74);
        margin: 15px 30px; /* Adjusted margin */
        padding: 5px 10px; /* Adjusted padding */
    }

    /* Left-align labels */
    label {
        display: block;
        width: 100px; /* Adjust this width as needed */
        text-align: left;
        margin-bottom: 5px;
    }

    .login-need {
        width: calc(100% - 22px);
        border: 0;
        outline: none;
        color: #636e72;
        font-size: 16px;
        height: 25px;
        background: none;
    }

    .login-need::placeholder {
        color: #ccc; /* Lighter color for placeholder text */
    }

    #login-button {
        width: calc(100% - 22px); /* Adjusted width */
        height: 45px;
        border: 0;
        background-color: rgba(204, 204, 204, 0.74);
        color: white;
        padding: 8px 0; /* Adjusted padding */
        border-radius: 3px;
        cursor: pointer;
        margin-top: 10px; /* Added margin for spacing */
    }
</style>

<form class="loginForm" method='post' action="/login">
    <h2>로그인</h2>
    <div class="textForm">
        <label>아이디 <br></label>
        <input class="login-need" type='text' name="id" placeholder="아이디">
    </div>
    <div class="textForm">
        <label>비밀번호 <br></label>
        <input class="login-need" type='password' name="password" placeholder="비밀번호">
    </div>

    <div>
        <input type='checkbox' name='remember-me'> 로그인 유지하기
    </div>
    <button id="login-button" type="submit">로그인</button>
</form>
<%--<h1>로그인 화면</h1>--%>
<%--<form method='post' action="/login">--%>
<%--    <div><input type='text' name="id" placeholder="아이디"></div>--%>
<%--    <div><input type='password' name="password" placeholder="비밀번호"></div>--%>
<%--    <div><input type='checkbox' name='remember-me'> 로그인 유지하기 </div>--%>
<%--    <div><input type='submit'></div>--%>
<%--&lt;%&ndash;    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">&ndash;%&gt;--%>
<%--</form>--%>

</body>
</html>