<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>휴게소 테마 소개</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript">
    jQuery(document).ready(function() {
        jQuery("#btn").click(function() {
            if(jQuery("#displayDiv").css("display") == "none") {
                jQuery("#displayDiv").fadeIn();}
            else {jQuery("#displayDiv").fadeOut();}
        });
    });
</script>
</head>
<body>
    <h1>휴게소 테마 소개</h1>
    <hr/>
    <button type="button" id="btn">1위 휴게소 사진보기</button>
    <div id="displayDiv">
        <img src="https://post-phinf.pstatic.net/MjAxNzAzMjhfNzUg/MDAxNDkwNjY3NzQyMDUz.SwuuF3AkKeCURuoNetbdMtVwbkKvlF71ggwdea7BAt4g.wJox2lwR1rzTBdYsKBGJwTj9rEUYQfu-fCPq51Lgw0Eg.JPEG/1.jpg?type=w1200" width="400" height="300">

    </div>
</body>
<script type="text/javascript">
    jQuery(document).ready(function() {
        jQuery("#bttn").click(function() {
            if(jQuery("#displayDivb").css("display") == "none") {
                jQuery("#displayDivb").fadeIn();}
            else {jQuery("#displayDivb").fadeOut();}
        });
    });
</script>
</head>
<body>
    <hr/>
    <button type="button" id="bttn">2위 휴게소 사진 보기</button>
    <div id="displayDivb">
        <img src="https://www.ikld.kr/news/photo/201502/43817_21838_3340.jpg" width="400" height="300">
    </div>
</body>
<script type="text/javascript">
    jQuery(document).ready(function() {
        jQuery("#btttn").click(function() {
            if(jQuery("#displayDivbb").css("display") == "none") {
                jQuery("#displayDivbb").fadeIn();}
            else {jQuery("#displayDivbb").fadeOut();}
        });
    });
</script>
</head>
<body>
    <hr/>
    <button type="button" id="btttn">3위 휴게소 사진 보기</button>
    <div id="displayDivbb">
        <img src="https://img1.daumcdn.net/thumb/R720x0.q80/?scode=mtistory2&fname=http%3A%2F%2Fcfile4.uf.tistory.com%2Fimage%2F9907853D5C206EBC2472E1" width="400" height="300">
    </div>
</html>