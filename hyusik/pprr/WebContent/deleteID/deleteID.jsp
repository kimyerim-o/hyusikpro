<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ page import="java.sql.*" %>
<%@ page import="member.memberDAO" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/header/header_style.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/info/infos_style.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/dcss/mypage.css">		
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
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 탈퇴 처리</title>
</head>
<body>
<h2>회원 탈퇴 완료</h2>
<%
	String email = (String)session.getAttribute("mememail");
	String password = request.getParameter("password");
	memberDAO memberDao = memberDAO.getInstance();
	boolean check = memberDao.delete(email, password);
	
	if (check == true) {
		session.invalidate();
%>

<form action="<%=request.getContextPath()%>/main.go" name="userinput" method="post">
	<table width="270" border="1" cellspacing="0" cellpadding="5" align="center">
		<tr>
			<td height="39" align="center">
				<font size="+1"><b>회원정보가 정상적으로 삭제되었습니다.</b></font>	
			</td>
		</tr>
		<tr>
			<td align="center">
				<p>그동안 저희와 함께해주셔서 감사했습니다.</p>
				<meta http-equiv="Refresh" onclick="./main/main.go">
			</td>		
		</tr>
		<tr>
			<td align="center">
				<input type="submit" value="확인완료">
			</td>		
		</tr>		
	</table>
</form>
<%	} else { %>	
	<script>
		alert("비밀번호가 맞지 않습니다.");
		history go(-1);
	</script>
<% } %>


</body>
</html>