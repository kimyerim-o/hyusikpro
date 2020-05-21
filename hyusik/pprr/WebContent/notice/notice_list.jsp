<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="u" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<style>
body {width:1200px;margin-left:250px;margin-top: 0px;
}
.title {font-size:25px;padding:100px;}
.header1 {background-color:#77d8d8;height:15px}	
.button {
  color: white;
  text-align: center;
  background: #0779e4;
  border-radius: 10px;}
table {text-align:center;width:1150px;height:10px;padding-top:50px;}
</style>
<link rel="stylesheet" href="<%=request.getContextPath()%>/header/header_style.css">
</head>
<body>
	<table name="notice" width="1000" align="center" >
		<tr>
		<th colspan="5" width="800" class="title">
	        공지사항 게시판
	    </th>
	    </tr>
	    <tr><td></td></tr>
		<tr class="header1">
			<th width="50">번호</th>
			<th width="300">제목</th>
			<th width="150">작성일</th>
			<th width="50">조회수</th>
		</tr>
		<c:if test="${articlePAPE.hasNoArticles()}">
			<tr>
				<th colspan="5">공지사항이 존재하지 않습니다.</th>
			</tr>
		</c:if>    
		    
		<c:forEach var="notice" items="${articlePAPE.content}">
			<tr>
			  <%-- ${aritcle.number}은 Article클래스의 getNumber()메소드를 호출 --%>
				<td width="50">${notice.number} </td>
				<td width="300"><a href="<%=request.getContextPath()%>
				/notice/read.go?no=${notice.number}&pageNo=${articlePAPE.currentPage}">
				<c:out value="${notice.title}"/></a></td>
				<td width="150">${notice.regDate}</td>
				<td width="50">${notice.readCount}</td>
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










