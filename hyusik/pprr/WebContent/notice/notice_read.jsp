<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>      
<%@ taglib prefix="u"  tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body {font-family: 'Do Hyeon', sans-serif;
font-family: 'Nanum Gothic', sans-serif;}
.header {background-color:yellowgreen}	
.button {
  color: white;
  text-align: center;
  background: blue;
  border-radius: 10px;}
table {text-align:center;}
</style>
<link rel="stylesheet" href="<%=request.getContextPath()%>/header/header_style.css">
</head>
<body>
	<table width="500" align="center">
		<tbody>
			<tr>
				<th width="100">번호</th>
				<td width="300">${articleDATA.notice.number}</td>
			</tr>
			<tr>
				<th width="100">제목</th>
				<td width="300">
				  <c:out value="${articleDATA.notice.title}"/>
				  <br/>
				</td>
			</tr>
			<tr>
				<th width="100">내용</th>
				<td width="300">
				<u:pre value="${articleDATA.content.content}" />
				</td>
			</tr>
			<tr>
				<th colspan="4">
				<%-- p662 29 --%>
				  <%-- 목록보기를 클릭하면 조회하던 페이지로 이동
				  		만약 조회하던 페이지가 없으면 1페이지로 이동
				  <c:set var="변수명" value="값"/>
				  <c:set var="변수명" value="조건?참일경우값:거짓일경우값"/>
				  <c:set var="pageNo" value="조회하던 페이지가 없니?'1':조회하던 페이지"/>
				         pageNo변수에는 '1' 또는  조회하던페이지가 저장
				  --%>
				  <c:set var="pageNo" value="${empty pageNo?'1':pageNo}"/>
					<a href="<%=request.getContextPath()%>/notice/list.go?pageNo=${pageNo}">
					<input type="button" class="button" value="목록보기"/></a>
				</th>
			</tr>
		</tbody>
	</table>
</body>
</html>









