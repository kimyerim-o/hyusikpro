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
	margin:auto;
	text-align:center;
}

.table td, .table th {
	border: 1px solid black;
	padding: 20px;
	white-space: nowrap;
	width:20px;
}

.table td:first-child, .table th:first-child {
	width:100px;
}
</style>
</head>
<body>
<table class="table" align="center" width="1230px">
	<thead>
		<tr>
			<th colspan="6" class="title">
		  	    도로상황
	    	</th>
	    </tr>
	    <tr><td></td></tr>
		<tr class="tt">
			<td>구분</td>
			<td>도로</td>
			<td>내용</td>
			<td>차량차단</td>
			<td>방향</td>
			<td>시작일</td>
		</tr>
	</thead>
	<tbody>
	</tbody>
	<c:forEach var="road" items="${roadDto}" >
	<tr>
		<td>${road.sitname}</td>
		<c:if test="${road.type=='ex'}">
			<td>고속도로</td>
		</c:if>
		<c:if test="${road.type=='its'}">
			<td>국도</td>
		</c:if>
		<c:if test="${road.type=='police'}">
			<td>경찰청</td>
		</c:if>
		<td>${road.msg}</td>
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
		<td>${road.direction}</td>
		<td>${road.startday}</td>
	</tr>
	</c:forEach>
</table>
</body>
</html>