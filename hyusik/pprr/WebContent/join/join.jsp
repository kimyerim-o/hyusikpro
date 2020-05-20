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
        if (!$('#userid').val()) {
            alert('id를 입력하세요')
            $('#userid').focus()
            return false;
        }
        if ($('#userid').val().length<5 || $('#userid').val().length>12){
            alert('id는 5~12자리입니다.')
            $('#userid').focus()
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
        if ($('#pass').val()!=$('#pass2').val()) {
            alert('비밀번호 확인을 정확히 입력하세요')
            $('#pass2').val('')
            $('#pass2').focus()
            return false;
        }
        if (!$('#username').val()) {
            alert('이름을 입력하세요')
            $('#username').focus()
            return false;
        }
        msg='id: '+$('#userid').val()+'\n비밀번호:'
        +$('#pass').val()+'\n사용자이름:'+$('#username').val()
        +'\n주민등록번호 :'+$('#idno1').val()+'-'+$('#idno2').val()
        +'\n이메일:'+$('#email').val()
        hobbys=$('input[name="hobby"]:checked')
        //alert(hobbys.length)
        hobby=''
        hobbys.each(function(){
            hobby=hobby+$(this).val()+' '
        })
        msg=msg+'\n취미:'+hobby+
        '\n주소:'+$('#addr').val()+
        '\n직업:'+$('select > option:selected').val()
        alert(msg)
        return false;
    })
})

</script>
</head>
<body>
	<div align="center"><b><h2>회원가입</h2></b></div>
	<hr/>
<div align="center">
<form id="frm1" name="frm1" action="join.go" method="post" >
    <table width="80%" >
    
    <tr class="t1">
    
        <td colspan="2" align="center"><h3>기본 정보</h3></td>
    </tr>
    
    <tr>
        <td>■ 회원 ID (Email)</td>
        <td><input type="text" name="userid" id="userid" size="20"> @
        <select name="userid">
            <option>직접입력</option>
            <option>naver.com</option>
            <option>hanmail.net</option>
            <option>daum.net</option>
            <option>nate.com</option>
            <option>hotmail.com</option>
            <option>gmail.com</option>
            <option>icloud.com</option>
            </select>
            <input type="button" value="중복확인">
        <br>
        </td>
    </tr>
    <tr>
        <td>■ 비밀번호</td>
        <td><input type="password" name="wUserPW" id="pw" onchange="isSanme()" size="26"></td>
    </tr>
    <tr>
        <td>■ 비밀번호확인</td>
        <td><input type="password" name="wUserPWConfirm" id="pwCheck" onchange="isSame()" size="26" >&nbsp;&nbsp;<span id="same"></span></td>
    </tr>
    <tr>
        <td>■ 닉네임</td>
        <td><input type="text" name="jname" id="jname" size="25"></td>
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
    <td><input type="radio" name="gender" id="m" checked/>
        <label for="m">남</label>
        <input type="radio" name="gender" id="w"/>
        <label for="w">여</label>
    </td>
    </tr>
    <tr>
        <td id="title">생일</td>
         <td>

        <select name="birthday">
            <option>선택</option>
            <option>양력</option>
            <option>음력</option>
        </select>

        <input type="text" name="birth_yy" maxlength="4" placeholder="년(4자)" size="5" >
        <select name="birth_mm">
                            <option value="">월</option>
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