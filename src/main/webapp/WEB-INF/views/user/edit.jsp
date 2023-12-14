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

    /* 아이콘을 버튼 안에 가운데 정렬하기 위한 스타일 */
    .revertButton {
        background-color: transparent;
        border: none;
        color: #a49e9e; /* 버튼 색상 */
        padding: 3px; /* 버튼 내부 패딩 */
        text-align: center;
        text-decoration: none;
        display: inline-block;
        font-size: 14px; /* 폰트 크기 */
        margin: 4px 2px;
        cursor: pointer;
        border-radius: 4px;
    }

    /* 마우스 호버 효과 */
    .revertButton:hover {
        color: #555; /* 호버 시 버튼 색상 변경 */
    }
</style>


<form class="joinForm" role="form" method='post' action="/edit" enctype="multipart/form-data">
    <h2><br/>회원정보 수정</h2>
    <div class="textForm" id="divInputId">
        <label for='id'>아이디 <br></label>
        <div class="inputWithButton">
            <input type='text' id='id' name='id' value="${user.id}" placeholder="ex) fashionLove1">
            <button id="revertIdButton" type="button" class="revertButton">
                <i class="fas fa-undo fa-lg"></i>
            </button>

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
        <label for='password'>비밀번호 확인 <br></label>
        <input type='password' id='password2' name='password' placeholder="영문, 숫자, 특수문자 조합 8~16자">
    </div>
    <div class="textForm">
        <label for='nickname'>닉네임 <br></label>
        <div class="inputWithButton">
            <input type='text' id='nickname' name='nickname' value="${user.nickname}" placeholder="ex) 패션꾸러기">
            <button id="revertNicknameButton" type="button" class="revertButton">
                <i class="fas fa-undo fa-lg"></i>
            </button>
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
    // Get original values on page load
    const originalIdValue = document.getElementById('id').value;
    const originalNicknameValue = document.getElementById('nickname').value;

    // Add event listeners to the input fields
    document.getElementById('id').addEventListener('input', handleInputChange);
    document.getElementById('nickname').addEventListener('input', handleInputChange);

    // Function to handle input change
    function handleInputChange() {
        const idInput = document.getElementById('id');
        const nicknameInput = document.getElementById('nickname');

        // Check if the values have changed from their originals
        if (idInput.value !== originalIdValue) {
            // If changed, enable the "Check for Duplicates" button for ID
            document.getElementById('checkId').disabled = false;
        } else {
            // If reverted to original, disable the button
            document.getElementById('checkId').disabled = true;
        }

        if (nicknameInput.value !== originalNicknameValue) {
            // If changed, enable the "Check for Duplicates" button for nickname
            document.getElementById('checkNickname').disabled = false;
        } else {
            // If reverted to original, disable the button
            document.getElementById('checkNickname').disabled = true;
        }
    }

    // Function to revert the values to their originals
    function revertValues() {
        document.getElementById('id').value = originalIdValue;
        document.getElementById('nickname').value = originalNicknameValue;

        // Disable the "Check for Duplicates" buttons after reverting
        document.getElementById('checkId').disabled = true;
        document.getElementById('checkNickname').disabled = true;
    }

    // Add event listeners to the buttons for reverting values
    document.getElementById('revertIdButton').addEventListener('click', () => {
        revertValues('id');
    });

    document.getElementById('revertNicknameButton').addEventListener('click', () => {
        revertValues('nickname');
    });



    // 중복 확인 버튼 상태 변경 함수
    function toggleCheckButton() {
        var idInput = document.getElementById('id');
        var checkIdButton = document.getElementById('checkId');
        var nicknameInput = document.getElementById('nickname');
        var checkNicknameButton = document.getElementById('checkNickname');

        // 아이디와 닉네임 입력 값이 변경될 때마다 중복 확인 버튼을 활성/비활성화
        idInput.addEventListener('input', function() {
            checkIdButton.disabled = idInput.value === '${user.id}';
        });

        nicknameInput.addEventListener('input', function() {
            checkNicknameButton.disabled = nicknameInput.value === '${user.nickname}';
        });
    }

    // 페이지 로드 시 버튼 상태 변경 함수 호출
    window.onload = function() {
        toggleCheckButton();
    };

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