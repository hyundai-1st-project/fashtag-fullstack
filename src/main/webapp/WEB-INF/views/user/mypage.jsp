<%--
  Created by IntelliJ IDEA.
  User: sangmin
  Date: 12/10/23
  Time: 5:03 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding="utf-8"%>
<%@include file="../includes/header.jsp"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%--<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>--%>

<style>
    .btn-border {
        align-items: center;
        background-color: #fff;
        color: rgba(34,34,34,.8);
        cursor: pointer;
        display: inline-flex;
        justify-content: center;
        text-align: center;
        vertical-align: middle;
    }
    .btn-small {
        border-radius: 10px;
        font-size: 12px;
        height: 34px;
        letter-spacing: -.06px;
        padding: 0 14px;
    }

    .ig-btn-primary{
        color: #262626;
        background-color: white;
        border: 2px solid #dbdbdb;
        border-radius: 8px;
    }

    .image-grid {
        display: flex;
        flex-wrap: wrap;
        margin: -5px 0 0 -5px; /* 이미지 간 간격 조정을 위한 마이너스 마진 */
    }

    .image-item {
        width: 25%; /* 4개씩 정렬할 때 25% 너비 설정 */
        box-sizing: border-box;
        padding: 5px 0 0 5px; /* 이미지 간 간격 조정을 위한 패딩 */
    }

    .image-item img {
        width: 100%;
        display: block;
    }

</style>

<div class="container">
    <br/>
    <div style="margin-top: 30px; display: flex;">
        <div style="width: 200px; height: 200px; overflow: hidden; border-radius: 50%;">
            <img src="/resources/image/user-image/profile.png" style="width: 100%;">
        </div>
        <div style="flex: 1; padding-left: 20px;">
            <div style="margin-top: 20px;">
                <h4>Nickname</h4>
                <button type="button" class="btn-border btn-small"> <a href="/user/${userId}/edit">프로필 편집</a></button>
            </div>
            <div style="margin-top: 20px;">
                <div style="width: 25%;">
                    <h5>게시글 수</h5> 5
                </div>
                <!-- 다른 요소들을 추가하려면 여기에 계속해서 작성하시면 됩니다 -->
            </div>
        </div>
    </div>
    <br/>
    <div class="row">
        <div class="col-12">
            <a href="/posts/tags/hashtag" class="btn btn-light btn-sm ig-btn-primary">#오뭐입</a>
            <a href="/posts/tags/hashtag" class="btn btn-light btn-sm ig-btn-primary">#내뭐입</a>
            <a href="/posts/tags/hashtag" class="btn btn-light btn-sm ig-btn-primary">#hashtags</a>
        </div>
    </div>

    <br/>
    <div class="image-grid">
        <div class="image-item">
            <img src="/resources/image/user-image/profile.png" class="img-fluid">
        </div>
        <div class="image-item">
            <img src="/resources/image/user-image/profile.png" class="img-fluid">
        </div>
        <div class="image-item">
            <img src="/resources/image/user-image/profile.png" class="img-fluid">
        </div>
        <div class="image-item">
            <img src="/resources/image/user-image/profile.png" class="img-fluid">
        </div>
        <div class="image-item">
            <img src="/resources/image/user-image/profile.png" class="img-fluid">
        </div>
        <div class="image-item">
            <img src="/resources/image/user-image/profile.png" class="img-fluid">
        </div>
        <!-- 추가적인 이미지들을 원하는 만큼 계속해서 추가하실 수 있습니다 -->
    </div>
    <br/>
    <br/>
</div>



<%--<sec:authentication property="principal.userVO" var="user" />--%>
<%--<c:out value="${user.userId}" />--%>

<%--<c:out value="${user.id}" />--%>

<%--<c:out value="${user.profile}" />--%>
<%--<c:out value="${user.nickname}" />--%>
<%--<c:out value="${user.username}" />--%>



<%--<p>사용자이름 : <sec:authentication property="principal.userVO"/></p>--%>
<%--<p>사용자아이디 : <sec:authentication property="principal.userVO.id"/></p>--%>

<%--<p>사용자 권한 리스트 : <sec:authentication property="principal.member.authList"/></p>--%>

<%@include file="../includes/footer.jsp"%>