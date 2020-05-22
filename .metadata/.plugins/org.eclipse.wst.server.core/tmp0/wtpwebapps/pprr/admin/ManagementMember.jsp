<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/admin/admin_style.css">

<link rel="stylesheet" href="<%=request.getContextPath()%>/header/header_style.css">
<% 	request.setCharacterEncoding("UTF-8");%> 
<!DOCTYPE html>


<html lang="en">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
 $("header").remove(".body");
 $("#page-wrapper").attr("id","");
</script>
</head>
<body>
<jsp:include page="admin.jsp"/>

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
	})
</script>

<c:choose>
	<c:when test='${msg=="addmember"}'>
		<script>
			window.onload = function() {
				alert("회원 정보가 등록되었습니다.");
			}
		</script>
	</c:when>
	<c:when test='${msg=="modified"}'>
		<script>
			window.onload = function() {
				alert("회원 정보가 수정되었습니다.");
			}
		</script>
	</c:when>
	<c:when test='${msg=="deleted"}'>
		<script>
			window.onload = function() {
				alert("회원 정보가 삭제되었습니다.");
			}
		</script>
	</c:when>
</c:choose>	

<head>
    <meta charset="UTF-8">
    <title>ManagementBoard</title>
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
			<td>${mem.email}</td>
			<td>${mem.name}</td>
			<td>${mem.birth}</td>
			<td>${mem.gender}</td>
			<td>${mem.admin}</td>
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
<div align="center">
<a href="login.go" >로그인 페이지로 돌아가기</a>
</div>
</body>
</html>