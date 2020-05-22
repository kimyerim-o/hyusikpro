<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.infolist{margin-left:250px;margin-top:50px;}
li{text-decoration: none;}
ul.tab li.tab2 a{background-color:rgb(177,196,214);}
</style>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
 $("header").remove(".body");
 $("#page-wrapper").attr("id","");
</script>
</head>
<body>
<jsp:include page="admin.jsp"/>
<div>
	<ul class="infolist">
	<!-- 수정하기 삽입하기 삭제하기 -->
		<li><a href="<%=request.getContextPath()%>/admin/info_insert.jsp">추가하기</a></li>
		<c:forEach var="restinfos" items="${restnames.restinfos}" >
		<li><a href="info_up.go?site=${restinfos.restno}">${restinfos.restname}</a></li>
		</c:forEach>
	</ul>
</div>
</body>
</html>