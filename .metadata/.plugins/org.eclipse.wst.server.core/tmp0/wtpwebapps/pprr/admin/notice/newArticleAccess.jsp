<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#access {text-align: center;margin-top:200px}
#ctxPath {color:white}
</style>
<link rel="stylesheet" href="<%=request.getContextPath()%>/header/header_style.css">
</head>
<body>
	<%
	//WriteArticleHandler에서
	//db에 insert성공시의  해당글번호가 newArticleNo에 넣어주고
	//아래코드에서 모델로 넘겨주었다
	//request.setAttribute("NEWARTICLENO", newArticleNo);
	%>
	<div id="access">
	공지사항을 등록했습니다.
	<div id="ctxPath">${ctxPath = pageContext.request.contextPath}&nbsp;&nbsp;</div>
	<a href="${ctxPath}/admin/notice/list.go">[글 목록보기]</a>&nbsp;&nbsp;
	<a href="${ctxPath}/admin/notice/read.go?no=${newArticleNo}">[입력된)글 상세내용 조회]</a></div>
	
</body>
</html>






