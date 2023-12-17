<%@ page pageEncoding="utf-8"%>
<%@include file="../includes/header.jsp"%>

<div id="page">
    <div class="container">
        <!-- #masthead -->
        <div id="content" class="site-content">
            <div id="primary" class="content-area column full">
                <div style="height: 20px"></div>
                <div data-v-838ba4a0="" class="container tag_container">

                    <div data-v-621b99be="" data-v-838ba4a0="" class="social_tag_shortcuts tag_shortcuts">

                        <c:forEach items="${hashtagName}" var="hashtag" varStatus="status">
                            <a data-v-621b99be="" href='/posts/tags/${hashtag}' class="" >
                                <div data-v-4fe1e795="" data-v-621b99be="" class="shortcut rounded">
                                    <picture data-v-44ba780a="" data-v-4fe1e795="" class="picture shortcut_image">
                                        <img
                                                data-v-44ba780a=""
                                                src=/resources/image/hashtag-image/${hashtag}.${hashtagExtension[status.index]}
                                                loading="lazy"
                                                class="image full_width"/>
                                    </picture>
                                    <div data-v-4fe1e795="" class="shortcut_title">
                                        <p
                                                data-v-8016a084=""
                                                data-v-621b99be=""
                                                class="display_paragraph"
                                                data-v-4fe1e795=""
                                                style="color: rgb(51, 51, 51); -webkit-line-clamp: 2"
                                        >
                                            <c:out value="${hashtag}"/>
                                        </p>
                                    </div>
                                </div>
                            </a>
                        </c:forEach>
                    </div>

                </div>
                <div data-v-838ba4a0="" class="container top-container">
                    <c:if test="${pageTitle eq '#POSTS'}">
                        <button onclick="location.href='/posts/new'" type="button" class="btn-border btn-small">
                            게시글 작성
                        </button>
                    </c:if>
                    <ul data-v-34267d59="" data-v-838ba4a0="" class="social_sorting sorting">
                        <c:if test="${pageTitle eq '#POSTS'}">
                            <c:choose>
                                <c:when test="${order eq 'popular'}">
                                    <li data-v-34267d59="">
                                        <a data-v-34267d59="" href="/posts?s=popular" class="choice active">인기순 </a>
                                    </li>
                                    <li data-v-34267d59="">
                                        <a data-v-34267d59="" href="/posts?s=newest" class="choice">최신순</a>
                                    </li>
                                </c:when>
                                <c:when test="${order eq 'newest'}">
                                    <li data-v-34267d59="">
                                        <a data-v-34267d59="" href="/posts?s=popular" class="choice">인기순 </a>
                                    </li>
                                    <li data-v-34267d59="">
                                        <a data-v-34267d59="" href="/posts?s=newest" class="choice active">최신순</a>
                                    </li>
                                </c:when>
                            </c:choose>
                        </c:if>
                    </ul>

                </div>
                <main id="main" class="site-main">
                    <div class="grid portfoliogrid">
                        <c:forEach items="${list}" var="post">
                            <article class="hentry">
                                <header class="entry-header">
                                    <div class="entry-thumbnail">
                                        <a href="/posts/${post.postId}"><img class="post_image" src="${url}${post.picture}" alt=""></a>
                                    </div>
                                        <%--포스트 이미지 끝--%>
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
                                            <c:forEach items="${post.hashtags}" var="hashtag">
                                                <a href="/posts/tags/${hashtag}" class="content_hashtag">#${hashtag} </a>
                                            </c:forEach>
                                        </p>
                                    </div>
                                        <%--유저 정보/ 해시태그 끝--%>
                                        <%--                                    ----------------------------------------------------%>
                                </header>
                            </article>
                        </c:forEach>
                    </div>
                    <br/>
                </main>
                <!-- #main -->
            </div>
            <!-- #primary -->
        </div>
        <!-- #content -->
    </div>
    <!-- .container -->
</div>
<script>
    var userId = ${userId}
    var order = "${order}"
    var url = "${url}"
    var pageTitle = "${pageTitle}"
</script>
<script type="text/javascript" src="/resources/js/post-scroll.js"></script>
<%@include file="../includes/footer.jsp"%>

