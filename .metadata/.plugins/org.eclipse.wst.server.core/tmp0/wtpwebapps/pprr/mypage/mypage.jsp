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
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>myPage</title>

</head>
<body>	
	<nav>
		<ul>
			<li> <a href="#">회원정보수정</a> </li>
			<li> <a href="#">리뷰게시판</a> </li>
			<li> <a href="#">QnA게시판</a> </li>
			<li> <a href="#">회원탈퇴</a> </li>
		</ul>
	</nav>
<section>
	<h2>마이페이지</h2>
		<article>
			이메일 : ${member.email}
			닉네임 : ${member.name}
			생년월일 : ${member.birth}
			성별 : ${member.gender}
		</article>
</section>	
</body>
</html>