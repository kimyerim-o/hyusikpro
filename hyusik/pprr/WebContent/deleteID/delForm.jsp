<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ page import="java.sql.*" %>
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
<title>회원탈퇴</title>
</head>
<body>
<section>
	<form action="<%=request.getContextPath()%>/deleteID/deleteID.go" method="post" onSubmit="return checkIt()">
	<table cellSpacing="1" cellPadding="1" width="260" border="1" align="center">
		<tr height="30">
			<td colspan="2" align="middle">
				<font size="+1">
					<b>회원 탈퇴</b>
				</font>
			</td>	
		</tr>
		<tr height="30">
			<td width="110" align="center">비밀번호</td>
			<td width="150" align="center">
				<input type="password" name="password" size="15" maxlength="12">
			</td>	
		</tr>
		<tr height="30">
			<td width="150" align="center">
				<input type="button" value="취소하기" onclick="<%=request.getContextPath()%>/main.go">
			</td>
		</tr>		
	</table>
	</form>
</section>
</body>
</html>