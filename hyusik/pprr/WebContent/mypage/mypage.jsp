<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ page import="java.sql.*" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/header/header_style.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/dcss/mypage.css">		
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>myPage</title>

</head>
<body>	
<div align="center">
	<form>
	<table>	
	<tr>
		<th>
		<h1> 마이페이지 </h1>
		</th>
	</tr>
	</table>
	<table width="300" height="300" margin="auto">
				<tr>
					<td >
						<a href="/admin/modmember.jsp">
						<img width="200" height="200" align="top" src="https://i.dlpng.com/static/png/6734405_preview.png">
						<h3 align="center">회원정보 수정</h3></a>
					</td>
					<td><a href="/deleteID/delForm.jsp">
						<img width="200" height="200" align="top" src="https://cdn1.iconfinder.com/data/icons/hand-gestures-line-art/128/hand-wave-ol-512.png">
						<h3 align="center">회원 탈퇴</h3></a>
					</td>
				</tr>	
	</table>
	</form>
</div>	
</body>
</html>