<%@ page pageEncoding="utf-8" %>
<footer id="colophon" class="site-footer">
    <div class="container">
        <div class="site-info">
            <h1 class="main-logo footer-logo">#fashtag</h1>
        </div>
    </div>
</footer>
<script>
    const rawLoginUserId = '${user!=null?user.userId:null}'; //로그인 안돼있으면, loginUserId를 null로 설정.
    const loginUserId = rawLoginUserId.length > 0 ?  Number(rawLoginUserId): rawLoginUserId;
</script>
<a href="#top" class="smoothup" title="상단으로 이동"><span class="genericon genericon-collapse"></span></a>
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
        crossorigin="anonymous"></script>
<script type="text/javascript" src="/resources/js/post-like.js"></script>
<script src='/resources/js/plugins.js'></script>
<script src='/resources/js/scripts.js'></script>
<script src='/resources/js/masonry.pkgd.min.js'></script>
<script type="text/javascript" src="/resources/js/posts-new.js"></script>
<script type="text/javascript" src="/resources/js/post-detail-ud.js"></script>
</body>
</html>