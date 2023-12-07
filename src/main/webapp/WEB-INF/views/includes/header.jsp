<%--
  Created by IntelliJ IDEA.
  User: sangwon
  Date: 2023-12-02
  Time: 오후 3:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html;charset=UTF-8"
         pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>KreamPuff</title>
  <link rel='stylesheet' href='/resources/css/woocommerce-layout.css' type='text/css' media='all'/>
  <link rel='stylesheet' href='/resources/css/woocommerce-smallscreen.css' type='text/css' media='only screen and (max-width: 768px)'/>
  <link rel='stylesheet' href='/resources/css/woocommerce.css' type='text/css' media='all'/>
  <link rel='stylesheet' href='/resources/css/font-awesome.min.css' type='text/css' media='all'/>
  <link rel='stylesheet' href='/resources/css/style.css?after' type='text/css' media='all'/>
  <link rel='stylesheet' href='/resources/css/header.css?after' type='text/css' media='all'/><link rel='stylesheet' href='/resources/css/hashtagBar.css?after' type='text/css' media='all'/>
  <link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/static/pretendard.min.css" />
  <link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Oswald:400,500,700%7CRoboto:400,500,700%7CHerr+Von+Muellerhoff:400,500,700%7CQuattrocento+Sans:400,500,700' type='text/css' media='all'/>
  <link rel='stylesheet' href='/resources/css/easy-responsive-shortcodes.css' type='text/css' media='all'/>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&family=Walter+Turncoat&display=swap" rel="stylesheet">
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
          <a data-v-7546c27e="" href="/" aria-label="홈" class="logo">
            <h1 class="main-logo">#fashtag</h1>
<%--           https://danmarshall.github.io/google-font-to-svg-path/ 로고 부분!! svg--%>
          </a>
        </h1>
        <div data-v-77726920="" class="center"></div>
        <div data-v-77726920="" class="right">
          <div data-v-21940b30="" class="gnb_area" data-v-77726920="">
            <nav data-v-21940b30="" id="pcGnbContainer" class="gnb">
              <ul data-v-21940b30="" id="pcGnbList" class="gnb_list">
                <li data-v-70a33782="" data-v-21940b30="" class="gnb_item">
                  <a data-v-70a33782="" href="/" class="nuxt-link-active gnb_link active"> POSTS </a>
                </li>
                <li data-v-70a33782="" data-v-21940b30="" class="gnb_item">
                  <a data-v-70a33782="" href="/social" class="nuxt-link-active gnb_link"> MYPAGE </a>
                </li>
                <li data-v-70a33782="" data-v-21940b30="" class="gnb_item">
                  <a data-v-70a33782="" href="/search" class="gnb_link" > LOGIN </a>
                </li>
              </ul>
            </nav>
<%--            <div data-v-060bad62="" data-v-21940b30="" class="search_btn_box">--%>
<%--              <a data-v-060bad62="" aria-label="검색" href="#" class="btn_search"--%>
<%--              ><svg data-v-060bad62="" xmlns="http://www.w3.org/2000/svg" class="nav-search icon sprite-icons">--%>
<%--                <use--%>
<%--                        data-v-060bad62=""--%>
<%--                        href="/_nuxt/e72fd9e874df2e60bd653f838dce3aab.svg#i-nav-search"--%>
<%--                        xlink:href="/_nuxt/e72fd9e874df2e60bd653f838dce3aab.svg#i-nav-search"--%>
<%--                ></use></svg--%>
<%--              ></a>--%>
<%--            </div>--%>
<%--            search button box--%>
          </div>
        </div>
      </div> <%--      main_inner--%>
      <h1 data-v-ace09ba4="" class="page_title">POSTS</h1>
    </div><%--    header_main--%>

    <div data-v-77726920="" class="portal_target vue-portal-target"></div>
  </div>
  <!---->

</div>



<%--    <header id="masthead" class="site-header">--%>
<%--      <div class="site-branding">--%>
<%--        <h1 class="site-title"><a href="index.html" rel="home">Kream</a></h1>--%>
<%--      </div>--%>
<%--      <nav id="site-navigation" class="main-navigation">--%>
<%--        <button class="menu-toggle">Menu</button>--%>
<%--        <a class="skip-link screen-reader-text" href="#content">Skip to content</a>--%>
<%--        <div class="menu-menu-1-container">--%>
<%--          <ul id="menu-menu-1" class="menu">--%>
<%--            <li><a href="index.html">Home</a></li>--%>
<%--            <li><a href="about.html">About</a></li>--%>
<%--            <li><a href="shop.html">Shop</a></li>--%>
<%--            <li><a href="blog.html">Blog</a></li>--%>
<%--            <li><a href="elements.html">Elements</a></li>--%>
<%--            <li><a href="#">Pages</a>--%>
<%--              <ul class="sub-menu">--%>
<%--                <li><a href="portfolio-item.html">Portfolio Item</a></li>--%>
<%--                <li><a href="blog-single.html">Blog Article</a></li>--%>
<%--                <li><a href="shop-single.html">Shop Item</a></li>--%>
<%--                <li><a href="portfolio-category.html">Portfolio Category</a></li>--%>
<%--              </ul>--%>
<%--            </li>--%>
<%--            <li><a href="contact.html">Contact</a></li>--%>
<%--          </ul>--%>
<%--        </div>--%>
<%--      </nav>--%>
<%--    </header>--%>

