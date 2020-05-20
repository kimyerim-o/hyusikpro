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
	<%--articleNumber;	//게시글번호
	private String userId;	//사용자id
	private String title;//제목
	private String content;//내용
		request.setAttribute("modiREQ", modiReq);
	 --%>
	<div id="success">
	수정을 완료했습니다.
	 <div id="ctxPath">${ctxPath= pageContext.request.contextPath}&nbsp;&nbsp;</div>
	<a href="${ctxPath}/admin/notice/list.go">[글 목록보기]</a>&nbsp;&nbsp;
	 <a href="${ctxPath}/admin/notice/read.go?no=${modiREQ.articleNumber}">[게시글상세 보기]</a>
	 </div>
</body>
</html>









