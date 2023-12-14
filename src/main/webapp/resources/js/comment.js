//*********댓글ajax*********//
let commentPage = 1;
const commentPageNum = 10;
let commentHtml = ""
const addMoreBtn = '<p class="btn_more"><span class="btn_more_span">댓글 더 보기...</span></p>'

//렌더링할때마다 getCommentList함수 호출
$(function () {
    getCommentList();
});


//댓글 더보기 누를때 getCommentList함수 호출
$(document).on('click', '.btn_more_span', function(e) {
    //기존 댓글 더보기 제거
    commentHtml = commentHtml.replace(addMoreBtn, '');
    console.log(commentHtml);
    e.preventDefault();
    getCommentList();
});



//전역변수 선언
let currentCommentId = 0;
const url = "https://fashtag.s3.ap-northeast-2.amazonaws.com/";

function getCommentList() {
    $.ajax({
        url: `/comment/${postId}`,
        type: "POST",
        data: {
            page: commentPage,
            pageNum: commentPageNum
        },
        success: function (comments) {
            $(".commentNum").html(`${comments[0].commentNum}`);
            comments.forEach(function (comment) {
                commentHtml += `<div class="comment-box">
                <a class="userImg-box" href="/mypage/${comment.userId}">
                <img class="userImg" src="${url}${comment.profile}" alt="프로필 사진"></a>
                <div class="profile-info">
                <span class="username">${comment.nickname}</span>
                <span class="content">${comment.commentContent}️</span>
                <p class="created-date" data-formatted-date="${comment.formmatedCreatedAt}">${getTimeAgo(comment.formattedCreatedAt)} 
                `//getTimeAgo 함수는 post-detail.js에 있음
                if (loginUserId === comment.userId) commentHtml += `<span class="delete-btn">삭제<b style="display:none">${comment.commentId}</b></span>`//댓글 등록한 이용자만 삭제 버튼 보임
                commentHtml += `</p> </div></div>`
            })
            if (comments.length === 10) commentHtml += addMoreBtn;
            const $comments = $(".comments-content");
            $comments.html(commentHtml);
            $comments.find('.delete-btn').on('click', function () {
                currentCommentId = $(this).find('b').text();
                deleteBtnAction()
            });
            commentPage++;
        },
        error: function () {
            alert('댓글을 가져올 수 없습니다.');
        }
    })
}

//등록 버튼을 눌렀을 때, 댓글 Insert하는 Ajax
$(function () {
    if (loginUserId) {// 로그인 해야 버튼 동작 가능
        $('.register-button').on('click', function (e) {

            e.preventDefault();
            const commentText = $('#commentInput')[0].innerText.replaceAll("\n", "<br/>"); // 입력된 텍스트 가져오기
            const lineNum = (commentText.match(new RegExp("<br/>", 'g')) || []).length + 1;
            if (commentText.length > 500) alert("댓글길이는 500자를 넘을수 없습니다.");
            else if (lineNum > 10) alert("댓글길이는 10줄을 초과할 수 없습니다.")

            else{
            $.ajax({
                url: '/comment/insert',
                type: 'POST',
                contentType: 'application/json',
                data: JSON.stringify({commentContent: commentText, postId: postId, userId: loginUserId}), // JSON 형태로 데이터 전송
                success: function (response) {
                    console.log('성공: ' + response); // 성공 시 콘솔에 출력
                    //입력창 비우기
                    $('#commentInput').html("");
                    //초기화
                    commentHtml = "";
                    commentPage = 1;
                    getCommentList();
                },
                error: function (xhr, status, error) {
                    console.error('에러: ' + error); // 에러 시 콘솔에 출력
                    alert('댓글을 추가할 수 없습니다.');
                }
            });}
        });
    }
});


//댓글 삭제 모달창 띄우는 함수
function deleteBtnAction() {
    $('.layer_yes-or-no[data-v-4be3d37a]').fadeIn();
    // 주변 어둡게 설정
    $('body').append('<div class="modal-backdrop"></div>');
    $('.modal-backdrop').fadeIn();
}


//채팅버튼 누르면 댓글 입력창으로 화면이동 및 커서 focus되는 함수
$(function () {
    $(".icon.chat_icon").on("mousedown", function () {
        if (!loginUserId) {
            window.location.href = "/login";
        } else {
            // commentInput 요소의 위치로 스크롤 이동
            const $commentInput = $("#commentInput");
            const offset = ($(window).height() - $commentInput.outerHeight()) / 2;

            $('html, body').animate({
                scrollTop: $commentInput.offset().top - offset
            }, 'slow', function () {
                $commentInput.focus(); // commentInput으로 커서 이동
            });
        }
    });
});


$(function () {
    if (!loginUserId)
        $('.input-wrapper').on('mousedown', function () {
            window.location.href = "/login"
        })
})

/*********** 댓글 입력창 JS ****************/
$(function () {
    const $commentInput = $('#commentInput');
    //입력할때 등록 버튼 보이게 함. 공백이면 등록버튼 사라지게함.
    $commentInput.on('input', function () {
        let commentInput = $(this).text().trim();
        let registerButton = $('.register-button');

        if (commentInput.length > 0) {
            registerButton.css('display', 'flex');
        } else {
            registerButton.css('display', 'none');
            $(this).html("");
        }
    });
    //엔터키 누를때 등록
    $commentInput.keydown(function (event) {
        if (event.key === 'Enter' && !event.shiftKey) {
            event.preventDefault(); // Enter 키 기본 동작 취소
            $('.register-button').click(); // 등록 버튼 클릭
        }
    });
});


//*********댓글 삭제 모달 이벤트 js*********//
$(function () {
    // 삭제 버튼 클릭 시 /comments/delete 요청
    $('.layer_yes-or-no .layer_btn .btn-delete').click(function (e) {
        e.preventDefault();
        $.ajax({
            type: 'delete',
            url: `/comment/delete/${currentCommentId}`,
            success: function (deleteResult, status, xhr) {
                console.log(`삭제성공: ${deleteResult}`);
                $('.layer_yes-or-no[data-v-4be3d37a]').fadeOut();
                $('.modal-backdrop').remove(); // 어둡게 한 배경 제거

                //초기화
                commentHtml = "";
                commentPage = 1;
                getCommentList();
            },
            error: function (xhr, status, error) {
                console.error('에러: ' + error); // 에러 시 콘솔에 출력
                alert('댓글을 삭제할 수 없습니다.');
            }
        });
    });

    // 취소 버튼 클릭 시 모달 닫기
    $('.layer_yes-or-no .layer_btn .btn-cancel').click(function () {
        $('.layer_yes-or-no[data-v-4be3d37a]').fadeOut();
        $('.modal-backdrop').remove(); // 어둡게 한 배경 제거
    });

    // 모달 외부를 클릭하면 모달 닫기
    $(document).on('mousedown', function (e) {
        // 모달 바깥 영역을 클릭하고, 모달 자신이 아닌 경우 모달 닫기
        if (!$(e.target).closest('.layer_yes-or-no[data-v-4be3d37a]').length) {
            $('.layer_yes-or-no[data-v-4be3d37a]').fadeOut();
            $('.modal-backdrop').remove(); // 어둡게 한 배경 제거
        }
    });
});

