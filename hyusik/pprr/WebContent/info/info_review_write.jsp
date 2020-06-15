<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page errorPage="errorView.jsp" %>
<%@ page import="review.dto.ReviewDto" %>
<%@ page import="review.service.WriteMessageService" %>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="message" class="review.dto.ReviewDto">
	<jsp:setProperty name="message" property="*" />
</jsp:useBean>
<%
	WriteMessageService writeService = WriteMessageService.getInstance();
	String rest=request.getParameter("restname");
	writeService.write(message,rest);
%>
<html>
<head>
	<title>댓글 남김</title>
<style>
#valid {margin-left:800px;margin-top:300px;font-size:1.5rem;text-align:center}
#review{height:200px;padding-left:200px;font-size:22px}
#comment{width:60%;height:30px}
#submit{/*float:right;*/}
.fas fa-bed {font: FontAwesome !important;}
</style>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
<link rel="stylesheet" href="<%=request.getContextPath()%>/header/header_style.css">
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Nanum+Gothic:wght@700&display=swap" rel="stylesheet">
</head>
<body>
<span id="valid">
댓글을 남겼습니다.
<br/>
<a href="<%=request.getContextPath()%>/review/review_list.jsp" id="valid">[목록 보기]</a>
</span>
</body>
</html>