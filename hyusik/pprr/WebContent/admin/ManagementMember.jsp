<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 	request.setCharacterEncoding("UTF-8");%> 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>ManagementBoard</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/header/header_style.css">
    <style>
#td
{
	font-size:15px;
	font-family:'NanumSquareRoundB';
}
.cls1 {font-size: 40px; text-align: center;}
.cls2 {font-size: 20px; text-align: center;}
.gogo {margin-top:500px}
</style>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
 $("header").remove(".body");
 $("#page-wrapper").attr("id","");
</script>
</head>
<body>
<jsp:include page="admin.jsp"/>

</head>
<body>

<div align="center">
<p class="cls1">회원정보관리</p>
    회원 조회 페이지입니다.<br/>
   회원을 조회해주세요..<br/>
   <form action="<%=request.getContextPath()%>/membersarch.go" method="post">
    	<table>
	        <tr>
	            <td>회원 이메일: <input type="text" id="memailchk"name="memailchk" ></td>
	            <td>회원 닉네임: <input type="text" id="mbnamechk" name="mbnamechk" ></td>
	        </tr>
	        <tr>
	        </tr>
	        <tr class="gogo">
	            <td><input type="submit" value="조회하기"></td>
	            <td><input type="reset" value="다시작성"></td>
	        </tr>
    	</table>
	</form> 
</div>
<form method="post" action="<%=request.getContextPath()%>/change.go">
<table align="center" border="1">
	<tr align="center">
		<td width="7%"><b>이메일</b></td>		
		<td width="7%"><b>닉네임</b></td>
		<td width="7%"><b>생년월일</b></td>
		<td width="7%"><b>성별</b></td>
		<td width="7%"><b>관리자여부</b></td>
	</tr>
	<c:if test="${memberpage==null}">
	<tr>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>	
	</tr>
	</c:if>
	<c:forEach items="${memberpage}" var="mem">
		<tr>
			<td>${mem.email}<input type="hidden" name="email" value="${mem.email}"></td>
			<td>${mem.name}</td>
			<td>${mem.birth}</td>
			<td>${mem.gender}</td>
			<td><input type="text" name="admin" value="${mem.admin}"><input type="submit" value="수정"></td>
		</tr>
	</c:forEach>
	<c:choose>
		<c:when test="${memberList != null}">	
			<tr align="center">
				<c:forEach var="Member" items="${memberList}">
					<td><c:out value="${Member.email}" /></td>
					<td><c:out value="${Member.name}" /></td>
					<td><c:out value="${Member.birth}" /></td>
					<td><c:out value="${Member.gender}" /></td>
					<td><c:out value="${Member.admin}" /></td>
				</c:forEach>
			</tr>
		</c:when>
	</c:choose>				
</table>
</form>
<div align="center">
<a href="login.go" >로그인 페이지로 돌아가기</a>
</div>
</body>
</html>