<%--
  Created by IntelliJ IDEA.
  User: sangwon
  Date: 2023-12-02
  Time: 오후 3:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding="utf-8"%>
<%@include file="../includes/header.jsp"%>

<div id="page">
    <div class="container">
        <!-- #masthead -->
        <div id="content" class="site-content">
            <div id="primary" class="content-area column full">
                <div style="height: 20px"></div>
                <div data-v-838ba4a0="" class="container tag_container">
                    <c:if test="${pageTitle eq '#POSTS'}">
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
                    </c:if>
                </div>
                <div data-v-838ba4a0="" class="container top-container">
                    <button onclick="location.href='/posts/new'" type="button" class="btn-border btn-small">
                        게시글 작성
                    </button>
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
                                        <a href="/posts/${post.postId}"><img class="post_image" src="${post.picture}" alt=""></a>
                                    </div>
                                    <%--포스트 이미지 끝--%>
                                    <div data-v-12986062="" class="card_detail">
                                        <div data-v-12986062="" class="user_box">
                                            <picture data-v-44ba780a="" data-v-12986062="" class="picture img_profile">
<%--                                                <source data-v-44ba780a="" type="image/webp" srcset="https://kream-phinf.pstatic.net/MjAyMDExMDZfMjAz/MDAxNjA0NjQ5OTM1NDk5.edZ7v2ODWVS7_M8PXg8B0PNU5UlsTWup2XHwuKkEEXsg.lNHXDE66TKM0yl1nIOO70PWNUtK4TcdgD1lImetPB48g.JPEG/p_8d36c20aaeb94c6681619dcd775f5286.jpeg?type=s_webp">--%>
<%--                                                <source data-v-44ba780a="" srcset="https://kream-phinf.pstatic.net/MjAyMDExMDZfMjAz/MDAxNjA0NjQ5OTM1NDk5.edZ7v2ODWVS7_M8PXg8B0PNU5UlsTWup2XHwuKkEEXsg.lNHXDE66TKM0yl1nIOO70PWNUtK4TcdgD1lImetPB48g.JPEG/p_8d36c20aaeb94c6681619dcd775f5286.jpeg?type=s">--%>
                                                <img data-v-44ba780a="" alt="사용자 프로필 이미지" src="${post.profile}" loading="lazy" class="image full_width">
                                            </picture>
                                            <span data-v-7ddd6c4e="" data-v-12986062="" class="user_name">
                                              <span data-v-7ddd6c4e=""><a href="/user/mypage">${post.nickname}</a></span><!---->
                                            </span>
                                            <span data-v-12986062="" aria-label="좋아요" role="button" class="btn like">
                                              <img src="/resources/image/icon/icon-heart-off.svg" class="like_icon" />
                                              <span data-v-12986062="" class="like_count">${post.likeCount}</span>
                                            </span>
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
<%--                        <article class="hentry">--%>
<%--                            <header class="entry-header">--%>
<%--                                <div class="entry-thumbnail">--%>
<%--                                    <a href="portfolio-item.html"><img src="/resources/image/paris.png"--%>
<%--                                                                       alt="[FOURM THE STORE] 프린팅 티셔츠"></a>--%>
<%--                                </div>--%>
<%--                                <h2 class="entry-title"><a href="portfolio-item.html" rel="bookmark">Sunset Beach</a></h2>--%>
<%--                                <a class='portfoliotype' href='portfolio-category.html'>a</a>--%>
<%--                                <a class='portfoliotype' href='portfolio-category.html'>b</a>--%>
<%--                                <a class='portfoliotype' href='portfolio-category.html'>c</a>--%>
<%--                            </header>--%>
<%--                        </article>--%>

<%--                        <article class="hentry">--%>
<%--                            <header class="entry-header">--%>
<%--                                <div class="entry-thumbnail">--%>
<%--                                    <a href="portfolio-item.html"><img src="https://cdn.hfashtagmall.com/goods/YSBR/23/02/24/GM0123021746121_0_ORGINL.jpg?RS=960x960&amp;AR=0&amp;CS=640x960"--%>
<%--                                                                       alt="[FOURM THE STORE] 프린팅 티셔츠"></a>--%>
<%--                                </div>--%>
<%--                                <h2 class="entry-title"><a href="portfolio-item.html" rel="bookmark">Earl of Moreland</a></h2>--%>
<%--                                <a class='portfoliotype' href='portfolio-category.html'>hat</a>--%>
<%--                                <a class='portfoliotype' href='portfolio-category.html'>woman</a>--%>
<%--                                <a class='portfoliotype' href='portfolio-category.html'>yellow</a>--%>
<%--                            </header>--%>
<%--                        </article>--%>

