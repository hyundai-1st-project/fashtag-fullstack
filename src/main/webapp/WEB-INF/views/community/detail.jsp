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
<link rel='stylesheet' href='/resources/css/comment.css' type='text/css'/>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<%! String likeState = "N"; %>


<section class="post-detail-section">
    <div class="post-detail">
        <div class="profile-box">
            <a class="userImg-box" href="/mypage/${post.userId}">
                <img class="userImg" src="${url}${post.profile}" alt="프로필 사진">
            </a>
            <div class="profile-info">
                <p class="username">${post.nickname}</p>
                <p class="created-date" data-formatted-date="${formattedCreatedAt}"></p>
            </div>
            <div>
                <c:if test="${post.userId eq user.userId}">
                    <button class="profile-btn">
                        <img class="action-btnImg" src="/resources/image/post-detail-image/detail-info-btn.png"/>
                    </button>
                </c:if>
            </div>
        </div>

        <div class="fashionImg-box">
            <img class="fashionImg" src="${url}${post.picture}">
        </div>


        <div class="contents-box">
            <div class="post-btns">
                <img post-id="${post.postId}"
                     src="/resources/image/icon/${likeStatus == "Y"? "icon-heart-on": "icon-heart-off"}.svg"
                     class="icon like_icon" id="like-btn"/>
                <img src="/resources/image/icon/chat-icon.png" class="icon chat_icon" id="like-count"/>
            </div>
            <div class="post-statistics">
                좋아요<b><span data-v-12986062="" class="like_count"
                            id="like-count-${post.postId}">${post.likeCount}</span></b>개&nbsp;&nbsp;
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
                <div class="comments-count">댓글 <b class="commentNum"></b>개</div>
                <div class="comment-input">
                    <c:choose>
                    <c:when test="${user != null}">
                    <a href="/mypage/${user.userId}" class="profile_link">
                        </c:when>
                        <c:otherwise>
                        <a href="/login" class="profile_link">
                            </c:otherwise>
                            </c:choose>
                            <img class="profile-picture"
                                 src="${url}${user!=null?user.profile:"user/user-profile-image/defaultImage"}"
                                 alt="프로필 사진"></a>
                        <div class="input-wrapper">
                            <div contenteditable="true" placeholder="${user!=null?"댓글을 남기세요...":"로그인 후 댓글을 작성해주세요."}"
                                 autocapitalize="off" spellcheck="false" class="input_txt origin"
                                 id="commentInput"></div>
                            <a href="/comment/insert" class="register-button"> 등록 </a></div>
                </div>
                <div class="comments-content"></div>
            </div>


            <%--팝업창--%>
            <%--글 수정 삭제 팝업창--%> <%--추후에 작성자랑 작성자아닌경우 다르게 팝업창 설정할 예정--%>
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
<script>
    const postId = ${post.postId};
</script>

<script type="text/javascript" src="/resources/js/post-detail.js"></script>
<script type="text/javascript" src="/resources/js/comment.js"></script>
<%@include file="../includes/footer.jsp" %>
