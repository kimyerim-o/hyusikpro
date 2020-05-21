<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그아웃</title>
</head>
<body>
<form action="<%=request.getContextPath()%>/logout.go" method="post">
<div align="center">
<hr/>
<table>
	<tr>
	<th><h3>로그아웃 페이지입니다.</h3> </th>
	</tr>
	<tr><td><hr></td></tr>
	<tr>
		<td align="center">
			<input type="submit" onclick="alert('로그아웃 하셨습니다.')" value="로그아웃"/>		
		<td>
	</tr>	
	<tr><td><hr></td></tr>
</table>
</div>
</form>

</body>
</html>