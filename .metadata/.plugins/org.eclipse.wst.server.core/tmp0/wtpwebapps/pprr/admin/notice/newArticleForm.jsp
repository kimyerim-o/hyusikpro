<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/header/header_style.css">
<style>
.button {
  color: white;
  text-align: center;
  background: #2f3c4a;
  border-radius: 10px;
  border:0px;
  margin-top:15px}
</style>
</head>
<body>
<br/><br/><br/>
<form name="articleFrm" id="articleFrm" method="post" 
action="<%=request.getContextPath()%>/admin/notice/write.go">
<table class="table" style="text-align:center; border:1px solic #dddddd;margin:auto;">
	<thead>
		<tr>
			<th colspan="2" style="background-color:#eeeeee;
			text-align:center;width:1000px;height:30px;padding-top:5px;padding-bottom:5px;">공지사항 게시판 글쓰기</th>
		</tr>
	</thead>
	<tbody>
			<td>
			<input type="text" class="form-control" required="required" placeholder="글 제목" 
			name="title" maxlength="50" value="${param.title}"
			style="width:1000px;height:25px;margin-top:10px;">
			<c:if test="${errors.title}">제목을 입력하세요.</c:if>
			</td>
		<tr>
			<td colspan="2">
			<textarea class="form-control" required="required" placeholder="글 내용"
			 name="content" maxlength="2048" value="${param.content}"
			 style="width:1000px;height:350px;margin-top:5px;"></textarea>
			</td>
		</tr>
	</tbody>
	<tfoot>
		<tr>
		<td colspan="2"><input type="submit" value="글 등록" class="button"/>&nbsp;&nbsp;&nbsp;<input type="reset" class="button" value="취소"/></td>
		</tr>
	</tfoot>
</table>
</form>
</body>
</html>













