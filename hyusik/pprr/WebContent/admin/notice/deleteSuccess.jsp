<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#success {text-align: center;margin-top:100px}
#ctxPath {color:white}
</style>
<link rel="stylesheet" href="<%=request.getContextPath()%>/header/header_style.css">
</head>
<body>
	<div id="success">
	삭제를 완료했습니다.
	 <div id="ctxPath">${ctxPath= pageContext.request.contextPath}&nbsp;&nbsp;</div>
	<a href="${ctxPath}/admin/notice/list.go">[글 목록보기]</a>&nbsp;&nbsp;
	 </div>
</body>
</html>









