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
                <img class="userImg" src="${post.profile}" alt="프로필 사진">
            </a>
            <div class="profile-info">
                <p class="username">${post.nickname}</p>
                <p class="created-date" data-formatted-date="${formattedCreatedAt}"></p>
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
                    <c:forEach items="${post.hashtags}" var="hashtag">
                        <a href="/posts/tags/${hashtag}" class="content_hashtag">#${hashtag} </a>
                    </c:forEach>
                </p>
                <%--추후 글 길어질때 더보기 창 나오게 할 예정--%>
            </div>
            <div class="post-comments">
                <div class="comments-count">댓글 <b>30</b>개</div>
                <div class="comments-content">
                    <div class="comment-box">
                        <a class="userImg-box" href="#">
                            <img class="userImg"
                                 src="https://i.namu.wiki/i/R0AhIJhNi8fkU2Al72pglkrT8QenAaCJd1as-d_iY6MC8nub1iI5VzIqzJlLa-1uzZm--TkB-KHFiT-P-t7bEg.webp"
                                 alt="프로필 사진">
                        </a>
                        <div class="profile-info">
                            <span class="username">hi_wooooany</span>
                            <span class="content">좋아요❤️</span>
                            <p class="created-date" data-formatted-date="${formattedCreatedAt}"></p>
                        </div>
                        <div class="delete-btn">삭제</div>
                    </div>
                    <div class="comment-box">
                        <a class="userImg-box" href="#">
                            <img class="userImg"
                                 src="https://i.namu.wiki/i/R0AhIJhNi8fkU2Al72pglkrT8QenAaCJd1as-d_iY6MC8nub1iI5VzIqzJlLa-1uzZm--TkB-KHFiT-P-t7bEg.webp"
                                 alt="프로필 사진">
                        </a>
                        <div class="profile-info">
                            <span class="username">hi_wooooany</span>
                            <span class="content">좋아요❤️️️️</span>
                            <p class="created-date" data-formatted-date="${formattedCreatedAt}"></p>
                        </div>
                    </div>
                </div>
            </div>






            <%--히든Id--%>
            <p class="hidden-postId" style="visibility: hidden;" data-post-id="${post.postId}"></p>
            <%--팝업창--%>
            <%--글 수정 삭제 팝업창--%>
            <%--추후에 작성자랑 작성자아닌경우 다르게 팝업창 설정할 예정--%>
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



            <%--댓글 입력 팝업창--%>
            <div class="comment-input-modal">
                <img class="profile-picture"
                     src="https://hips.hearstapps.com/hmg-prod/images/beautiful-smooth-haired-red-cat-lies-on-the-sofa-royalty-free-image-1678488026.jpg?crop=0.88847xw:1xh;center,top&resize=1200:*"
                     alt="프로필 사진">
                <!-- 댓글 입력창 -->
                <div class="input-wrapper">
                    <div contenteditable="true" id="commentInput" data-placeholder="댓글을 남기세요...">
                        댓글을 남기세요...
                    </div>
                    <!-- 등록 버튼 -->
                    <input type="submit" id="submitComment" class="register-button" value="등록" />
                </div>
            </div>



            <%--댓글 삭제 팝업창--%>
            <div data-v-4be3d37a="" class="layer_yes-or-no">
                <div data-v-4be3d37a="" class="alert_box high"><p data-v-4be3d37a="" class="alert_desc">삭제하시겠습니까?</p>
                </div>
                <div data-v-4be3d37a="" class="layer_btn">
                    <button data-v-0a6aebaa="" type="button" class="btn-cancel" data-v-4be3d37a=""> 취소
                    </button>
                    <button data-v-0a6aebaa="" type="button" class="btn-delete" data-v-4be3d37a=""> 확인
                    </button>
                </div>
            </div>
        </div>
    </div>



</section>
<%--댓글 다는 모달창--%>





<script type="text/javascript" src="/resources/js/post-detail.js"></script>
<%@include file="../includes/footer.jsp" %>
