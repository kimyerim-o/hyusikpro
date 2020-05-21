<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>    
   
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>login.jsp</title>
    <script>

 
    </script>
    <style>
        #headtext{color: blue;}
        #idtable {margin-top:5%}
        #headtext{margin-top:10%; font-size:50px}
        
    </style>
</head>
<body>
    <div id="headtext" align="center" ondrop="10%" >휴~식 로그인</div>
    
    <hr/>
    <form method="post">
    
    <c:if test="${errors.idOrPwNotMatch}">
     <div align="center">이메일과 비밀번호가 일치하지 않습니다.</div></c:if>
     <table  align="center" id="idtable" >
        <tr height="50px">
            <td>이메일 : </td>
            <td>
               <input type="text" id="email" name="email" value="${param.email}"height="100px" style="width:300px; height:30px"/>
            <div align="center">
            <c:if  test="${error.email}">이메일을(를) 입력해주세요.</c:if>
            </div>
            </td>
        </tr>
        <tr>
            <td>
                패스워드:
            </td>
            <td>
               <input type="password" id="pw" name="password"style="width:300px; height:30px"/>
            	<div align="center">
            	<c:if test="${errors.password}">암호를 입력하세요</c:if>
            	</div>
            </td>
            
        </tr>
    </table>
    <div align="center">
                 <input type="submit" value="이메일 로그인" formaction="<%=request.getContextPath()%>/login.go"> 
                 <input type="submit" id="joinmember"value="회원가입" formaction=""/><!-- 회원가입으로 이동 -->
                 <input type="reset" value="취소"> 
	</div>
	</form>
</body>
</html>