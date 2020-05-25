<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.table {
	border-collapse: collapse;
	margin-top: 50px;
	text-align:center;
}

.table td, .table th {
	border: 1px solid white;
	padding: 20px;
}

.table td:first-child, .table th:first-child {
	width:100px;
}
thead {
	background-color:rgb(159,197,232);
	height:15px;
	font-weight:bold;
	}
</style>
</head>
<body>
<table class="table" align="center" width="1230px">
	<thead>
		<tr>
			<th colspan="7" class="title">
		  	    도로 공사 상황
	    	</th>
	    </tr>
		<tr class="tt">
			<td>구분</td>
			<td>도로</td>
			<td>내용</td>
			<td width="20px" colspan="2">차량차단</td>
			<td>방향</td>
			<td>시작일</td>
		</tr>
	</thead>
	<tbody>
	</tbody>
	<c:forEach var="road" items="${roadDto}" >
<form method="post">
	<tr>
		<input type="hidden" name="rono" value="${road.rono}">
		<td><input type="text" name="sitname" value="${road.sitname}"></td>
		<input type="hidden" name="type" value="${road.type}">
		<c:if test="${road.type=='ex'}">
			<td>고속도로</td>
		</c:if>
		<c:if test="${road.type=='its'}">
			<td>국도</td>
		</c:if>
		<c:if test="${road.type=='police'}">
			<td>경찰청</td>
		</c:if>
		<td><input type="text" name="msg" value="${road.msg}"></td>
		<input type="hidden" name="blocktype" value="${road.blocktype}">
		<c:if test="${road.blocktype=='0'}">
			<td>통제없음</td>
		</c:if>
		<c:if test="${road.blocktype=='1'}">
			<td>갓길통제</td>
		</c:if>
		<c:if test="${road.blocktype=='2'}">
			<td>차로부분통제</td>
		</c:if>
		<c:if test="${road.blocktype=='3'}">
			<td>전면통제</td>
		</c:if>
		<td><input type="text" name="direction" value="${road.direction}"></td>
		<td><input type="text" name="startday" value="${road.startday}"></td>
		<td><input type="submit" value="수정" formaction="<%=request.getContextPath()%>/modroad.go">
		<input type="submit" value="삭제" formaction="<%=request.getContextPath()%>/delroad.go"></td>
	</tr>
</form>
	</c:forEach>
</table>
</body>
</html>