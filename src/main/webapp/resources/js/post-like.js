const heart_off = '/resources/image/icon/icon-heart-off.svg';
const heart_on = '/resources/image/icon/icon-heart-on.svg'

let post_id, $likeIcon, $likeCount, isLiked;

// 좋아요 버튼 누를때 EventListener
$('.like_icon').on('click', function(e) {
    e.preventDefault();
    if(!loginUserId) window.location.href = "/login";
    else{
    //좋아요누른 post에 따라 변수 setting
    $likeIcon = $(this);
    post_id = $(this).attr('post-id');
    $likeCount = $(`#like-count-${post_id}`);
    isLiked = $(this).attr('src') === heart_on;

    //ajax함수 수행
    if (isLiked) cancelLike()
    else addLike()}
});


//좋아요 C
function addLike() {
    $.ajax({
        url: '/api/like/insert',
        type: 'POST',
        contentType: 'application/json',
        data: JSON.stringify({ postId: post_id, userId: loginUserId}), // JSON 형태로 데이터 전송
        success: function(response) {
            $likeIcon.attr('src', heart_on);
            const currentCount = parseInt($likeCount.text());
            $likeCount.text(currentCount + 1); // 숫자 감소
        },
        error: function(xhr, status, error) {
            console.error('에러: ' + error); // 에러 시 콘솔에 출력
            alert('좋아요를 누를 수 없습니다.');
        }
    });
}

//좋아요 D
function cancelLike() {
    $.ajax({
        url: '/api/like/delete',
        type: 'POST',
        contentType: 'application/json',
        data: JSON.stringify({ postId: post_id, userId: loginUserId}), // JSON 형태로 데이터 전송
        success: function(response) {
            console.log('성공: ' + response); // 성공 시 콘솔에 출력

            $likeIcon.attr('src', heart_off);
            const currentCount = parseInt($likeCount.text());
            $likeCount.text(currentCount - 1); // 숫자 증가
        },
        error: function(xhr, status, error) {
            console.error('에러: ' + error); // 에러 시 콘솔에 출력
            alert('좋아요를 취소할 수 없습니다.');
        }
    });
}






