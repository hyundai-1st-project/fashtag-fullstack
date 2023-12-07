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
  <link rel='stylesheet' href='/resources/css/top-header.css?after' type='text/css' media='all'/>
    <link rel='stylesheet' href='/resources/css/hashtagBar.css?after' type='text/css' media='all'/>
  <link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/static/pretendard.min.css" />
  <link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Oswald:400,500,700%7CRoboto:400,500,700%7CHerr+Von+Muellerhoff:400,500,700%7CQuattrocento+Sans:400,500,700' type='text/css' media='all'/>
  <link rel='stylesheet' href='/resources/css/easy-responsive-shortcodes.css' type='text/css' media='all'/>
</head>
<body class="home page page-template page-template-template-portfolio page-template-template-portfolio-php">
<div data-v-ace09ba4="" class="gnb no_line" data-v-87ac27a0="">
  <div data-v-77726920="" data-v-21940b30="" class="header social">
    <div data-v-77726920="" class="header_top">
      <div data-v-77726920="" class="top_inner">
<%--        <ul data-v-77726920="" class="top_list">--%>
<%--          <li data-v-77726920="" class="top_item">--%>
<%--            <a data-v-77726920="" href="/notice" class="top_link"> 고객센터 </a>--%>
<%--          </li>--%>
<%--          <li data-v-77726920="" class="top_item">--%>
<%--            <a data-v-77726920="" href="/my" class="top_link"> 마이페이지 </a>--%>
<%--          </li>--%>
<%--          <li data-v-77726920="" class="top_item"><a data-v-77726920="" href="/saved" class="top_link"> 관심 </a></li>--%>
<%--          <li data-v-77726920="" class="top_item">--%>
<%--            <a data-v-77726920="" href="#notifications" class="top_link"> 알림 </a>--%>
<%--          </li>--%>
<%--          <li data-v-77726920="" class="top_item"><a data-v-77726920="" href="/login" class="top_link"> 로그인 </a></li>--%>
<%--        </ul>--%>
      </div>
    </div>
    <div data-v-77726920="" class="header_main">
      <div data-v-77726920="" class="main_inner">
        <h1 data-v-7546c27e="" data-v-77726920="">
          <a data-v-7546c27e="" href="/" aria-label="홈" class="logo">
            <svg width="191.8" height="25.025" viewBox="0 0 191.8 25.025" xmlns="http://www.w3.org/2000/svg">
              <g id="svgGroup" stroke-linecap="round" fill-rule="evenodd" font-size="9pt"
                 stroke="#000" stroke-width="0.25mm" fill="#000"
                 style="stroke:#000;stroke-width:0.25mm;fill:#000">
                <path d="M 92.575 24.745 L 85.19 24.745 L 85.19 7.21 L 92.47 7.21 L 92.47 11.025 A 7.667 7.667 0 0 1 93.308 9.436 A 5.895 5.895 0 0 1 94.693 8.015 A 5.38 5.38 0 0 1 96.742 7.125 A 7.657 7.657 0 0 1 98.35 6.965 A 7.349 7.349 0 0 1 100.154 7.177 A 5.681 5.681 0 0 1 102.043 8.033 Q 103.565 9.1 104.195 10.78 A 10.05 10.05 0 0 1 105.757 8.937 A 8.541 8.541 0 0 1 107.013 7.98 A 6.563 6.563 0 0 1 109.313 7.108 A 8.976 8.976 0 0 1 110.95 6.965 A 7.151 7.151 0 0 1 113.174 7.294 A 5.665 5.665 0 0 1 115.99 9.328 A 7.931 7.931 0 0 1 117.21 11.767 Q 117.775 13.574 117.775 15.995 L 117.775 24.745 L 110.39 24.745 L 110.39 15.61 A 6.518 6.518 0 0 0 110.306 14.512 Q 109.969 12.552 108.284 12.497 A 3.018 3.018 0 0 0 108.185 12.495 A 2.718 2.718 0 0 0 107.025 12.737 Q 106.434 13.012 105.998 13.598 Q 105.175 14.7 105.175 16.555 L 105.175 24.745 L 97.79 24.745 L 97.79 15.61 A 7.656 7.656 0 0 0 97.748 14.779 Q 97.656 13.938 97.361 13.427 A 1.863 1.863 0 0 0 97.23 13.23 A 1.816 1.816 0 0 0 96.035 12.53 A 2.749 2.749 0 0 0 95.585 12.495 Q 94.22 12.495 93.398 13.563 A 3.589 3.589 0 0 0 92.821 14.706 Q 92.667 15.204 92.61 15.802 A 7.857 7.857 0 0 0 92.575 16.555 L 92.575 24.745 Z M 8.12 24.745 L 0 24.745 L 0 0.665 L 8.12 0.665 L 8.12 10.255 L 10.605 10.255 L 15.295 0.665 L 24.045 0.665 L 17.675 12.6 L 24.92 24.745 L 15.68 24.745 L 10.5 15.47 L 8.12 15.47 L 8.12 24.745 Z M 143.57 16.52 L 143.57 7.21 L 150.78 7.21 L 150.78 16.835 A 5.086 5.086 0 0 0 150.831 17.583 Q 150.888 17.966 151.009 18.272 A 1.994 1.994 0 0 0 151.392 18.9 A 2.022 2.022 0 0 0 152.602 19.531 A 2.896 2.896 0 0 0 153.055 19.565 A 2.491 2.491 0 0 0 153.741 19.475 A 1.847 1.847 0 0 0 154.648 18.9 A 2.038 2.038 0 0 0 155.021 18.24 Q 155.129 17.936 155.18 17.559 A 5.434 5.434 0 0 0 155.225 16.835 L 155.225 7.21 L 162.295 7.21 L 162.295 16.52 A 10.726 10.726 0 0 1 162.008 19.076 A 7.265 7.265 0 0 1 159.863 22.785 Q 157.706 24.771 153.995 24.996 A 16.095 16.095 0 0 1 153.02 25.025 Q 149.549 25.025 147.263 23.649 A 7.703 7.703 0 0 1 146.072 22.768 A 7.404 7.404 0 0 1 143.736 18.462 A 10.837 10.837 0 0 1 143.57 16.52 Z M 173.46 24.745 L 166.075 24.745 L 166.075 11.55 L 163.87 11.55 L 163.87 7.21 L 166.075 7.21 L 166.075 6.195 Q 166.075 4.27 167.02 2.888 A 5.965 5.965 0 0 1 169.126 1.01 A 7.351 7.351 0 0 1 169.645 0.753 A 8.44 8.44 0 0 1 171.825 0.124 A 11.236 11.236 0 0 1 173.53 0 Q 176.33 0 178.15 0.77 L 177.66 5.215 A 14.737 14.737 0 0 0 176.339 4.976 A 13.395 13.395 0 0 0 176.155 4.953 Q 175.42 4.865 174.72 4.865 A 5.732 5.732 0 0 0 173.923 4.916 Q 173.011 5.044 172.636 5.502 A 1.218 1.218 0 0 0 172.375 6.3 Q 172.375 6.755 172.62 7.21 L 177.555 7.21 L 177.555 11.55 L 173.46 11.55 L 173.46 24.745 Z M 187.11 24.745 L 179.725 24.745 L 179.725 11.55 L 177.52 11.55 L 177.52 7.21 L 179.725 7.21 L 179.725 6.195 Q 179.725 4.27 180.67 2.888 A 5.965 5.965 0 0 1 182.776 1.01 A 7.351 7.351 0 0 1 183.295 0.753 A 8.44 8.44 0 0 1 185.475 0.124 A 11.236 11.236 0 0 1 187.18 0 Q 189.98 0 191.8 0.77 L 191.31 5.215 A 14.737 14.737 0 0 0 189.989 4.976 A 13.395 13.395 0 0 0 189.805 4.953 Q 189.07 4.865 188.37 4.865 A 5.732 5.732 0 0 0 187.573 4.916 Q 186.661 5.044 186.286 5.502 A 1.218 1.218 0 0 0 186.025 6.3 Q 186.025 6.755 186.27 7.21 L 191.205 7.21 L 191.205 11.55 L 187.11 11.55 L 187.11 24.745 Z M 74.41 11.025 L 74.41 7.21 L 81.69 7.21 L 81.69 24.745 L 74.34 24.745 L 74.34 21.49 A 7.19 7.19 0 0 1 73.36 23.004 A 5.825 5.825 0 0 1 72.1 24.115 A 5.418 5.418 0 0 1 70.304 24.851 Q 69.58 25.011 68.743 25.024 A 9.528 9.528 0 0 1 68.6 25.025 Q 66.185 25.025 64.225 23.853 Q 62.265 22.68 61.128 20.615 A 9.178 9.178 0 0 1 60.061 17.183 A 11.485 11.485 0 0 1 59.99 15.89 A 10.532 10.532 0 0 1 60.257 13.469 A 8.351 8.351 0 0 1 61.128 11.235 Q 62.265 9.24 64.225 8.103 Q 66.185 6.965 68.6 6.965 A 6.356 6.356 0 0 1 71.495 7.676 A 7.714 7.714 0 0 1 71.925 7.91 Q 73.535 8.855 74.41 11.025 Z M 129.01 24.745 L 121.275 24.745 L 121.275 0.63 L 129.43 0.63 A 29.497 29.497 0 0 1 132.546 0.784 Q 135.963 1.148 138.083 2.375 A 8.312 8.312 0 0 1 138.408 2.573 A 6.445 6.445 0 0 1 140.624 4.874 Q 141.435 6.339 141.435 8.295 A 8.731 8.731 0 0 1 141.17 10.495 A 6.792 6.792 0 0 1 140.122 12.758 A 7.745 7.745 0 0 1 137.553 15.022 A 9.926 9.926 0 0 1 136.43 15.558 A 12.633 12.633 0 0 1 133.752 16.294 Q 132.496 16.502 131.072 16.519 A 21.227 21.227 0 0 1 130.83 16.52 L 129.01 16.52 L 129.01 24.745 Z M 56.805 19.145 L 57.645 23.66 A 11.884 11.884 0 0 1 55.205 24.583 A 13.394 13.394 0 0 1 54.827 24.675 A 13.158 13.158 0 0 1 53.202 24.937 Q 52.383 25.02 51.468 25.025 A 21.727 21.727 0 0 1 51.345 25.025 Q 47.81 25.025 45.413 23.87 Q 43.015 22.715 41.79 20.685 Q 40.565 18.655 40.565 15.995 Q 40.565 13.265 41.878 11.235 Q 43.19 9.205 45.395 8.085 A 10.452 10.452 0 0 1 49.745 6.976 A 12.33 12.33 0 0 1 50.26 6.965 A 10.105 10.105 0 0 1 52.734 7.25 A 6.733 6.733 0 0 1 56.315 9.433 Q 58.415 11.9 58.415 16.45 L 47.985 17.78 A 3.977 3.977 0 0 0 50.859 19.979 A 6.856 6.856 0 0 0 52.325 20.125 A 11.034 11.034 0 0 0 53.642 20.043 A 13.451 13.451 0 0 0 54.477 19.915 Q 55.615 19.705 56.805 19.145 Z M 33.18 24.745 L 25.795 24.745 L 25.795 7.21 L 33.075 7.21 L 33.075 11.585 A 9.018 9.018 0 0 1 33.665 10.067 Q 34.09 9.223 34.665 8.619 A 4.847 4.847 0 0 1 35.262 8.085 A 5.556 5.556 0 0 1 38.122 6.998 A 7.106 7.106 0 0 1 38.815 6.965 L 39.69 13.16 Q 38.85 13.055 38.045 13.055 A 8.663 8.663 0 0 0 36.239 13.226 Q 33.18 13.881 33.18 17.045 L 33.18 24.745 Z M 70.875 19.495 A 3.304 3.304 0 0 0 73.285 18.503 A 4.058 4.058 0 0 0 73.325 18.463 A 3.478 3.478 0 0 0 74.34 15.937 A 4.423 4.423 0 0 0 74.34 15.925 A 3.646 3.646 0 0 0 74.146 14.712 A 3.143 3.143 0 0 0 73.325 13.458 Q 72.31 12.495 70.875 12.495 A 3.669 3.669 0 0 0 69.497 12.747 A 3.391 3.391 0 0 0 68.355 13.51 A 3.373 3.373 0 0 0 67.34 15.949 A 4.231 4.231 0 0 0 67.34 15.995 Q 67.34 17.465 68.355 18.48 Q 69.37 19.495 70.875 19.495 Z M 129.01 11.655 L 130.515 11.655 A 7.225 7.225 0 0 0 131.592 11.58 Q 132.165 11.493 132.63 11.307 A 3.235 3.235 0 0 0 133.385 10.885 Q 134.4 10.115 134.4 8.575 A 3.334 3.334 0 0 0 134.294 7.711 A 2.28 2.28 0 0 0 133.42 6.423 A 3.252 3.252 0 0 0 132.479 5.958 Q 131.686 5.705 130.585 5.705 L 129.01 5.705 L 129.01 11.655 Z M 47.425 14.56 L 52.92 13.405 Q 52.78 12.285 52.15 11.743 A 2.22 2.22 0 0 0 50.96 11.224 A 2.977 2.977 0 0 0 50.575 11.2 A 3.284 3.284 0 0 0 49.569 11.347 A 2.629 2.629 0 0 0 48.352 12.163 Q 47.53 13.125 47.425 14.56 Z" vector-effect="non-scaling-stroke"/>
              </g>
            </svg>
<%--           https://danmarshall.github.io/google-font-to-svg-path/ 로고 부분!!--%>
          </a>
        </h1>
        <div data-v-77726920="" class="center"></div>
        <div data-v-77726920="" class="right">
          <div data-v-21940b30="" class="gnb_area" data-v-77726920="">
            <nav data-v-21940b30="" id="pcGnbContainer" class="gnb">
              <ul data-v-21940b30="" id="pcGnbList" class="gnb_list">
                <li data-v-70a33782="" data-v-21940b30="" class="gnb_item">
                  <a data-v-70a33782="" href="/" class="nuxt-link-active gnb_link active"> STYLE </a>
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

