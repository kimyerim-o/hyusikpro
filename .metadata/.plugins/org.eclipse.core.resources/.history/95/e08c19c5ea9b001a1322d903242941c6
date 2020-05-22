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
<div>
	<form>
	<table border="1">
			<ul>
				<li> <a href="/review/review_list.jsp">리뷰게시판</a> </li><br/>
				<li> <a href="/deleteID/delform.jsp">회원탈퇴</a> </li>
			</ul>
	</table>
	</form>
</div>
<div id="headtext" align="center">마이페이지
	<form>
			 sessionScope.authUser=(${sessionScope.AUTHUSER})
			 (${AUTHUSER.email })
	<table border="1" width="400" height="400" margin="auto">
				<tr>
					<td ><a href="/admin/modmember.jsp">회원정보 수정</a></td>
					<td><a href="/deleteID/delForm.jsp">회원 삭제</a></td>
					<td><a href="/review/review_list.jsp">리뷰 게시판</a></td>
				</tr>	
	</table>
	</form>
</div>	
</body>
</html>