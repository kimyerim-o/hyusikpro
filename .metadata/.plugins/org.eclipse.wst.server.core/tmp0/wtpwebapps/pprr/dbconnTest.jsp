<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
		import="jdbc.connection.ConnectionProvider, java.sql.*"    
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		try{
			Connection conn = ConnectionProvider.getConnection();
	  	out.println("Connection 연결 성공!!!!!!");
		}catch(SQLException e){
			out.println("Connection 연결 실패 TT="+e);
		}
	%>
</body>
</html>


















