<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>ManagementBoard</title>
    <script>

            
    </script>
</head>
<body>
    회원 조회 페이지입니다.<br/>
   회원을 조회해주세요..<br/>
   <form action="">
    <table>
        <tr>
            <td>회원 이메일: <input type="text" id="memberchk" onkeypress="keychk" ></td>
            <td>회원 닉네임: <input type="text" id="memberchk" onkeypress="keychk" ></td>
           <td>회원 생년월일: <input type="text" id="memberchk" onkeypress="keychk" ></td>
            <td>회원 성별: <input type="text" 	id="memberchk" onkeypress="keychk" ></td>
			<td>관리자 여부: <input type="text" 	id="memberchk" onkeypress="keychk" ></td>
        </tr>
        <tr>
        </tr>
        <tr>
            <td><input type="submit" value="조회하기"></td>
            <td><input type="reset" value="다시작성"></td>
        </tr>
      </form>  
    </table>

</body>
</html>