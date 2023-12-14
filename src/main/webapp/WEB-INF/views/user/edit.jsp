<%--
  Created by IntelliJ IDEA.
  User: sangmin
  Date: 12/11/23
  Time: 10:09 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding="utf-8"%>
<%@include file="../includes/header.jsp"%>

<style>

    .joinForm h2 {
        text-align: center;
        margin-top: 100px;
    }

    .joinForm {
        position:absolute;
        width:400px;
        height:580px;
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

    .textForm input[type='text'][id='username'] {
        margin-right: 100px;
    }
    .textForm input[type='password'][id='password'] {
        margin-right: 100px;
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

    .availability {
        color: black; /* 기본 색상 */
    }

    .availability.available {
        color: green; /* 사용 가능한 아이디일 때의 색상 */
    }

    .availability.duplicate {
        color: red; /* 중복된 아이디일 때의 색상 */
    }

    .availability.error {
        color: orange; /* 서버 오류 발생 시의 색상 */
    }

    .inputWithButton {
        display: flex;
        align-items: center;
    }

    /* 버튼 배경색 없애기 */
    .inputWithButton input[type='button'] {
        width: 60px; /* 원하는 너비로 조절 */
        height: 30px; /* 원하는 높이로 조절 */
        font-size: 12px; /* 버튼 글꼴 크기 조절 */
        border: none;
    }

    .custom-button {
        border: none;
        background: none;
        /* 다른 스타일 필요에 따라 추가적으로 설정할 수 있습니다 */
    }

</style>


<form class="joinForm" role="form" method='post' action="/edit" enctype="multipart/form-data">
    <h2><br/>회원정보 수정</h2>
    <div class="textForm" id="divInputId">
        <label for='id'>아이디 <br></label>
        <div class="inputWithButton">
            <input type='text' id='id' name='id' value="${user.id}" placeholder="ex) fashionLove1">
            <input type='button' id="checkId" value="중복" />
        </div>
        <span id="idAvailability" class="availability"></span> <!-- 결과를 표시할 곳 -->
    </div>
    <div class="textForm">
        <label for="profilePhoto">프로필사진</label>
        <input type="file" id="profilePhoto" value="${user.profile}" name="fileName">
    </div>
    <div class="textForm">
        <label for='password'>비밀번호 <br></label>
        <input type='password' id='password' name='password' placeholder="영문, 숫자, 특수문자 조합 8~16자">
    </div>
    <div class="textForm">
        <label for='nickname'>닉네임 <br></label>
        <div class="inputWithButton">
            <input type='text' id='nickname' name='nickname' value="${user.nickname}" placeholder="ex) 패션꾸러기">
            <input type='button' id="checkNickname" value="중복" />
        </div>
        <span id="nicknameAvailability" class="availability"></span> <!-- 결과를 표시할 곳 -->
    </div>
    <div class="textForm">
        <label for='username'>이름 <br/></label>
        <input type='text' id='username' name='username' value="${user.username}" placeholder="본명을 입력해주세요.">
    </div>
    <button id="join-button" type="submit">수정하기</button>

    <button id="cancel-button" class="custom-button" type="button" onclick="window.history.back()">취소하기</button>
    <button id="withdrawButton" class="custom-button">탈퇴하기</button>

    <input type="hidden" id="userId" value="${user.userId}" />
</form>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    $(document).ready(function() {
        // 탈퇴하기 버튼 클릭 시
        $('#withdrawButton').on('click', function() {
            var response = confirm('정말 탈퇴하시겠습니까?');
            if (response) { // 사용자에게 확인 메시지 표시
                withdrawUser(); // 탈퇴 처리 함수 호출
            }
        });

        // 탈퇴 처리 함수
        function withdrawUser() {
            var userId = $("#userId").val();
            alert("ddddd");
            $.ajax({
                url: `/withdraw/${userId}`,
                type: 'DELETE',
                success: function(data) {
                    alert(data.key);
                },
                error: function(data) {
                    alert(`${data.key}`); // 서버 오류 시 처리
                }
            });
        }
    });
</script>

<%--<%@include file="../includes/footer.jsp"%>--%>
</body>
</html>