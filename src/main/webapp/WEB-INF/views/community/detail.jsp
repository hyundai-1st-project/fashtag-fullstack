<%--
  Created by IntelliJ IDEA.
  User: sangwon
  Date: 2023-12-03
  Time: 오후 3:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding="utf-8"%>
<%@include file="../includes/header.jsp"%>
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
            <p>조회수: ${post.readCount}</p>
            <p>내용: ${post.postContent}</p>
        </div>
    </div>
</section>

<script type="text/javascript" src="/resources/js/post-detail.js"></script>
<%@include file="../includes/footer.jsp"%>
