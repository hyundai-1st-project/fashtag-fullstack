//*********댓글ajax*********//

//렌더링할때마다 getCommentList함수 호출
$(function() {
    getCommentList();
});


//해당 post의 모든댓글 불러와서 뷰에 뿌려주는 함수
const postId = $('.hidden-postId').data('post-id');
function getCommentList(){
    $.ajax({
        url : `/comment/list/${postId}`,
        type : "GET",
        dataType : "json",
        success : function(comments){
            let html = "";
            $(".commentNum").html(`${comments.length}`);
            comments.forEach(function(comment){
                html += `<div class="comment-box">
                <a class="userImg-box" href="#">
                <img class="userImg" src="${comment.profile}" alt="프로필 사진"></a>
                <div class="profile-info">
                <span class="username">${comment.nickname}</span>
                <span class="content">${comment.commentContent}️</span>
                <p class="created-date" data-formatted-date="${comment.formmatedCreatedAt}">${getTimeAgo(comment.formattedCreatedAt)}</p> </div>
                <div class="delete-btn">삭제</div> </div>
                `
            })
            const $comments = $(".comments-content");
            $comments.html(html);
            $comments.find('.delete-btn').on('click',function(){deleteBtnAction()})
        },
        error : function(){
            alert('댓글을 가져올 수 없습니다.');
        }
    })
}



//날짜를 뷰에 뿌릴 형식으로 변환하는 함수
function getTimeAgo(date) {
    const currentDate = new Date();
    const postDate = new Date(date);
    // const postLocalDate = new Date(postDate.getTime() + postDate.getTimezoneOffset() * 60 * 1000); //오라클시간 한국시간 아닐때 설정


    const timeDifference = currentDate - postDate;
    const seconds = Math.floor(timeDifference / 1000);
    const minutes = Math.floor(seconds / 60);
    const hours = Math.floor(minutes / 60);
    const days = Math.floor(hours / 24);
    const months = Math.floor(days / 30);
    const years = Math.floor(months / 12);

    if (years > 0) {
        return `${years}년 전`;
    } else if (months > 0) {
        return `${months}달 전`;
    } else if (days > 0) {
        return `${days}일 전`;
    } else if (hours > 0) {
        return `${hours}시간 전`;
    } else if (minutes > 0) {
        return `${minutes}분 전`;
    } else {
        return `${seconds}초 전`;
    }
}

//댓글 삭제 모달창 띄우는 함수
function deleteBtnAction() {
    $('.layer_yes-or-no[data-v-4be3d37a]').fadeIn();
    // 주변 어둡게 설정
    $('body').append('<div class="modal-backdrop"></div>');
    $('.modal-backdrop').fadeIn();
}


//채팅버튼 누르면 댓글 입력창으로 화면이동 및 커서 focus되는 함수
$(function(){
    $(".icon.chat_icon").on("click", function() {
        // commentInput 요소의 위치로 스크롤 이동
        const $commentInput = $("#commentInput");
        const offset = ($(window).height() - $($commentInput[0]).outerHeight()) / 2;

        $('html, body').animate({
            scrollTop: $($commentInput[0]).offset().top - offset
        }, 'slow');

        $commentInput.focus(); // commentInput으로 커서 이동
    });
});

//*********댓글입력창 js*********//

//댓글입력창 js//
const commentInput = document.getElementById('commentInput');
const placeholder = commentInput.getAttribute('data-placeholder');
const registerButton = document.getElementById('submitComment');

// 입력이 시작될 때 placeholder 제거
commentInput.addEventListener('focus', function () {
    if (this.textContent.trim() === placeholder) {
        this.textContent = '';
    }
});

// 입력이 시작될 때 placeholder 제거
commentInput.addEventListener('input', function () {
    if (this.textContent.trim() !== '') {
        this.classList.remove('placeholder'); // 내용이 있으면 placeholder 클래스 제거
    } else {
        this.classList.add('placeholder'); // 내용이 없으면 placeholder 클래스 추가
    }
    updateRegisterButtonVisibility(); // 등록 버튼 표시 여부 업데이트
});

// 입력란을 벗어났을 때 placeholder를 다시 표시
commentInput.addEventListener('blur', function () {
    if (this.textContent.trim() === '') {
        this.classList.add('placeholder'); // 내용이 없으면 placeholder 클래스 추가
        this.textContent = placeholder; // 내용이 없으면 placeholder 텍스트 설정
    }
    updateRegisterButtonVisibility(); // 등록 버튼 표시 여부 업데이트
});

// 등록 버튼의 표시 여부를 업데이트하는 함수
function updateRegisterButtonVisibility() {
    if (commentInput.classList.contains('placeholder')) {
        registerButton.style.display = 'none'; // placeholder가 존재하면 버튼 숨김
    } else {
        registerButton.style.display = 'inline-block'; // placeholder가 없으면 버튼 표시
    }
}

// 페이지 로드 시 초기 등록 버튼 상태 설정
commentInput.textContent = placeholder;
commentInput.classList.add('placeholder'); // 초기에 placeholder 설정
updateRegisterButtonVisibility();

// 입력란 내용이 바뀌면 등록 버튼 상태 업데이트
setInterval(function () {
    if (commentInput.textContent.trim() !== '') {
        updateRegisterButtonVisibility(); // 내용이 있는 경우 버튼 표시
    }
}, 200);




//*********댓글 삭제 모달 이벤트 js*********//
$(function() {
    const commentId = $('.hidden-postId').data('post-id');//추후 수정!!

    // 삭제 버튼 클릭 시 /delete로 이동
    $('.layer_yes-or-no .layer_btn .btn-delete').click(function() {
        window.location.href = `/comments/delete/${commentId}`;
    });

    // 취소 버튼 클릭 시 모달 닫기
    $('.layer_yes-or-no .layer_btn .btn-cancel').click(function() {
        $('.layer_yes-or-no[data-v-4be3d37a]').fadeOut();
        $('.modal-backdrop').remove(); // 어둡게 한 배경 제거
    });

    // 모달 외부를 클릭하면 모달 닫기
    $(document).on('mousedown', function(e) {
        // 모달 바깥 영역을 클릭하고, 모달 자신이 아닌 경우 모달 닫기
        if (!$(e.target).closest('.layer_yes-or-no[data-v-4be3d37a]').length) {
            $('.layer_yes-or-no[data-v-4be3d37a]').fadeOut();
            $('.modal-backdrop').remove(); // 어둡게 한 배경 제거
        }
    });
});