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
.table2{border-collapse: collapse; width:600px;}
.table2 td{padding:3px}
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
<table class="table2">
	<c:forEach var="message" items="${viewData.messageList}">
		<tr>
			<td>메시지 번호:</td>
			<td>${message.reno}</td>
		</tr>
		<tr>	
			<td>휴게소 이름:</td>
			<td>${message.restname}</td>
		</tr>
		<tr>	
			<td>암호: </td>
			<td>${message.repw}</td>
		</tr>
		<tr>	
			<td>닉네임: </td>
			<td>${message.name}</td>
		</tr>
		<tr>	
			<td>작성일:</td>
			<td>${message.stdate}</td>
		</tr>
		<tr>	
			<td>만족도:</td>
			<td><c:forEach var="i" begin="1" end="${message.restis}">
		<c:forEach var="j" items="★">
	            	★
	        </c:forEach>
        </c:forEach>
		<c:forEach var="i" begin="1" end="${5-message.restis}">
		<c:forEach var="j" items="☆">
	            	☆
	        </c:forEach>
        </c:forEach>
		(${message.restis}점 / 5.0점)</td>
		</tr>
		<tr>	
			<td>후기: </td>
			<td>${message.recontent} </td>
		</tr>
		<tr>	
			<td colspan="2" style=" height: 40px"><a href="<%=request.getContextPath()%>/review/review_confirmDeletion.jsp?messageId=${message.reno}" style="    padding-left: 400px;">[삭제하기]</a><br/></td>
		</tr>

	</c:forEach>
</table>
</c:if>
<c:forEach var="pageNum" begin="1" end="${viewData.pageTotalCount}">
<a href="<%=request.getContextPath()%>/admin/review/review_list.jsp?page=${pageNum}">[${pageNum}]</a> 
</c:forEach>
</footer>
</body>
</html>