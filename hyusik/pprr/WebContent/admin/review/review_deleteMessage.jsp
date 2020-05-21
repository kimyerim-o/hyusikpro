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
#valid {margin-left:800px;font-size:1.5rem;text-align:center;}
</style> 
</head>
<body>
<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
<span id="valid">
<%  if (!invalidPassowrd) { %>
Review Delete Complete.
<%  } else { %>
Check your password.
<%  }%>
<br/><br/><br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="<%=request.getContextPath()%>/admin/review/review_list.jsp" id="valid">[listview]</a>
</span>
</body>
</html>