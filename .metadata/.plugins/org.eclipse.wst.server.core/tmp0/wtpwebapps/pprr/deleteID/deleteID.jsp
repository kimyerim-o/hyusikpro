<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%> 
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
<style>
h2 {text-align: center;}
</style>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 탈퇴 처리</title>
</head>
<body>
<h2>회원 탈퇴 완료</h2>
</body>
</html>