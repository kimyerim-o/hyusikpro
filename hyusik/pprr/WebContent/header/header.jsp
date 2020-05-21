<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header</title>
<style type="text/css">
#rank {width: 200px;position: relative;top: -35px;left: 960px;}
#rank-list {overflow: hidden;width: 300px;height: 20px;margin: 0;}
#rank-list dd {position: relative;margin: 0;}
#rank-list ol {position: absolute;top: 0;left: 0;margin: 0;padding: 0;list-style-type: none;}
#rank-list li {height: 20px;line-height: 20px;}
</style>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
$(function() {
    var count = $('#rank-list li').length;
    var height = $('#rank-list li').height();

    function step(index) {
        $('#rank-list ol').delay(2000).animate({
            top: -height * index,
        }, 500, function() {
            step((index + 1) % count);
        });
    }

    step(1);
});
function ranking(){
	if(location=='http://localhost:8090/' || location=='http://localhost:8090/index.jsp'){
	location.replace("/main.go");}
}
</script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/header/header_style.css">
</head>
<body onload="ranking()">
<header class="body">
<form name="form1" action="<%=request.getContextPath()%>/info.go" method="get">
<!-- target="_blank" 클릭하면 새창 -->
<span class="logo"><a href="<%=request.getContextPath()%>">휴~ 식</a></span>	
  <div id="choice">
  <!-- http://localhost:8090/kim/header/header_login.jsp?site=? -->
    <select name="site" id="site" style="width:50%;height:30px;">
    	<option selected>선택하세요</option>
    		<!--<c:forEach var="review" items="${nameis.review}"> 가능 그러나 review가 아닌 info로 가져와야됨
    			<option value="${review.restno}">${review.restname}</option>
			</c:forEach>-->
        	<option value="1">서울 만남의 광장 부산방향</option>
            <option value="2">죽전휴게소 서울방향</option>
            <option value="3">기흥휴게소 부산방향</option>
            <option value="4">안성휴게소 서울방향</option>
            <option value="5">입장거봉포도휴게소 서울방향</option>
            <option value="6">망향휴게소 부산방향</option>
            <option value="7">천안삼거리휴게소 서울방향</option>
            <option value="8">천안호두휴게소 부산방향</option>
            <option value="9">청주휴게소 서울방향</option>
            <option value="10">옥산휴게소 부산방향</option>
            <option value="11">죽암휴게소 서울방향</option>
            <option value="12">죽암휴게소 부산방향</option>
            <option value="13">신탄진휴게소 서울방향</option>
    </select>
		<input type="submit" value="찾기" style="height:30px;"/>
	</div>
	</form>
	<div class="container">
		<nav class="nav">
			<ul class="list">
				<!-- filter설정하기 -->
				<li class="list-item"><a href="<%=request.getContextPath()%>/notice.go">공지사항</a></li>
				<li class="list-item"><a href="<%=request.getContextPath()%>/qna.go">Q&A</a></li>
				<li class="list-item"><a href="<%=request.getContextPath()%>/road/roadsa.jsp">사고</a></li>
				<li class="list-item"><a href="<%=request.getContextPath()%>/road.go">공사</a></li>
				<li class="list-item"><a href="<%=request.getContextPath()%>/recommand.go">추천휴게소</a></li>
                <li class="list-item"><a href="<%=request.getContextPath()%>/oilprice.go">추천주유소</a></li>
               <li class="list-item"><a href="<%=request.getContextPath()%>/review/review_list.jsp">리뷰</a></li>
                
                		<li class="list-item"><a href="admin.go">관리자</a></li>
                <u:isLogin> <!-- 로그인시 -->
                	<c:if test="${AUTHUSER.admin ==1}">
                	<li class="list-item"><a href="<%=request.getContextPath()%>/admin.go">관리자</a></li>
                	</c:if>
                	<c:if test="${AUTHUSER.admin ==0}">
                		<li class="list-item"><a href="<%=request.getContextPath()%>/mypage.go">마이페이지</a></li>
                	</c:if>
					<li class="list-item"><a href="<%=request.getContextPath()%>/logout.go">로그아웃</a></li>
                </u:isLogin>
                <u:notLogin> <!--미로그인시--> 
					<li class="list-item"><a href="<%=request.getContextPath()%>/login.go">로그인</a></li>
					<li class="list-item"><a href="<%=request.getContextPath()%>/join.go">회원가입</a></li>
                </u:notLogin>
                
			</ul>
		</nav>
	</div>
	
	
	<div id="rank">
		<dl id="rank-list">
			<dd>
				<ol>
				<li>휴게소 만족도 순위</li>
				<c:forEach var="review" items="${nameis.review}" varStatus="i">
				<li><a href="info.go?site=${review.restno}">${i.count}  ${review.restname} ${review.restis}점</a></li>
				</c:forEach>
                <li><a href="#">2 천안삼거리(서울)휴게소 5.0점</a></li>
                <li><a href="#">3 입장거봉포도(서울)휴게소 5.0점</a></li>
                <li><a href="#">4 입장거봉포도(서울)휴게소 5.0점</a></li>
                <li><a href="#">5 입장거봉포도(서울)휴게소 5.0점</a></li>
                </ol>
            </dd>
        </dl>
    </div>
</header>