<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="review.dto.ReviewDto"%>
<%@ page import="review.service.ReviewListView"%>
<%@ page import="review.service.GetMessageListService"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String pageNumberStr = request.getParameter("page");
	int pageNumber = 1;
	if (pageNumberStr != null) {
		pageNumber = Integer.parseInt(pageNumberStr);
	}

	GetMessageListService messageListService =
			GetMessageListService.getInstance();
	ReviewListView viewData = 
			messageListService.getMessageList(pageNumber);
	
	request.setCharacterEncoding("utf-8");
%>
<c:set var="viewData" value="<%= viewData %>"/>
<html>
<meta charset="UTF-8">
<head>
	<title>댓글 목록</title>
<style>
footer {margin-left:620px;margin-top:50px}
#review{height:200px;padding-left:200px;font-size:22px}
#comment{width:60%;height:30px}
.fas fa-bed {font: FontAwesome !important;}
</style>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
<link rel="stylesheet" href="<%=request.getContextPath()%>/header/header_style.css">
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Nanum+Gothic:wght@700&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
 $("header").remove(".body");
 $("#page-wrapper").attr("id","");
</script>
</head>
<body>
<jsp:include page="../admin.jsp"/>
<footer>
<c:if test="${viewData.isEmpty()}">
등록된 메시지가 없습니다.
</c:if>
<c:if test="${!viewData.isEmpty()}">
<table border="1" width="450">
	<c:forEach var="message" items="${viewData.messageList}">
	<tr>
		<td>
		메시지 번호: ${message.reno} <br/>
		휴게소 이름: ${message.restname}<br/>
		닉네임: ${message.name} <br/>
		암호:${message.repw}<br/>
		작성일: ${message.stdate} <br/>
		만족도: <c:forEach var="i" begin="1" end="${message.restis}">
		<c:forEach var="j" items="★">
	            	★
	        </c:forEach>
        </c:forEach>
		<c:forEach var="i" begin="1" end="${5-message.restis}">
		<c:forEach var="j" items="☆">
	            	☆
	        </c:forEach>
        </c:forEach>
		(${message.restis}점 / 5.0점) <br/>
		후기: ${message.recontent} <br/>
		<a href="<%=request.getContextPath()%>/admin/review/review_confirmDeletion.jsp?messageId=${message.reno}">[삭제하기]</a>
		</td>
	</tr>
	</c:forEach>
</table>

<c:forEach var="pageNum" begin="1" end="${viewData.pageTotalCount}">
<a href="<%=request.getContextPath()%>/admin/review/review_list.jsp?page=${pageNum}">[${pageNum}]</a> 
</c:forEach>

</c:if>
</footer>
</body>
</html>