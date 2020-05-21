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
	<%--request.setAttribute("modiREQ", modiReq); --%>
	
	<form name="modifyFrm" id="modifyFrm" method="POST" 
	action="<%=request.getContextPath()%>/admin/notice/modify.go?no=${modiREQ.articleNumber}">
	<table class="table" style="text-align:center; border:1px solic #dddddd;margin:auto;">
	<thead>
		<tr>
			<th colspan="2" style="background-color:#eeeeee;
			text-align:center;width:1000px;padding-top: 5px;padding-bottom: 5px;">공지사항 게시판 글쓰기</th>
		</tr>
		<tr>
			<td colspan="2" style="text-align:left;width:1000px;padding-top:5px;padding-bottom:5px;">
			글번호 : ${modiREQ.articleNumber} </td>
		</tr>
	</thead>
	<tbody>
			<td>
			<input type="text" class="form-control" required="required" placeholder="글 제목" 
			name="title" maxlength="50" value="${modiREQ.title}"
			style="width:1000px;height:20px;margin-top:10px;">
			<c:if test="${errors.title}">제목을 입력하세요.</c:if>
			</td>
		<tr>
			<td>
			<textarea class="form-control" required="required" placeholder="글 내용"
			 name="content" maxlength="2048"
			 style="width:1000px;height:350px;margin-top:5px;">${modiREQ.content}</textarea>
			</td>
		</tr>
	</tbody>
	<tfoot>
		<tr>
		<td colspan="2"><input type="submit" value="글 수정" class="button"/>&nbsp;&nbsp;<input type="reset" class="button" value="취소"/></td>
		</tr>
	</tfoot>
</table>
	</form>
</body>
</html>













