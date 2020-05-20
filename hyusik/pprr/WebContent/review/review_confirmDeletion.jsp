<%@ page contentType="text/html; charset=utf-8" %>
<html>
<head>
    <title>후기 삭제 확인</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/header/header_style.css">    
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
 $("header").remove(".body");
 $("#page-wrapper").attr("id","");
</script>
</head>
<body>

<form action="<%=request.getContextPath()%>/review/review_deleteMessage.jsp" method="POST">
<input type="hidden" name="messageId" value="${param.messageId}">
후기를 삭제하시려면 암호를 입력하세요:<br>
암호: <input type="password" name="password"> <br>
<input type="submit" value="후기삭제">
</form>
</body>
</html>