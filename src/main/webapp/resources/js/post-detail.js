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