<%--                        <article class="hentry">--%>
<%--                            <header class="entry-header">--%>
<%--                                <div class="entry-thumbnail">--%>
<%--                                    <a href="portfolio-item.html"><img src="https://cdn.hfashtagmall.com/goods/APBR/23/10/26/GM0123102657598_1_ORGINL_1698393664667.jpg?RS=960x960&amp;AR=0&amp;CS=640x960"--%>
<%--                                                                       alt="브러쉬 스트라이프 크루넥 스웨터" ></a>--%>
<%--                                </div>--%>
<%--                                <h2 class="entry-title"><a href="portfolio-item.html" rel="bookmark">Eliza and John</a></h2>--%>
<%--                                <a class='portfoliotype' href='portfolio-category.html'>summer</a>--%>
<%--                                <a class='portfoliotype' href='portfolio-category.html'>woman</a>--%>
<%--                                <a class='portfoliotype' href='portfolio-category.html'>yellow</a>--%>
<%--                            </header>--%>
<%--                        </article>--%>

<%--                        <article class="hentry">--%>
<%--                            <header class="entry-header">--%>
<%--                                <div class="entry-thumbnail">--%>
<%--                                    <a href="portfolio-item.html"><img src="https://cdn.hfashtagmall.com/goods/YSBR/23/02/24/GM0123021746121_0_ORGINL.jpg?RS=960x960&amp;AR=0&amp;CS=640x960"--%>
<%--                                                                       alt="[FOURM THE STORE] 프린팅 티셔츠"></a>--%>
<%--                                </div>--%>
<%--                                <h2 class="entry-title"><a href="portfolio-item.html" rel="bookmark">Hot Afternoon</a></h2>--%>
<%--                                <a class='portfoliotype' href='portfolio-category.html'>pink</a>--%>
<%--                                <a class='portfoliotype' href='portfolio-category.html'>woman</a>--%>
<%--                                <a class='portfoliotype' href='portfolio-category.html'>yellow</a>--%>
<%--                            </header>--%>
<%--                        </article>--%>

<%--                        <article class="hentry">--%>
<%--                            <header class="entry-header">--%>
<%--                                <div class="entry-thumbnail">--%>
<%--                                    <a href="portfolio-item.html"><img src="/resources/image/paris.png"--%>
<%--                                                                       alt="[FOURM THE STORE] 프린팅 티셔츠"></a>--%>
<%--                                </div>--%>
<%--                                <h2 class="entry-title"><a href="portfolio-item.html" rel="bookmark">Long Walks</a></h2>--%>
<%--                                <a class='portfoliotype' href='portfolio-category.html'>hat</a>--%>
<%--                                <a class='portfoliotype' href='portfolio-category.html'>summer</a>--%>
<%--                                <a class='portfoliotype' href='portfolio-category.html'>yellow</a>--%>
<%--                            </header>--%>
<%--                        </article>--%>

<%--                        <article class="hentry">--%>
<%--                            <header class="entry-header">--%>
<%--                                <div class="entry-thumbnail">--%>
<%--                                    <a href="portfolio-item.html"><img src="https://cdn.hfashtagmall.com/goods/APBR/23/10/26/GM0123102657598_1_ORGINL_1698393664667.jpg?RS=960x960&amp;AR=0&amp;CS=640x960"--%>
<%--                                                                       alt="브러쉬 스트라이프 크루넥 스웨터" ></a>--%>
<%--                                </div>--%>
<%--                                <h2 class="entry-title"><a href="portfolio-item.html" rel="bookmark">Twilight</a></h2>--%>
<%--                                <a class='portfoliotype' href='portfolio-category.html'>hat</a>--%>
<%--                                <a class='portfoliotype' href='portfolio-category.html'>woman</a>--%>
<%--                                <a class='portfoliotype' href='portfolio-category.html'>summer</a>--%>
<%--                            </header>--%>
<%--                        </article>--%>

                    </div>
                    <!-- .grid -->

<%--                    <nav class="pagination">--%>
<%--                        <span class="page-numbers current">1</span>--%>
<%--                        <a class="page-numbers" href="#">2</a>--%>
<%--                        <a class="next page-numbers" href="#">Next »</a>--%>
<%--                    </nav>--%>
<%--                    페이징 처리 부분, 페이지--%>
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
<%@include file="../includes/footer.jsp"%>


