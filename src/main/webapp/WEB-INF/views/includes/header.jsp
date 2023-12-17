<%@ page language="java" contentType="text/html;charset=UTF-8"
         pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>#fashtag</title>
    <link rel='stylesheet' href='/resources/css/style.css?after' type='text/css' media='all'/>
    <link rel='stylesheet' href='/resources/css/header.css?after' type='text/css' media='all'/>
    <link rel='stylesheet' href='/resources/css/user-card.css?after' type='text/css' media='all'/>
    <link rel='stylesheet' href='/resources/css/hashtagBar.css?after' type='text/css' media='all'/>
    <link rel='stylesheet' href='/resources/css/post-new.css?after' type='text/css'/>
    <link rel='stylesheet' href='/resources/css/post-detail.css?after' type='text/css'/>
    <link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/static/pretendard.min.css" />
    <link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Oswald:400,500,700%7CRoboto:400,500,700%7CHerr+Von+Muellerhoff:400,500,700%7CQuattrocento+Sans:400,500,700' type='text/css' media='all'/>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&family=Walter+Turncoat&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
            crossorigin="anonymous"></script>
    <script src="https://unpkg.com/masonry-layout@4/dist/masonry.pkgd.min.js"></script>
    <script src="https://unpkg.com/imagesloaded@4/imagesloaded.pkgd.min.js"></script>
    

</head>
<body class="home page page-template page-template-template-portfolio page-template-template-portfolio-php">
<div data-v-ace09ba4="" class="gnb no_line" data-v-87ac27a0="">
  <div data-v-77726920="" data-v-21940b30="" class="header social">
    <div data-v-77726920="" class="header_top">
      <div data-v-77726920="" class="top_inner">
      </div>
    </div>
    <div data-v-77726920="" class="header_main">
      <div data-v-77726920="" class="main_inner">
        <h1 data-v-7546c27e="" data-v-77726920="">
          <a data-v-7546c27e="" href="/posts" aria-label="홈" class="logo">
            <h1 class="main-logo">#fashtag</h1>
          </a>
        </h1>
        <div data-v-77726920="" class="center"></div>
        <div data-v-77726920="" class="right">
          <div data-v-21940b30="" class="gnb_area" data-v-77726920="">
            <nav data-v-21940b30="" id="pcGnbContainer" class="gnb">
              <ul data-v-21940b30="" id="pcGnbList" class="gnb_list">
                <li data-v-70a33782="" data-v-21940b30="" class="gnb_item">
                  <a data-v-70a33782="" href="/posts" class="nuxt-link-active gnb_link active"> POSTS </a>
                </li>
                <li data-v-70a33782="" data-v-21940b30="" class="gnb_item">

                    <sec:authorize access="isAnonymous()">
                        <a data-v-70a33782="" href="/login" class="gnb_link">MYPAGE</a>
                    </sec:authorize>
                    <sec:authorize access="isAuthenticated()">
                        <sec:authentication property="principal.userVO" var="user" />
                        <a data-v-70a33782="" href="/mypage/${user.userId}" class="gnb_link">MYPAGE</a>
                    </sec:authorize>

                </li>
                <li data-v-70a33782="" data-v-21940b30="" class="gnb_item">
                  <sec:authorize access="isAnonymous()">
                    <a data-v-70a33782="" href="/login" class="gnb_link">LOGIN</a>
                  </sec:authorize>
                  <sec:authorize access="isAuthenticated()">
                    <a data-v-70a33782="" href="/logout" class="gnb_link">LOGOUT</a>
                  </sec:authorize>

                </li>
              </ul>
            </nav>
          </div>
        </div>
      </div> <%--      main_inner--%>
      <h1 class="page_title">${pageTitle}</h1>
    </div><%--    header_main--%>

    <div data-v-77726920="" class="portal_target vue-portal-target"></div>
  </div>
  <!---->
</div>