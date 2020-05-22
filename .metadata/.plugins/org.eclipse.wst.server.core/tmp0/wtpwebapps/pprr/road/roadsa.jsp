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
	white-space: nowrap;
	width:20px;
}

.table td:first-child, .table th:first-child {
	width:100px;
}
thead {
	background-color:rgb(159,197,232);
	height:15px;
	font-weight:bold;
}
.error{
	position:fixed;
	top: 500px;
    left: 650px;
    color:rgb(159,197,232);
    font-size: 30px;
}
</style>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-compat/3.0.0-alpha1/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/road/sagoinfo.js"></script>
</head>
<body>
<div class="error">
</div>
<table class="table" align="center" width="1230px">
	<thead>
		<tr>
			<th colspan="4" class="title">
		  	    도로 사고 상황
	    	</th>
	    </tr>
		<tr class="tt">
			<td>구분</td>
			<td>도로</td>
			<td>내용</td>
			<td>차량차단</td>
		</tr>
	</thead>
	<tbody>
	</tbody>
</table>
</body>
</html>