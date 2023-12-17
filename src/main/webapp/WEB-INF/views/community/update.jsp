<%@ page pageEncoding="utf-8" %>
<%@include file="../includes/header.jsp" %>
<link rel='stylesheet' href='/resources/css/post-detail.css' type='text/css'/>
<link rel='stylesheet' href='/resources/css/comment.css' type='text/css'/>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>




<section class="post-detail-section">
    <div class="post-detail">
        <div class="profile-box">
            <a class="userImg-box" href="#">
                <img class="userImg" src="${url}${post.profile}" alt="프로필 사진">
            </a>
            <div class="profile-info">
                <p class="username">${post.nickname}</p>
                <p class="created-date" data-formatted-date="${formattedCreatedAt}"></p>
            </div>
            <div>
            </div>
        </div>
        <form role="form" action="/posts/update/${post.postId}" method="post" enctype="multipart/form-data" id="postForm">
            <div data-v-0c9f3f9e="" data-v-257b1b9e="" data-v-708ef468="" class="unit" data-v-8b96a82e="">
                <h4 data-v-0c9f3f9e="" class="title">게시물 이미지</h4>
                <div data-v-0c9f3f9e="" class="unit_content">
                    <img for="input-image" src="${url}${post.picture}" alt="이미지를 등록하세요." class="post-image"/>
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
                    <c:forEach items="${post.hashtags}" var="hashtag">
                        <input name="hashtags" value="#${hashtag}" data-v-5ee806c3="" type="text" placeholder="#fashtag" autocomplete="off" maxlength="50" class="input_txt text_fill">
                    </c:forEach>
                </div>
            </div>
            <div data-v-0c9f3f9e="" data-v-257b1b9e="" data-v-708ef468="" class="unit" data-v-8b96a82e="">
                <h4 data-v-0c9f3f9e="" class="title">내용</h4>
                <div data-v-0c9f3f9e="" class="unit_content">
                    <textarea name="postContent" class="content-text" rows="10" cols="80" placeholder="내용을 입력하세요.">${post.postContent}</textarea>
                </div>
            </div>
            <div data-v-0c9f3f9e="" data-v-257b1b9e="" data-v-708ef468="" class="unit padding-top-15" data-v-8b96a82e="">
                <button type="submit" class="btn-border btn-small " id="update-post"> 수정 </button>
                <button type="button" class="btn-border btn-small " id="update-cancel">취소</button>
                <c:forEach items="${post.hashtags}" var="hashtag" varStatus="status">
                    <input type='text' style="display: none" name='originHashtags[${status.index}]' value="${hashtag}">
                </c:forEach>
            </div>

        </form>
    </div>

</section>
<script>
    var postId = ${post.postId};
</script>

<script type="text/javascript" src="/resources/js/post-detail.js"></script>
<script type="text/javascript" src="/resources/js/comment.js"></script>
<%@include file="../includes/footer.jsp" %>
