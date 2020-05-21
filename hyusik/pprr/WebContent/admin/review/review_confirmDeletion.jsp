<%-- <%@ page contentType="text/html; charset=utf-8" %> --%>
<html>
<head>
    <title>후기 삭제 확인</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/header/header_style.css">    
<style>
body {margin-left:800px;margin-top:300px;font-size:1.5rem}
</style>
</head>
<body>

<form action="<%=request.getContextPath()%>/admin/review/review_deleteMessage.jsp" method="POST">
<input type="hidden" name="messageId" value="${param.messageId}">
insert the password:<br><br>
password: <input type="password" name="password"><br><br>
<input type="submit" value="delete">
</form>
</body>
</html>