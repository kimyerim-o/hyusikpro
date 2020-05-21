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
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="membermanager" class="member.MemberManager"/>
<script type="text/javascript" src="../js/script.js"></script>

<title>회원탈퇴</title>
</head>
<body>
<%
	String id = (String)request.getParameter("id");
	String password = (String)request.getParameter("password");
	boolean deleteConfirm = membermanager.deleteConfirm(id, password);
	if(deleteConfirm) {
%>
		<script type="text/javascript">
			var confirmResult = confirm("정말 삭제하시겠습니까?");
			if(confirmResult == true){
				var deleteID = "<%=id%>";
				post_to_url("<%=request.getContextPath()%>/deleteID/deleteID.go", {'id':deleteID});
			} else {
				history.back();
			}	
		</script>
<%
	} else {
%>
		<script>
			alert("비밀번호가 틀립니다!");
			history.back();
		</script>	
<%
	}
%>
</body>
</html>