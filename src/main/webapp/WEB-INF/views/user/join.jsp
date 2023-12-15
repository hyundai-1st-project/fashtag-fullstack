<%--
  Created by IntelliJ IDEA.
  User: sangmin
  Date: 12/10/23
  Time: 5:13 AM
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
        padding: 30px 20px;
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

    input, #join-button{
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
    #join-button{
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

    .textForm input[type='text'][id='username'] {
        margin-right: 100px;
    }
    .textForm input[type='password'][id='password'] {
        margin-right: 100px;
    }

    .custom-button {
        border: none;
        background: none;
        /* 다른 스타일 필요에 따라 추가적으로 설정할 수 있습니다 */
    }
    .profile-img {
        width: 150px;
        height: 150px;
        border-radius: 50%;
    }

</style>

<form class="joinForm" role="form" method='post' action="/join" enctype="multipart/form-data">
    <h2><br/>회원가입</h2>
    <div class="textForm" id="divInputId">
        <label for='id'>아이디 <br></label>
        <div class="inputWithButton">
            <input type='text' id='id' name='id' placeholder="ex) fashionLove1">
            <input type='button' id="checkId" value="중복" />
        </div>
        <span id="idAvailability" class="availability"></span> <!-- 결과를 표시할 곳 -->
    </div>
    <div class="textForm">
        <img id="previewImage" src="/resources/image/post-new/notRegi.png" alt="이미지를 등록하세요." class="profile-img">
        <label for="profilePhoto" class="label-button">사진 선택</label>
        <input type="file" name="fileName" id="profilePhoto" style="display: none">
    </div>
    <div class="textForm">
        <label for='password'>비밀번호 <br></label>
        <input type='password' id='password' name='password' placeholder="영문, 숫자, 특수문자 조합 8~16자">
    </div>
    <div class="textForm">
        <label for='nickname'>닉네임 <br></label>
        <div class="inputWithButton">
            <input type='text' id='nickname' name='nickname' placeholder="ex) 패션꾸러기">
            <input type='button' id="checkNickname" value="중복" />
        </div>
        <span id="nicknameAvailability" class="availability"></span> <!-- 결과를 표시할 곳 -->
    </div>
    <div class="textForm">
        <label for='username'>이름 <br></label>
        <input type='text' id='username' name='username' placeholder="본명을 입력해주세요.">
    </div>
    <button id="join-button" type="submit">가입하기</button>
    <button id="cancel-button" class="custom-button" type="button" onclick="window.history.back()">취소하기</button>

</form>
<br/>
<br/>
<br/>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
    $(document).ready(function () {
        $("#profilePhoto").on("change", function () {
            var file = this.files[0];

            if (file) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $("#previewImage").attr("src", e.target.result);
                };
                reader.readAsDataURL(file);
            }
        });
    });
</script>


<script type="text/javascript">
    $(function() {
        var alertShown = false;

        $(".joinForm").submit(function(event) {
            alertShown = false;
            var id = $("#id").val();
            var password = $("#password").val();
            var nickname = $("#nickname").val();
            var username = $("#username").val();

            if (id === '' || password === '' || nickname === '' || username === '') {
                showAlert('빈 칸을 모두 채워주세요.');
                event.preventDefault();
            }

            if ($('#idAvailability').text().trim() !== '사용 가능한 아이디입니다.') {
                showAlert('아이디 중복을 확인해주세요.');
                event.preventDefault();
            }

            if ($('#nicknameAvailability').text().trim() !== '사용 가능한 닉네임입니다.') {
                showAlert('닉네임 중복을 확인해주세요.');
                event.preventDefault();
            }
        });

        $("#checkId").click(function() {
            var id = $("#id").val();

            if (id.trim() === '') {
                showAlert('아이디를 입력해주세요.');
                return;
            }

            $.ajax({
                type: 'POST',
                url: '/idcheck',
                data: { id: id },
                success: function(data) {
                    $('#idAvailability').removeClass().text('');

                    if (data === 'available') {
                        $('#idAvailability').text('사용 가능한 아이디입니다.').addClass('availability available');
                    } else if (data === 'duplicate') {
                        $('#idAvailability').text('아이디가 이미 존재합니다.').addClass('availability duplicate');
                    } else {
                        $('#idAvailability').text('서버 오류 발생').addClass('availability error');
                    }
                },
                error: function() {
                    $('#idAvailability').text('서버 요청 실패').addClass('availability error');
                }
            });
        });

        $("#checkNickname").click(function() {
            var nickname = $("#nickname").val();

            if (nickname.trim() === '') {
                showAlert('닉네임을 입력해주세요.');
                return;
            }

            $.ajax({
                type: 'POST',
                url: '/nicknamecheck',
                data: { nickname: nickname },
                success: function(data) {
                    $('#nicknameAvailability').removeClass().text('');

                    if (data === 'available') {
                        $('#nicknameAvailability').text('사용 가능한 닉네임입니다.').addClass('availability available');
                    } else if (data === 'duplicate') {
                        $('#nicknameAvailability').text('닉네임이 이미 존재합니다.').addClass('availability duplicate');
                    } else {
                        $('#nicknameAvailability').text('서버 오류 발생').addClass('availability error');
                    }
                },
                error: function() {
                    $('#nicknameAvailability').text('서버 요청 실패').addClass('availability error');
                }
            });
        });

        function showAlert(message) {
            if (!alertShown) {
                alert(message);
                alertShown = true;
            }
        }
    });

</script>


<%--<%@include file="../includes/footer.jsp"%>--%>
</body>
</html>