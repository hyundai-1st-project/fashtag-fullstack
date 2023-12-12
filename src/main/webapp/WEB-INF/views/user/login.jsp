<%--
  Created by IntelliJ IDEA.
  User: sangmin
  Date: 12/10/23
  Time: 4:49 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding="utf-8"%>
<%@include file="../includes/header.jsp"%>

<style>

    .loginForm h2 {
        text-align: center;
        margin-top: 100px;
    }

    .loginForm h5 {
        text-align: center;
        margin-top: 10px;
        font-size: 14px;
        color: red;
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

    /* 가로 레이아웃을 위한 새로운 CSS */
    .horizontal-container {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-top: 10px; /* 여유 공간 조정 */
    }

    /* 체크박스와 링크에 대한 스타일 조정 */
    .horizontal-container input[type='checkbox'],
    .horizontal-container a {
        flex: 1; /* 사용 가능한 공간을 차지하도록 설정 */
    }
</style>

<form class="loginForm" method='post' action="/login">
    <h2>로그인</h2>

    <h5><c:out value="${exception}"/></h5>

    <div class="textForm">
        <label>아이디 <br></label>
        <input class="login-need" type='text' name="id" placeholder="아이디">
    </div>
    <div class="textForm">
        <label>비밀번호 <br></label>
        <input class="login-need" type='password' name="password" placeholder="비밀번호">
    </div>

    <div class="textForm" style="border-bottom: 0">
        <div class="horizontal-container">
            <div>
                <input type='checkbox' name='remember-me'> 로그인 유지하기
            </div>
            <div>
                <a href="/join">회원 가입</a>
            </div>
        </div>
    </div>
    <button id="login-button" type="submit">로그인</button>

</form>

<script>
    document.querySelector('.loginForm').addEventListener('submit', function(event) {
        var id = document.querySelector('.login-need[name="id"]').value.trim();
        var password = document.querySelector('.login-need[name="password"]').value.trim();

        if (id === '' || password === '') {
            event.preventDefault(); // 폼 제출 중단
            alert('빈 칸을 모두 채워주세요.');
        }
    });
</script>

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