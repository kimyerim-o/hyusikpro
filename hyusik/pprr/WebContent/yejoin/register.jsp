<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>휴~식 약관동의</title>
  <link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
  <script src="http://code.jquery.com/jquery-1.10.2.js"></script>
  <script src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
  <link rel="stylesheet" href="/resources/demos/style.css">
   <style type="text/css">
    #d1{
     width:770px;
     margin:0 auto;
    }

   </style>
   <!-- accordion 접히는 Script 선언 -->
  <script>
  $(function() {
    $( "#accordion" ).accordion();
    $('#accordion input[type="checkbox"]').click(function(e) {
        e.stopPropagation();
    });
  });
  
  </script>
</head>


<body>
<form action="<%=request.getContextPath()%>/joinbe.go" id="form1" method="post">
<div id="d1">
 <br><br>
 <h2 align="center">회원가입을 환영합니다.</h2><br/><br/>
  <tr>
   <td align="left"><font size="2">이용약관, 개인정보 수집 및 이용에 모두 동의합니다.</font></td>

   <td><input type="checkbox" name="all" id="all"></td><hr/>
  </tr>
 <div id="accordion">

   <h3><font size="2">휴~식 이용약관 동의(필수)</font><input type="checkbox" name="c1" id="c1"/></a></h3>
   <td><textarea readonly="readonly" rows="5" cols="66">
제 1 조 (목적)

이 약관은 휴~식 홈페이지의 모든 제반 서비스의 이용과 관련하여 귀 홈페이지의 사용자에 대한 권리, 의무 및 책임사항, 기타 필요한 사항을 규정함을 목적으로 합니다.


제 2 조 (정의)

이 약관에서 사용하는 용어의 정의는 다음과 같습니다.
①"서비스"라 함은 구현되는 단말기(PC, 휴대형단말기 등의 각종 유무선 장치를 포함)와 상관없이 "회원"이 이용할 수 있는 휴식 홈페이지의 제반 서비스를 의미합니다.
②"회원"이라 함은 회사의 "서비스"에 접속하여 이 약관에 따라 "휴~식"홈페이지와의 이용계약을 체결하고 저희 홈페이지에서 제공하는 "서비스"를 이용하는 고객을 말합니다.
③"이메일(Email)=아이디(ID)"라 함은 "회원"의 식별과 "서비스" 이용을 위하여 "회원"이 정하고 저희 홈페이지에서 승인하는 문자와 숫자 및 특수기호의 조합을 의미합니다.
④"비밀번호"라 함은 "회원"이 부여 받은 "아이디"와 일치되는 "회원"임을 확인하고 비밀보호를 위해 "회원" 자신이 정한 문자 또는 숫자 그리고 특수기호의의 조합을 의미합니다.
⑤"게시물"이라 함은 "회원"이 "서비스"를 이용함에 있어 "게시판"에 게시한 부호ㆍ문자ㆍ음성ㆍ음향ㆍ화상ㆍ동영상 등의 정보 형태의 글, 사진, 동영상 및 각종 파일과 링크 등을 의미합니다.
   </textarea>
   <h3><a href="#"><font size="2">개인정보 수집 및 이용에 대한 안내(필수)</font><input type="checkbox" name="c2" id="c2"/></a></h3>
   <div>
     <textarea readonly="readonly" rows="5" cols="66">

정보통신망법 규정에 따라 네이버에 회원가입 신청하시는 분께 수집하는 개인정보의 항목, 개인정보의 수집 및 이용목적, 개인정보의 보유 및 이용기간을 안내 드리오니 자세히 읽은 후 동의하여 주시기 바랍니다.


1. 수집하는 개인정보

이용자는 회원가입을 하지 않은 상태에서 "게시물"작성과 기타 회원 서비스 외 정보 확인을 위한 데이터를 제공하며, 회원등록 시 최소한의 개인정보("이메일", "생년월일", "성별")를 수집하여 회원관리에 사용함을 명시합니다.

