<%-- <%@ page contentType="text/html; charset=utf-8" %> --%>
<%@ page import="review.service.DeleteReviewService" %>
<%@ page import="review.service.InvalidPasswordException" %>
<%
	int messageId = Integer.parseInt(request.getParameter("messageId"));
	String password = request.getParameter("password");
	boolean invalidPassowrd = false;
	try {
		DeleteReviewService deleteService = DeleteReviewService.getInstance();
		deleteService.delete(messageId, password);
	} catch(InvalidPasswordException ex) {
		invalidPassowrd = true;
	}
%>
<html>
<head>
	<title>후기 삭제함</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/header/header_style.css">
<style>
body {margin-left:800px;margin-top:300px;font-size:1.5rem}
</style> 
</head>
<body>
<%  if (!invalidPassowrd) { %>
Review Delete Complete.
<%  } else { %>
Check your password.
<%  }%>
<br/>
<a href="<%=request.getContextPath()%>/admin/review/review_list.jsp">[listview]</a>
</body>
</html>