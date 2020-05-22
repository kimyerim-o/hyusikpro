<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="u" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<style>
.table {
	border-collapse: collapse;
	margin-top: 50px;
	text-align:center;
}

.table td, .table th {
	border: 1px solid white;
	padding: 20px;
}

.table td:first-child, .table th:first-child {
	width:100px;
}
thead {
	background-color:rgb(159,197,232);
	height:15px;
	font-weight:bold;
}
.button {
  color: white;
  text-align: center;
  background: #0779e4;
  border-radius: 10px;}
</style>
<link rel="stylesheet" href="<%=request.getContextPath()%>/header/header_style.css">
</head>
<body>
	<table class="table" width="1230px" align="center" >
	<thead>
		<tr>
			<th colspan="5" class="title">
		  	    공지사항
	    	</th>
	    </tr>
		<tr class="tt">
			<td>번호</td>
			<td>제목</td>
			<td>작성일</td>
			<td>조회수</td>
		</tr>
	</thead>
		<c:if test="${articlePAPE.hasNoArticles()}">
			<tr>
				<th colspan="5">공지사항이 존재하지 않습니다.</th>
			</tr>
		</c:if>    
		    
		<c:forEach var="notice" items="${articlePAPE.content}">
			<tr>
			  <%-- ${aritcle.number}은 Article클래스의 getNumber()메소드를 호출 --%>
				<td>${notice.number} </td>
				<td><a href="<%=request.getContextPath()%>
				/notice/read.go?no=${notice.number}&pageNo=${articlePAPE.currentPage}">
				<c:out value="${notice.title}"/></a></td>
				<td><fmt:formatDate value="${notice.regDate}" pattern="yyyy년 MM월 dd일"/></td>
				<td>${notice.readCount}</td>
			</tr>
		</c:forEach> 
	<%-- 페이징 부분  p653 37--%>
	<c:if test="${articlePAPE.hasArticles()}">
		<tr>
			<th colspan="5">
				<%-- [이전prev]출력 --%>
				<c:if test="${articlePAPE.startPage>5}">
				<a href="<%=request.getContextPath()%>/notice/list.go?pageNo=${articlePAPE.startPage-5}">
				<input type="button" class="button" value="이전"/></a>
				</c:if>
				
				<%-- 페이지출력 [이전] [1] [2] [3] [4] [5] --%>
				<c:forEach var="pNo" 
				           begin="${articlePAPE.startPage}" 
				           end="${articlePAPE.endPage}">
				<a href="<%=request.getContextPath()%>/notice/list.go?pageNo=${pNo}">[${pNo}]</a>
				</c:forEach>
				
				<%-- [다음next]출력 --%>
				<c:if test="${articlePAPE.endPage<articlePAPE.totalPages}">
				<a href="<%=request.getContextPath()%>/notice/list.go?pageNo=${articlePAPE.startPage+5}">
				<input type="button" class="button" value="다음"/></a>
				</c:if>
			</th>
		</tr>
	</c:if>
	</table>
</body>
</html>










