<%--
  Created by IntelliJ IDEA.
  User: sangmin
  Date: 12/11/23
  Time: 10:09 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding="utf-8"%>
<%@include file="../includes/header.jsp"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<style>

    .joinForm h2 {
        text-align: center;
        margin-top: 100px;
    }

    .joinForm {
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

    input, #join-button {
        width: calc(100% - 22px); /* Adjusted width */
        border: 0;
        outline: none;
        color: #636e72;
        font-size: 16px;
        height: 25px;
        background: none;
    }

    input::placeholder {
        color: #ccc; /* Lighter color for placeholder text */
    }
    #join-button {
        width: calc(100% - 22px); /* Adjusted width */
        height: 45px;
        background-color: rgba(204, 204, 204, 0.74);
        color: white;
        padding: 8px 0; /* Adjusted padding */
        border-radius: 3px;
        cursor: pointer;
        margin-top: 10px; /* Added margin for spacing */
    }
</style>

<p>principal : <sec:authentication property="principal"/></p>
<p>UserVO : <sec:authentication property="principal.userVO"/></p>

<form class="joinForm" role="form" method='post' action="/join">
    <h2>회원 정보 수정</h2>
    <div class="textForm">
        <label for='id'>아이디 <br></label>
        <input type='text' id='id' name='id' value="< ">
    </div>
    <div class="textForm">
        <label for='password'>비밀번호 <br></label>
        <input type='password' id='password' name='password' placeholder="영문, 숫자, 특수문자 조합 8~16자">
    </div>
    <div class="textForm">
        <label for='nickname'>닉네임 <br></label>
        <input type='text' id='nickname' name='nickname' placeholder="ex) 패션꾸러기">
    </div>
    <div class="textForm">
        <label for='username'>이름 <br></label>
        <input type='text' id='username' name='username' placeholder="본명을 입력해주세요.">
    </div>
    <button id="join-button" type="submit">수정완료</button>
</form>

<%--<%@include file="../includes/footer.jsp"%>--%>
</body>
</html>