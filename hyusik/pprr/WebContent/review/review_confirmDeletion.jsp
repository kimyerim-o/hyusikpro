<%-- <%@ page contentType="text/html; charset=utf-8" %> --%>
<html>
<head>
    <title>후기 삭제 확인</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/header/header_style.css">  
<style>
body {margin-left:800px;margin-top:300px;font-size:1.5rem}
</style>  
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
 $("header").remove(".body");
 $("#page-wrapper").attr("id","");
</script>
</head>
<body>

<form action="<%=request.getContextPath()%>/review/review_deleteMessage.jsp" method="POST">
<input type="hidden" name="messageId" value="${param.messageId}">
insert the password:<br><br>
password: <input type="password" name="password"><br><br>
<input type="submit" value="delete">
</form>
</body>
</html>