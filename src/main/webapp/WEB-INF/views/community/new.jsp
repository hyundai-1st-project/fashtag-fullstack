<%--
  Created by IntelliJ IDEA.
  User: sangwon
  Date: 2023-12-03
  Time: 오후 3:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding="utf-8" %>
<%@include file="../includes/header.jsp" %>
<%--<link rel='stylesheet' href='/resources/css/post-new.css' type='text/css'/>--%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<section class="post-new-section">
<div data-v-708ef468 class="my_profile">
    <div data-v-8b96a82e="" data-v-708ef468="" class="profile_group">
        <div class="bottom-border"><h3 data-v-8b96a82e="" class="group_title">게시글 작성</h3></div>
        <form role="form" action="/posts" method="post" enctype="multipart/form-data" id="postForm">
            <div data-v-0c9f3f9e="" data-v-257b1b9e="" data-v-708ef468="" class="unit" data-v-8b96a82e="">
                <h4 data-v-0c9f3f9e="" class="title">게시물 이미지</h4>
                <div data-v-0c9f3f9e="" class="unit_content">
                    <img for="input-image" src="/resources/image/post-new/notRegi.png" alt="이미지를 등록하세요." class="post-image"/>
<%--                    <p data-v-24a03828="" data-v-257b1b9e="" class="desc desc_modify" data-v-0c9f3f9e=""> r5f1oq </p>--%>
                    <label for="input-image" class="label-button">이미지 업로드</label>
<%--                    <button type="button" class="btn-border btn-small"> 이미지 업로드 </button>--%>
                    <input type='file' name='uploadFile' id="input-image" style="display: none">
                </div>

            </div>
            <div data-v-0c9f3f9e="" data-v-257b1b9e="" data-v-708ef468="" class="unit" data-v-8b96a82e="">
                <div class="hashtag-div">
                    <h4 data-v-0c9f3f9e="" class="title">#해시태그</h4>
                    <div class="image-div">
                        <img class="plus-icon" src="/resources/image/icon/plus-icon.png"/>
                        <img class="minus-icon" src="/resources/image/icon/minus-icon.png"/>
                    </div>
                </div>
                <div data-v-0c9f3f9e="" class="unit_content hashtags">
                    <input name="hashtags" data-v-5ee806c3="" type="text" placeholder="#fashtag" autocomplete="off" maxlength="50" class="input_txt text_fill">
                </div>
            </div>
            <div data-v-0c9f3f9e="" data-v-257b1b9e="" data-v-708ef468="" class="unit" data-v-8b96a82e="">
                <h4 data-v-0c9f3f9e="" class="title">내용</h4>
                <div data-v-0c9f3f9e="" class="unit_content">
                    <textarea name="postContent" class="content-text" rows="10" cols="80" placeholder="내용을 입력하세요."></textarea>
                </div>
            </div>
            <div data-v-0c9f3f9e="" data-v-257b1b9e="" data-v-708ef468="" class="unit padding-top-15" data-v-8b96a82e="">
                <button type="submit" class="btn-border btn-small" id="submitBtn"> 등록 </button>
                <button type="button" class="btn-border btn-small" id="cancelButton">취소</button>

<%--                <input type='file' name='userId' style="display: none" value="${user.userId}">--%>
            </div>
        </form>
    </div>
</div>
</section>

<%--<script type="text/javascript" src="/resources/js/post-detail.js"></script>--%>
<%--<div style="height: 200px"></div>--%>
<%@include file="../includes/footer.jsp" %>
