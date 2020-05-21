<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="review.dto.ReviewDto"%>
<%@ page import="review.service.ReviewListView"%>
<%@ page import="review.service.GetMessageListService"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	String pageNumberStr = request.getParameter("page");
	int pageNumber = 1;
	if (pageNumberStr != null) {
		pageNumber = Integer.parseInt(pageNumberStr);
	}
 
	GetMessageListService messageListService =
			GetMessageListService.getInstance();
	ReviewListView viewData = 
			messageListService.getMessageList(pageNumber);
	
	request.setCharacterEncoding("utf-8");

%>
<html>
<head>
<meta charset="UTF-8">
	<title>댓글 목록</title>
<style>
footer {
    margin-left: 300px;
    margin-top: 100px;
}
#review{height:200px;padding-left:200px;font-size:22px}
#comment{width:60%;height:30px}
#submit{/*float:right;*/}
.fas fa-bed {font: FontAwesome !important;}
</style>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
<link rel="stylesheet" href="<%=request.getContextPath()%>/header/header_style.css">
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Nanum+Gothic:wght@700&display=swap" rel="stylesheet">
</head>
<body>
<footer>
<c:set var="viewData" value="<%=viewData%>"/>
<form action="review_write.jsp" method="POST">
 <label for="name">닉네임</label>  
 <input type="text" name="name"><br/><br/>
 <label for="repw">암호</label>
 <input type="password" name="repw"><br/><br/>
    <label for="restname">휴게소 이름</label>
     <select name="restname" id="restname" style="width:50%;height:30px;">
		<option selected>선택하세요</option>
       	<option value="서울만남(부산)휴게소,1">1.서울 만남의 광장 부산방향
       	</option>
          <option value="죽전(서울)휴게소,2">2.죽전휴게소 서울방향
          </option>
          <option value="기흥(부산)휴게소,3">3.기흥휴게소 부산방향
          </option>
          <option value="안성(부산)휴게소,4">4.안성휴게소 서울방향
          </option>
          <option value="입장거봉포도(서울)휴게소,5">5.입장거봉포도휴게소 서울방향
          </option>
          <option value="망향(부산)휴게소,6">6.망향휴게소 부산방향
          </option>
          <option value="천안삼거리(서울)휴게소,7">7.천안삼거리휴게소 서울방향
          </option>
          <option value="천안호두(부산)휴게소,8">8.천안호두휴게소 부산방향
          </option>
          <option value="청주(서울)휴게소,9">9.청주휴게소 서울방향
          </option>
          <option value="옥산(부산)휴게소,10">10.옥산휴게소 부산방향
          </option>
          <option value="죽암(서울)휴게소,11">11.죽암휴게소 서울방향
          </option>
          <option value="죽암(부산)휴게소,12">12.죽암휴게소 부산방향
          </option>
          <option value="신탄진(서울)휴게소,13">13.신탄진휴게소 서울방향
          </option>
    </select><br/><br/>
 <label for="restis">휴게소 만족도</label>
    <input type="radio" name="restis" value="1" id="1"> <i class="far fa-angry"> 1</i>
    <input type="radio" name="restis" value="2" id="2"> <i class="far fa-frown"> 2</i>
    <input type="radio" name="restis" value="3" id="3"> <i class="far fa-meh"> 3</i>
    <input type="radio" name="restis" value="4" id="4"> <i class="far fa-smile"> 4</i>
    <input type="radio" name="restis" value="5" id="5"> <i class="far fa-laugh"> 5</i><br/><br/>
<label for="recontent">댓글</label>
<textarea id="recontent" name="recontent" cols="30" rows="3"></textarea><br/><br/>
<input type="submit" value="등록" id="submit"/>
</form><br/><br/><br/>
<hr>
<c:if test="${viewData.isEmpty()}">
등록된 메시지가 없습니다.
</c:if>
<c:if test="${!viewData.isEmpty()}">
<table border="1" width="450">
	<c:forEach var="message" items="${viewData.messageList}">
	<tr>
		<td>
		메시지 번호: ${message.reno} <br/>
		휴게소 번호: ${message.restno}<br/>
		휴게소 이름: ${message.restname}<br/>
		닉네임: ${message.name} <br/>
		작성일: ${message.stdate} <br/>
		만족도: <c:forEach var="i" begin="1" end="${message.restis}">
		<c:forEach var="j" items="★">
	            	★
	        </c:forEach>
        </c:forEach>
		<c:forEach var="i" begin="1" end="${5-message.restis}">
		<c:forEach var="j" items="☆">
	            	☆
	        </c:forEach>
        </c:forEach>
		(${message.restis}점 / 5.0점)<br/>
		후기: ${message.recontent} <br/>
		<a href="<%=request.getContextPath()%>/review/review_confirmDeletion.jsp?messageId=${message.reno}">[삭제하기]</a>
		</td>
	</tr>
	</c:forEach>
</table>
<c:forEach var="pageNum" begin="1" end="${viewData.pageTotalCount}">
<a href="<%=request.getContextPath()%>/review/review_list.jsp?page=${pageNum}">[${pageNum}]</a> 
</c:forEach>
</c:if>
</footer>
</body>
</html>