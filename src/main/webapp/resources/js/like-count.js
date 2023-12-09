$('.like').on('click', function() {
    var likeIcon = $(this).find('.like_icon')[0];
    var likeCount = $(this).find('.like_count');

    // 현재 이미지의 src를 가져옵니다.
    var currentSrc = likeIcon.getAttribute('src');

    // 현재 이미지의 src에 따라 다른 이미지로 변경합니다.
    if (currentSrc.includes('icon-heart-off.svg')) {
        likeIcon.setAttribute('src', '/resources/image/icon/icon-heart-on.svg');
        // like_count를 1 증가시킵니다.
        var currentCount = parseInt(likeCount.text(), 10);
        likeCount.text(currentCount + 1);
    } else if (currentSrc.includes('icon-heart-on.svg')) {
        likeIcon.setAttribute('src', '/resources/image/icon/icon-heart-off.svg');
        // like_count를 1 감소시킵니다. (0보다 작아지지 않도록 확인)
        var currentCount = parseInt(likeCount.text(), 10);
        likeCount.text(Math.max(0, currentCount - 1));
    }

    // $.ajax({
    //     type: 'POST',
    //     url: '/update-like', // 실제 업데이트를 처리하는 서버의 엔드포인트 경로
    //     data: { postId: postId },
    //     success: function(response) {
    //         // 성공적으로 서버와 통신했을 때 수행할 작업
    //         console.log('서버 응답:', response);
    //     },
    //     error: function(error) {
    //         // 서버와의 통신 중 오류가 발생했을 때 수행할 작업
    //         console.error('서버 오류:', error);
    //     }
    // });
});