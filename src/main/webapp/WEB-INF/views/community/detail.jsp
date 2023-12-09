<%--
  Created by IntelliJ IDEA.
  User: sangwon
  Date: 2023-12-03
  Time: 오후 3:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding="utf-8" %>
<%@include file="../includes/header.jsp" %>
<link rel='stylesheet' href='/resources/css/post-detail.css' type='text/css'/>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<section class="post-detail-section">
    <div class="post-detail">
        <div class="profile-box">
            <a class="userImg-box" href="#">
                <img class="userImg" src="/resources/image/paris.png" alt="프로필 사진">
            </a>
            <div class="profile-info">
                <p class="username">${post.userId}</p>
                <p class="created-date" data-formatted-date="${post.formattedCreatedAt}"></p>
            </div>
            <div>
                <button class="profile-btn">
                    <img class="action-btnImg" src="/resources/image/post-detail-image/detail-info-btn.png"/>
                </button>
            </div>
        </div>

        <div class="fashionImg-box">
            <img class="fashionImg" src="${post.picture}">
        </div>


        <div class="contents-box">
            <div class="post-btns">
                <img src="/resources/image/icon/icon-heart-off.svg" class="icon like_icon"/>
                <img src="/resources/image/icon/chat-icon.png" class="icon chat_icon"/>
            </div>
            <div class="post-statistics">
                좋아요<b><span data-v-12986062="" class="like_count">${post.likeCount}</span></b>개&nbsp;&nbsp;
                조회수 <b><span data-v-12986062="" class="read_count">${post.readCount}</span></b>
            </div>
            <div class="post-content">
                <p>${post.postContent}</p>
                <p data-v-12986062="" class="text_box">
                    <a href="/posts/tags/hashtag" class="content_hashtag">#오뭐입 </a>
                    <a href="/posts/tags/hashtag" class="content_hashtag">#내뭐입 </a>
                    <a href="/posts/tags/hashtag" class="content_hashtag">#hashtags </a>
                    <a href="/posts/tags/hashtag" class="content_hashtag" content="#크리스마스">#hahtags </a>
                    <a href="/posts/tags/hashtag" class="content_hashtag">#hhtags </a>
                    <a href="/posts/tags/hashtag" class="content_hashtag">#haags </a>
                    <a href="/posts/tags/hashtag" class="content_hashtag">#hashtags </a>
                    <a href="/posts/tags/hashtag" class="content_hashtag">#hashtags </a>
                    <a href="/posts/tags/hashtag" class="content_hashtag">#hasags </a>
                    <a href="/posts/tags/hashtag" class="content_hashtag">#hastags </a>
                    <a href="/posts/tags/hashtag" class="content_hashtag">#hasags </a>
                    <a href="/posts/tags/hashtag" class="content_hashtag">#hashags </a>
                    <a href="/posts/tags/hashtag" class="content_hashtag">#hashags </a>
                    <a href="/posts/tags/hashtag" class="content_hashtag">#hashtags </a>
                    <a href="/posts/tags/hashtag" class="content_hashtag">#hashtgs </a>
                </p>
                <%--추후 글 길어질때 더보기 창 나오게 할 예정--%>
            </div>
            <div class="post-comments">
                댓글창
            </div>
            <div data-v-4be3d37a="" class="layer_container">
                <div data-v-4be3d37a="" class="layer_header"></div>
                <div data-v-4be3d37a="" class="layer_content">
                    <ul data-v-199a6e40="" data-v-4be3d37a="" class="action_list">
                        <li data-v-199a6e40="" data-v-4be3d37a="" class="action_item update"> 게시물 수정</li>
                        <li data-v-199a6e40="" data-v-4be3d37a="" class="action_item delete"> 게시물 삭제</li>
                        <li data-v-199a6e40="" data-v-4be3d37a="" class="action_item cancel"> 취소</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</section>


<script type="text/javascript" src="/resources/js/post-detail.js"></script>
<%@include file="../includes/footer.jsp" %>
