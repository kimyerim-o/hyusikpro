<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<link rel="stylesheet" href="<%=request.getContextPath()%>/header/header_style.css">
    <meta charset="UTF-8">
    <title>기본정보</title>
<style>
</style>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
$(function(){
    $('#userid').focus()
    $('#frm1').submit(function(){
        if (!$('#userid1').val()) {
            alert('이메일을 입력하세요')
            $('#userid1').focus()
            return false;
        }
        if (!$('#pass').val()) {
            alert('pass를 입력하세요')
            $('#pass').focus()
            return false;
        }
        if ($('#pass').val().length<5 || $('#pass').val().length>12){
            alert('비밀번호는 5~12자리입니다.')
            $('#pass').focus()
            return false;
        }
        if ($('#pass').val()!=$('#passcon').val()) {
            alert('비밀번호 확인을 정확히 입력하세요')
            $('#passcon').val('')
            $('#passcon').focus()
            return false;
        }
        if (!$('#name').val()) {
            alert('이름을 입력하세요')
            $('#name').focus()
            return false;
        }
    })
})

</script>
</head>
<body>
	<div align="center"><b><h2>회원가입</h2></b></div>
	<hr/>
<div align="center">
<form id="frm1" name="frm1" action="<%=request.getContextPath()%>/join.go" method="post" >
    <table width="80%" >
    
    <tr class="t1">
    
        <td colspan="2" align="center"><h3>기본 정보</h3></td>
    </tr>
    
    <tr>
        <td>■ 회원 ID (Email)</td>
        <td><input type="text" name="userid1" id="userid1" size="20"> @
        <select name="userid2">
            <option>직접입력</option>
            <option value="naver.com">naver.com</option>
            <option value="hanmail.net">hanmail.net</option>
            <option value="daum.net">daum.net</option>
            <option value="gmail.com">gmail.com</option>
            </select>
        <br>
        <c:if test="${errors.duplicateId}">이미 사용중인 아이디입니다.</c:if>
        </td>
    </tr>
    <tr>
        <td>■ 비밀번호</td>
        <td><input type="password" name="pass" id="pass" onchange="isSanme()" size="26"></td>
    </tr>
    <tr>
        <td>■ 비밀번호확인</td>
        <td><input type="password" name="passcon" id="passcon" onchange="isSame()" size="26" >&nbsp;&nbsp;<span id="same"></span></td>
    	<c:if test="${errors.notMatch}">암호와 확인이 일치하지 않습니다.</c:if>
    </tr>
    <tr>
        <td>■ 닉네임</td>
        <td><input type="text" name="name" id="name" size="25"></td>
	</tr>
        <tr> 
        	<td colspan="3">
        		<hr/>
        	</td>
        <tr>
    
    <tr>
    
    <td align="center" colspan="2"><h3>부가 정보</h3></td>
    </tr>
    <tr>
    <td>성별</td>
    <td><input type="radio" name="gender" id="M" checked/>
        <label for="M">남</label>
        <input type="radio" name="gender" id="F"/>
        <label for="F">여</label>
    </td>
    </tr>
    <tr>
        <td id="title">생일</td>
         <td>

        <input type="text" name="birth_yy" maxlength="4" placeholder="년(4자)" size="5" >
        <select name="birth_mm">
                            <option selected="selected">월</option>
                            <option value="01" >1</option>
                            <option value="02" >2</option>
                            <option value="03" >3</option>
                            <option value="04" >4</option>
                            <option value="05" >5</option>
                            <option value="06" >6</option>
                            <option value="07" >7</option>
                            <option value="08" >8</option>
                            <option value="09" >9</option>
                            <option value="10" >10</option>
                            <option value="11" >11</option>
                            <option value="12" >12</option>
        </select>
             <input type="text" name="birth_dd" maxlength="2" placeholder="일" size="5" >
         </td>
         </tr>


        <tr>
        <td colspan="3" align="center">
        <input type="submit" value="회원가입">
        <input type="reset" value="취소">
        </td>
		<tr>

   
    </table>
</form>
</div>
</body>
</html>
</center>