<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>  

<link rel="stylesheet" href="<%=request.getContextPath()%>/info/infos_style.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/dcss/mypage.css">		
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d033ab2c0002c3aedd619825d12b4956"></script>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/header/header_style.css">
    <meta charset="UTF-8">
    <title>login.jsp</title>
    <script>

 
    </script>
    <style>
        #headtext{color: #296ead;}
        #headtext{margin-top:10%; font-size:25px}
        
    </style>
</head>
<html>
<head>
<% request.setCharacterEncoding("utf-8"); %>

<title>회원탈퇴</title>
</head>
<body>
<%
	//세션값 가져오기
	String id = (String)session.getAttribute("id");
	//세션값 없으면 loginForm.jsp 이동
	if(id != null) {
	 	response.sendRedirect("./login/login.jsp");
	}
%>
<div id="headtext" align="center" >회원 정보 삭제</div>
    
    <hr/>
    <form action="<%=request.getContextPath()%>/deleteID.go" method="post">
	    <table align="center" id="deleteTable">
			<tr align="center">
				<td>아이디: <br></td>
				<td><input type="text" id="email" name="email" value="${param.email}"><br></td>
			</tr>
			<tr align="center">
				<td>패스워드: <br></td>
				<td><input type="password" id="pw" name="password"><br></td>
			</tr>	
			<tr>
				<td><input type="submit" value="회원삭제" onclick="alert('정상적으로 계정 삭제가 이루어졌습니다.')"><br></td>
				<td><input type="reset" value="취소" onclick="<%=request.getContextPath()%>/main.go"></td>
			</tr>
		</table>
	</form>
</body>
</html>