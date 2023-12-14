function deletePost(postId) {
    $.ajax({
        url: '/posts/' + postId,
        type: 'POST',
        success: function (data) {
            window.location.href = "/posts";
        },
        error: function (xhr, status, error) {
            alert("삭제 중 오류 발생");
            console.error('게시물 삭제 중 오류 발생:', status, error);
        }
    });
}

$('.action_item.delete').click(function () {
    var isConfirmed = confirm("게시물을 삭제하시겠습니까?");
    if (isConfirmed) {
        deletePost(postId);
    }
});