//날짜를 뷰에 뿌릴 형식으로 변환하는 함수
function getTimeAgo(date) {
    const currentDate = new Date();
    const postDate = new Date(date);
    const postLocalDate = new Date(postDate.getTime() + postDate.getTimezoneOffset() * 60 * 1000);

    const timeDifference = currentDate - postLocalDate;
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

$(document).ready(function () {
    const formattedDate = $('.created-date').data('formatted-date');
    const timeAgo = getTimeAgo(formattedDate);

    $('.created-date').text(timeAgo);
});



//모달창 js

//글 수정-삭제 모달창
$(document).ready(function() {
    // action-btnImg를 클릭할 때 모달 띄우기
    $('.action-btnImg').click(function() {
        $('.layer_container[data-v-4be3d37a]').fadeIn();
        // 주변 어둡게 설정
        $('body').append('<div class="modal-backdrop"></div>');
        $('.modal-backdrop').fadeIn();
    });

    // 모달 외부를 클릭하면 모달 닫기
    $(document).on('mousedown', function(e) {
        // 모달 바깥 영역을 클릭하고, 모달 자신이 아닌 경우 모달 닫기
        if (!$(e.target).closest('.layer_container[data-v-4be3d37a]').length) {
            $('.layer_container[data-v-4be3d37a]').fadeOut();
            $('.modal-backdrop').remove(); // 어둡게 한 배경 제거
        }
    });

    const postId = $('.hidden-postId').data('post-id');
    // 수정 버튼 클릭 시 /update로 이동
    $('.update').click(function() {
        window.location.href =  `/posts/${postId}/update`;
    });

    // 삭제 버튼 클릭 시 /delete로 이동
    $('.delete').click(function() {
        window.location.href = `/posts/${postId}/delete`;
    });

    // 취소 버튼 클릭 시 모달 닫기
    $('.cancel').click(function() {
        $('.layer_container[data-v-4be3d37a]').fadeOut();
        $('.modal-backdrop').remove(); // 어둡게 한 배경 제거
    });
});

//댓글 삭제 모달창
$(document).ready(function() {
    // 삭제버튼을 클릭할 때 모달 띄우기
    $('.comment-box .delete-btn').click(function() {
        $('.layer_yes-or-no[data-v-4be3d37a]').fadeIn();
        // 주변 어둡게 설정
        $('body').append('<div class="modal-backdrop"></div>');
        $('.modal-backdrop').fadeIn();
    });

    // 모달 외부를 클릭하면 모달 닫기
    $(document).on('mousedown', function(e) {
        // 모달 바깥 영역을 클릭하고, 모달 자신이 아닌 경우 모달 닫기
        if (!$(e.target).closest('.layer_yes-or-no[data-v-4be3d37a]').length) {
            $('.layer_yes-or-no[data-v-4be3d37a]').fadeOut();
            $('.modal-backdrop').remove(); // 어둡게 한 배경 제거
        }
    });

    const commentId = $('.hidden-postId').data('post-id');//추후 수정!!
    // 삭제 버튼 클릭 시 /delete로 이동
    $('.layer_yes-or-no .layer_btn .btn-delete').click(function() {
        window.location.href = `/comments/${commentId}/delete`;
    });

    // 취소 버튼 클릭 시 모달 닫기
    $('.layer_yes-or-no .layer_btn .btn-cancel').click(function() {
        $('.layer_yes-or-no[data-v-4be3d37a]').fadeOut();
        $('.modal-backdrop').remove(); // 어둡게 한 배경 제거
    });
});



// 아이콘 클릭 이벤트 리스너 등록
$('.like_icon').on('click', function() {
    var $likeIcon = $(this);
    var $likeCount = $('.like_count');
    var isLiked = $likeIcon.hasClass('liked'); // 좋아요 상태 확인

    if (isLiked) {
        // 좋아요 취소
        $likeIcon.attr('src', '/resources/image/icon/icon-heart-off.svg');
        $likeIcon.removeClass('liked');
        var currentCount = parseInt($likeCount.text());
        $likeCount.text(currentCount - 1); // 숫자 감소
    } else {
        // 좋아요 표시
        $likeIcon.attr('src', '/resources/image/icon/icon-heart-on.svg');
        $likeIcon.addClass('liked');
        var currentCount = parseInt($likeCount.text());
        $likeCount.text(currentCount + 1); // 숫자 증가
    }
});





//댓글입력 모달창 관련 js//
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






//버튼클릭할때 댓글 모달 나타나게 하는 js//

// 모달을 나타내는 함수
function showModal() {
    var modal = document.querySelector('.comment-input-modal');
    modal.style.display = 'flex'; // 모달을 보이게 함
}

// 모달을 숨기는 함수
function hideModal() {
    var modal = document.querySelector('.comment-input-modal');
    modal.style.display = 'none'; // 모달을 숨김
}

// 클릭 이벤트 설정
var icon = document.querySelector('.chat_icon'); // 아이콘 선택
icon.addEventListener('click', function() {
    var modal = document.querySelector('.comment-input-modal');
    if (modal.style.display === 'none' || modal.style.display === '') {
        showModal(); // 모달이 숨겨져 있을 때 클릭하면 보이게 함
    } else {
        hideModal(); // 모달이 보이고 있을 때 클릭하면 숨김
    }
});

// 모달 외부 클릭 시 모달 닫기
document.addEventListener('click', function(event) {
    var modal = document.querySelector('.comment-input-modal');
    if (!event.target.closest('.comment-input-modal') && !event.target.classList.contains('chat_icon')) {
        hideModal(); // 모달 외부를 클릭하면 모달을 숨김
    }
});