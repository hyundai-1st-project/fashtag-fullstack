
let page = 1;
let pageHash = 1;

document.addEventListener('DOMContentLoaded', function () {
    // 옵저버의 설정
    const options = {
        root: null, // 뷰포트를 루트로 사용
        rootMargin: '0px',
        threshold: 1.0 // 100% 이상 보일 때 콜백 호출
    };
    // IntersectionObserver 콜백 함수
    const handleIntersection = (entries, observer) => {
        entries.forEach(entry => {

            if (entry.isIntersecting && pageTitle!=="#POSTS") {
                // console.log('바닥 찾기 성공');
                // AJAX를 통해 서버로 데이터 요청
                $.ajax({
                    url: '/api/posts/tags',
                    method: 'GET',
                    data: {
                        page: pageHash, // 다음 페이지 예시 (원하는 값으로 수정)
                        limit: 20,
                        userId: userId,
                        hashtag: pageTitle// 예시로 사용자 ID 1로 설정 (원하는 값으로 수정)
                    },
                    success: function (data) {
                        // 서버 응답에 따라 데이터 처리
                        // console.log('서버 응답 성공');
                        // console.log('서버 응답 data:', data);
                        // console.log('userId:', userId);
                        // console.log('pageTitle:', pageTitle);
                        // console.log('url:', url);
                        // console.log('page:', pageHash);
                        if (data.length === 0) { // 더 이상 데이터가 없을 때 반응 X
                            // console.log('데이터가 더 이상 없습니다.');
                            observer.disconnect(); // 옵저버 중지
                        } else {
                            const grid = document.querySelector('.portfoliogrid');
                            data.forEach(post => {
                                const hashtags = post.hashtags
                                const hashtagLinks = hashtags.map(hashtag => `<a href="/posts/tags/${hashtag}" class="content_hashtag">#${hashtag} </a>`).join('');
                                const postHtml = `
                                       <article class="hentry">
                                           <header class="entry-header">
                                               <div class="entry-thumbnail">
                                                   <a href="/posts/${post.postId}"><img class="post_image" src="${url}${post.picture}" alt=""></a>
                                               </div>
                                               <div data-v-12986062="" class="card_detail">
                                                   <div data-v-12986062="" class="user_box">
                                                       <picture data-v-44ba780a="" data-v-12986062="" class="picture img_profile">
                                                           <a href="/mypage/${post.userId}">
                                                               <img data-v-44ba780a="" alt="사용자 프로필 이미지" src="${url}${post.profile}" loading="lazy" class="image full_width">
                                                           </a>
                                                       </picture>
                                                       <span data-v-7ddd6c4e="" data-v-12986062="" class="user_name">
                                                         <span data-v-7ddd6c4e=""><a href="/mypage/${post.userId}">${post.nickname}</a></span><!---->
                                                       </span>
                                                       <img post-id="${post.postId}" src="/resources/image/icon/${post.likeStatus == "Y"? "icon-heart-on": "icon-heart-off"}.svg" class="like_icon" id="like-btn"/>
                                                       <span data-v-12986062="" class="like_count" id="like-count-${post.postId}">${post.likeCount}</span>
                                                   </div>
                                                   <p data-v-12986062="" class="text_box">
                                                       ${hashtagLinks}
                                                   </p>
                                               </div>
                                           </header>
                                       </article>`;
                                grid.insertAdjacentHTML('beforeend', postHtml);
                            });
                            var msnry = new Masonry(grid, {
                                itemSelector: 'article',
                            })
                            imagesLoaded( '.grid' ).on( 'progress', function() {
                                msnry.layout();
                            });
                        }
                        pageHash++;},
                    error: function (xhr, status, error) {
                        console.error('서버와 통신 중 오류 발생:', error);
                    }
                });
            }
            else if (entry.isIntersecting && pageTitle==="#POSTS") {

                // console.log('바닥 찾기 성공');
                // AJAX를 통해 서버로 데이터 요청
                $.ajax({
                    url: '/api/posts',
                    method: 'GET',
                    data: {
                        page: page, // 다음 페이지 예시 (원하는 값으로 수정)
                        limit: 20,
                        userId: userId, // 예시로 사용자 ID 1로 설정 (원하는 값으로 수정)
                        order: order // 또는 'newest'로 설정 (원하는 값으로 수정)
                    },
                    success: function (data) {
                        // 서버 응답에 따라 데이터 처리
                        // console.log('서버 응답 성공');
                        // console.log('서버 응답 data:', data);
                        // console.log('userId:', userId);
                        // console.log('order:', order);
                        // console.log('url:', url);
                        // console.log('page:', page);

                        if (data.length === 0) { // 더 이상 데이터가 없을 때 반응 X
                            // console.log('데이터가 더 이상 없습니다.');
                            observer.disconnect(); // 옵저버 중지
                        } else {
                            const grid = document.querySelector('.portfoliogrid');
                            data.forEach(post => {
                                const hashtags = post.hashtags
                                const hashtagLinks = hashtags.map(hashtag => `<a href="/posts/tags/${hashtag}" class="content_hashtag">#${hashtag} </a>`).join('');
                                const postHtml = `
                                        <article class="hentry">
                                            <header class="entry-header">
                                                <div class="entry-thumbnail">
                                                    <a href="/posts/${post.postId}"><img class="post_image" src="${url}${post.picture}" alt=""></a>
                                                </div>
                                                <div data-v-12986062="" class="card_detail">
                                                    <div data-v-12986062="" class="user_box">
                                                        <picture data-v-44ba780a="" data-v-12986062="" class="picture img_profile">
                                                            <a href="/mypage/${post.userId}">
                                                                <img data-v-44ba780a="" alt="사용자 프로필 이미지" src="${url}${post.profile}" loading="lazy" class="image full_width">
                                                            </a>
                                                        </picture>
                                                        <span data-v-7ddd6c4e="" data-v-12986062="" class="user_name">
                                                          <span data-v-7ddd6c4e=""><a href="/mypage/${post.userId}">${post.nickname}</a></span><!---->
                                                        </span>
                                                        <img post-id="${post.postId}" src="/resources/image/icon/${post.likeStatus == "Y"? "icon-heart-on": "icon-heart-off"}.svg" class="like_icon" id="like-btn"/>
                                                        <span data-v-12986062="" class="like_count" id="like-count-${post.postId}">${post.likeCount}</span>
                                                    </div>
                                                    <p data-v-12986062="" class="text_box">
                                                        ${hashtagLinks}
                                                    </p>
                                                </div>
                                            </header>
                                        </article>`;

                                grid.insertAdjacentHTML('beforeend', postHtml);

                            });
                            var msnry = new Masonry(grid, {
                                itemSelector: 'article',
                            })
                            imagesLoaded( '.grid' ).on( 'progress', function() {
                                msnry.layout();
                            });
                        }
                        page++;

                    },
                    error: function (xhr, status, error) {
                        console.error('서버와 통신 중 오류 발생:', error);
                    }
                });
            }
        });
    };

    // IntersectionObserver 인스턴스 생성
    const observer = new IntersectionObserver(handleIntersection, options);

    // 관찰할 대상 설정 (여기서는 footer)
    const target = document.querySelector('#colophon');
    observer.observe(target);
});