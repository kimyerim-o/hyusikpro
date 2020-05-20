<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%> 
<link rel="stylesheet" href="<%=request.getContextPath()%>/header/header_style.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/info/infos_style.css">
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d033ab2c0002c3aedd619825d12b4956"></script>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script>
		$(function() {
			$('ul.tab li').click(function() {
				var activeTab = $(this).attr('data-tab');
				$('ul.tab li').removeClass('current');
				$('.tabcontent').removeClass('current');
				$(this).addClass('current');
				$('#' + activeTab).addClass('current');
			})
		});
</script>
<head>
<title></title>
		
</head>
<body>
<form action="/mypage.go"  method="post">
<table border="1" id="listArticle" >
	<tr>
		<td colspan="4"><a href="write.go">[게시글 쓰기]</a></td>
	</tr>
	<tr>
		<td>글 번호</td>
		<td>글 제목</td>
		<td>조회수</td>
	</tr>
	<c:if test="${articlePage.hasNoArticles()}">
		<tr>
			<td colspan="4">게시글이 없습니다.</td>
		</tr>
	</c:if>
	<c:forEach var="article" items="${articlePage.content}">
		<tr>
			<td>${article.number}</td>
			<td>
				<a href="read.go?no=${article.number}&pageNo=${articlePage.currentPage}">
					<c:out value="${article.title}" />
				</a>
			</td>
			<td>
		</tr>
	</c:forEach>
</table>

</form>	
	
</html>