<%-- <%@ page contentType="text/html; charset=utf-8" %> --%>
<html>
<head>
    <title>후기 삭제 확인</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/header/header_style.css">  
<style>
#password1 {margin-left:750px;margin-top:200px;font-size:1.5rem}
</style>
</head>
<body>

<form action="<%=request.getContextPath()%>/review/review_deleteMessage.jsp" method="POST" id="password1">
<input type="hidden" name="messageId" value="${param.messageId}">
insert the password:<br><br>
password: <input type="password" name="password"><br><br>
<input type="submit" value="delete">
</form>
</body>
</html>