제 1 조 (목적)
이 약관은 휴~식 홈페이지(이하 “휴~식”)에서 제공하는 위치정보사업 또는 위치기반서비스사업과 관련하여 회사와 개인위치정보주체와의 권리, 의무 및 책임사항, 기타 필요한 사항을 규정함을 목적으로 합니다.

제 2 조 (약관 외 준칙)
이 약관에 명시되지 않은 사항은 위치정보의 보호 및 이용 등에 관한 법률, 정보통신망 이용촉진 및 정보보호 등에 관한 법률, 전기통신기본법, 전기통신사업법 등 관계법령과 휴~식의 이용약관 및 개인정보취급방침, 휴~식에서 별도로 정한 지침 등에 의합니다.

제 3 조 (서비스 내용)
휴식은 위치정보사업자인 이동통신사로부터 위치정보를 전달받아 아래와 같은 위치기반서비스를 제공합니다. 
1.Geo Tagging 서비스: 홈페이지 이용 시, 이용자의 위치기반 정보를 수집하여 현 위치 및 검색한 위치의 정보를 제공하고 있습니다.
2.위치정보를 활용한 검색결과 제공 서비스: 정보 검색을 요청하거나 개인위치정보주체 또는 이동성 있는 기기의 위치정보를 제공 시 본 위치정보를 이용한 검색결과 및 주변결과(맛집, 교통상황, 교통수단 등)를 제시합니다.
3.이용자 보호 및 부정 이용 방지: 개인위치정보주체 또는 이동성 있는 기기의 위치를 이용하여 권한없는 자의 비정상적인 서비스 이용 시도 등을 차단합니다.
 </textarea>
   </div>
 </div>
 <div align="center">
  <br/>
  <input type="submit" value="동의"><input type="reset" value="비동의">
  <br/>
 </div>
</div>
</form>
<!-- check Box 이벤트처리를 위한 Script -->
<script>
var doc = document;
  var form1 = doc.getElementById('form1');
  var inputs = form1.getElementsByTagName('INPUT');
  var form1_data = {
   "c1": false,  //전체 선택
   "c2": false,  //필수 선택 1
   "c3": false   //필수 선택 2
  };

  var c1 = doc.getElementById('c1');
  var c2 = doc.getElementById('c2');
  var c3 = doc.getElementById('c3');

  function checkboxListener() {
   form1_data[this.name] = this.checked; //각각 자신의 checkBox를 Checked 상태로 바꿈
  }


   c1.onclick = c2.onclick = c3.onclick = checkboxListener;   //c1, C2, C3를 checkBoxListenner를 호출하여
                                                                   //Checked로 바꿈
   var all = doc.getElementById('all');  //전체 체크를 위한 체크박스 선언

   all.onclick = function() {  //전체 체크를 누를 시
    if (this.checked) {
     setCheckbox(form1_data, true);   //form1_data(c1,c2,c3)의 값을 모두 Checked로 바꿈
    } else {
     setCheckbox(form1_data, false);  ////form1_data(c1,c2,c3)의 값을 모두 no checked로 바꿈
    }
   };


   function setCheckbox(obj, state) { //checkbox상태 변경하는 함수
    for (var x in obj) {
     obj[x] = state;

     for(var i = 0; i < inputs.length; i++) {
      if(inputs[i].type == "checkbox") {
       inputs[i].checked = state;
      }
     }

    }
   }

  form1.onsubmit = function(e) {
   e.preventDefault();

   if ( !form1_data['c1'] ) {
    alert('이용동의 약관에 동의하지 않았습니다.');
    return false;
   }

   if ( !form1_data['c2'] ) {
    alert('개인정보 수집 및 이용에 대한 안내를 동의하지 않았습니다.');
    return false;
   }

   this.submit();
  };
</script>
</body>
</html>