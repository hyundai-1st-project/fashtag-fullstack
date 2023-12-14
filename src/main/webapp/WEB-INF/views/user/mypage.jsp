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
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
        width: 25%;
        box-sizing: border-box;
        padding: 5px;
        position: relative;
        overflow: hidden;
    }

    .image-item img {
        width: 100%;
        height: auto;
        aspect-ratio: 1 / 1; /* 정사각형 비율을 유지하도록 설정 */
        object-fit: cover;
    }
    /*.image-item {*/
    /*    width: 25%; !* 4개씩 정렬할 때 25% 너비 설정 *!*/
    /*    box-sizing: border-box;*/
    /*    padding: 5px 0 0 5px; !* 이미지 간 간격 조정을 위한 패딩 *!*/
    /*}*/

    /*.image-item img {*/
    /*    width: 100%;*/
    /*    display: block;*/
    /*}*/

    .no-posts-message {
        text-align: center;
        padding: 20px;
        /*border: 2px solid #ccc;*/
        border-radius: 8px;
        width: 100%; /* 이미지 그리드의 너비에 맞춤 */
        box-sizing: border-box; /* border 크기를 width에 포함시키기 위해 */
        font-size: 18px; /* 폰트 크기 조정 */
    }

    .row a.btn {
        border: none; /* 보더 없애기 */
        color: #1889c7; /* 글씨체 색상 변경 */
        font-weight: bold; /* 글씨체 굵기 설정 */
        /* 다른 스타일도 필요하다면 추가하세요 */
    }
</style>

<div class="container">
    <br/>
    <div style="margin-top: 30px; display: flex;">
        <div style="width: 170px; height: 170px; overflow: hidden; border-radius: 50%;">
            <c:choose>
                <c:when test="${empty myPage.userVO.profile}">
                    <!-- 프로필 정보가 null인 경우 -->
                    <img src="/resources/image/user-image/profile.png" style="width: 100%; height: 170px;  object-fit: cover;">
                </c:when>
                <c:otherwise>
                    <!-- 프로필 정보가 null이 아닌 경우 -->
                    <img src="https://fashtag.s3.ap-northeast-2.amazonaws.com/${myPage.userVO.profile}" style="width: 100%; height: 170px;  object-fit: cover;">
                </c:otherwise>
            </c:choose>

        </div>
        <div style="flex: 1; padding-left: 20px;">
            <div style="margin-top: 20px;">
                <h4><c:out value="${myPage.userVO.id}"/></h4>
                <button type="button" class="btn-border btn-small"> <a href="/user/${userId}/edit">프로필 편집</a></button>
            </div>

            <!-- 게시글 및 댓글 수 -->
            <div style="display: flex; margin-top: 20px;">
                <div style="width: 25%; margin-right: 10px;">
                    <h5>게시글 수</h5>
                    <div style="display: flex; align-items: center;">
                        <span>${myPage.postSize}</span>
                    </div>
                </div>
                <div style="width: 25%; margin-left: 10px;">
                    <h5>작성 댓글 수</h5>
                    <div style="display: flex; align-items: center;">
                        <span>${myPage.commentSize}</span>
                    </div>
                </div>
                <!-- 다른 요소들을 추가하려면 여기에 계속해서 작성하시면 됩니다 -->
            </div>
        </div>
    </div>

    <br/>

    <div class="row" style="border-bottom: 1px solid #ebe9eb;">
        <c:forEach var="hashtag" items="${myPage.hashtags}">
            <a href="/posts/tags/${fn:substringAfter(hashtag, '#')}" class="btn btn-light btn-sm ig-btn-primary">${hashtag}</a>
        </c:forEach>
        <br/> <br/>
    </div>

    <br/>

    <div class="image-grid">
        <c:choose>
            <c:when test="${empty myPage.posts}">
                <div class="no-posts-message">
                    <p>게시글이 존재하지 않습니다. <br/></p>
                </div>
            </c:when>
            <c:otherwise>
                <c:forEach var="post" items="${myPage.posts}">
                    <c:forEach var="picture" items="${post.picture}">
                        <div class="image-item">
                            <a href="/posts/${post.postId}">
                                <img src="https://fashtag.s3.ap-northeast-2.amazonaws.com/${picture}" class="img-fluid">
                            </a>
                        </div>
                    </c:forEach>
                </c:forEach>
            </c:otherwise>
        </c:choose>
    </div>

    <br/><br/>
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