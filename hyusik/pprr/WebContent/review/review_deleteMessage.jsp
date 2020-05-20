<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="review.service.DeleteReviewService" %>
<%@ page import="review.service.InvalidPasswordException" %>
<%
	int messageId = Integer.parseInt(request.getParameter("messageId"));
	String password = request.getParameter("password");
	boolean invalidPassowrd = false;
	try {
		DeleteReviewService deleteService = 
				DeleteReviewService.getInstance();
		deleteService.delete(messageId, password);
	} catch(InvalidPasswordException ex) {
		invalidPassowrd = true;
	}
%>
<html>
<head>
	<title>후기 삭제함</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/header/header_style.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
 $("header").remove(".body");
 $("#page-wrapper").attr("id","");
</script>
</head>
<body>
<%  if (!invalidPassowrd) { %>
후기를 삭제하였습니다.
<%  } else { %>
입력한 암호가 올바르지 않습니다. 암호를 확인해주세요.
<%  }%>
<br/>
<a href="<%=request.getContextPath()%>/review/list.go">[목록 보기]</a>
</body>
</html>