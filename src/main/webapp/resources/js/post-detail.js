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
    } else {
        return `${minutes}분 전`;
    }
}

$(document).ready(function () {
    const formattedDate = $('.created-date').data('formatted-date');
    const timeAgo = getTimeAgo(formattedDate);

    $('.created-date').text(timeAgo);
});
