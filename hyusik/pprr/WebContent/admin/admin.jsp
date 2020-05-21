<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/admin/admin_style.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/header/header_style.css">
</head>
<body>
<!-- 안되면 색을빼서 어딘지 모르게 하자!!!!!!!!!!!!!!! -->
<div class="cont">
	<ul class="tab">
 		<li class="tab1"><a href="<%=request.getContextPath()%>/member.go">회원 관리</a></li>
		<li class="tab2"><a href="<%=request.getContextPath()%>/admin_info.go">휴게소 정보 관리</a></li>
		<li class="tab3"><a href="<%=request.getContextPath()%>/admin/notice/list.go">공지사항 관리</a></li>
		<li class="tab5"><a href="<%=request.getContextPath()%>/admin/review/review_list.jsp">리뷰 관리</a></li>
	</ul>
</div>
</body>
</html>