<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>추천 페이지</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.0.min.js" ></script>
<script type="text/javascript">
$(function(){
  var ex_show = $('.ex_show');
  var ex_hide = $('.ex_hide');
  var ex_box = $('.ex_box');
  ex_show.click(function(){
    ex_box.fadeIn();
  });
  ex_hide.click(function(){
    ex_box.fadeOut();
  });
});
</script>
<script>
$(function(){
      $('h1').hover(function(){
        $(this).css('background','yellow')
    },function(){
        $(this).css('background','white')
    })
    $('h2').hover(
    function(){$(this).addClass('hugeso')},
    function(){$(this).removeClass('hugeso')})
})
</script>
<style type="text/css">
.ex_show{float:left;margin-right:20px;cursor:pointer}
.ex_hide{float:left;cursor:pointer}
.ex_box{clear:both;
 float:left;
 width:100px;
 height:50px;
 background-color:red;
 border:1px solid blue;
 margin:50px;
   border-radius:10px}
.hugeso {background:pink}  
.rounded {
  width: 700px;
  background-color: #ddf;
  border:2px solid #abc;
  padding:1em;
  line-height: 1em;
  border-radius:0.2em;
  -moz-border-radius: 0.2em;
  -webkit-border-radius: 0.5em;
  font-size:1.4em;
  margin-left: 470px;
  }
.a {
        margin: 0px 0px;
        text-align: center;
        font-size: 50px;
        color: #4969F2;
        }  
</style>

</head>
<body>
	
		<div align="center">
			<tr>
				<td>
					<img width="100" height="100" src="https://lh3.googleusercontent.com/proxy/n5KZ-AF_47MtoBI75XoIaYestzxOCmgV3ekqrfwL3xAgcNEfdVbKjvB_sQfJ8cO7fy3eh8FcVfmvzjFmXWmB3ly9Kqz61gJcegcq8IZjgVT_OopKMQkmHg54r_rfja89" >
				</td>
			<td>
			<tr>
				<td>
					<h2>휴게소 맛집 랭킹</h2>
				</td>
			</tr>	
		</div>
	
	
	<hr/>
	<div align="center">
		<a href="#none" onclick="fn()">
				<h1>1. 화성휴게소</h1></a>
		    <h3>이영자 추천 맛집</h3>
			<div id="a">
				<p class="a" >
					<i class="fa fa-smile-o" aria-hidden="true"></i>		
				</p>
			</div>
				<script type="text/javascript">
					function fn() {
					$("#a").css("position","relative");
					if($("#a").css("opacity") == 1)
					$("#a").animate({opacity : 0,top:"+=500",left:"+=500"},1000);
					else
					$("#a").animate({opacity : 1,top:"0",left:"0"},1000);
					}
				</script>
	<h1>2. 금강휴게소</h1>
	<h1>3. 동해휴게소</h1>
	<h2>4. 단양휴게소</h2>
	<h2>5. 정읍 녹두장군휴게소</h2>
</div>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript">
    jQuery(document).ready(function() {
        jQuery("#btn").click(function() {
            if(jQuery("#displayDiv").css("display") == "none") {
                jQuery("#displayDiv").fadeIn();}
            else {jQuery("#displayDiv").fadeOut();}
        });
    });
</script>
<hr/>

<div align="center">
    <h1>휴게소 테마 소개</h1>
    <br/> 
    <br/> 
    <br/> 

     
    <div id="displayDiv">
        <img src="https://post-phinf.pstatic.net/MjAxNzAzMjhfNzUg/MDAxNDkwNjY3NzQyMDUz.SwuuF3AkKeCURuoNetbdMtVwbkKvlF71ggwdea7BAt4g.wJox2lwR1rzTBdYsKBGJwTj9rEUYQfu-fCPq51Lgw0Eg.JPEG/1.jpg?type=w1200" width="400" height="300">
    </div>
    <button type="button" id="btn">1위 휴게소 사진보기</button>
    <div>
    	휴게소명 : 마장 프리미엄 휴게소(양방향)<br/>
    	휴게소 테마 : 프리미엄 테마<br/>
    	휴게소 위치 : 중부고속도로 - 경기 이천시 마장면 중부고속도로 82<br/>
    	테마설명 : 중부고속도로의 자랑! 국내 최대 규모 프리미엄 휴게소로 인증받은 마장휴게소에 들러보자! <br/>
    	2만 7490㎡의 총면적에 지하 1층, 지상 3층으로 구성된 마장 프리미엄 휴게소는 스타벅스, 맥도날드, 롯데마트, 파리바게뜨 등의 프랜차이즈와 각종 브랜드 의류 매장, 공연장이 입점해 있어 <br/> 
    	깜빡 잊고 안 가져온 물품을 사거나 친환경 쉼터에서 장거리 운전의 피로를 달래고 답답해하는 아이들과 공연을 즐길 수 있는 최고의 복합문화휴식공간으로 자리 잡고 있다. <br/> 
    	주말에는 하루 2회씩 퓨전 국악, 마술, 아동극, 관악 4중주 등의 문화공연이 펼쳐지기도 하니 잠시 들르는 휴게소가 아니라 여행의 목적지가 되기도 한다.
    </div>
</div>
<script type="text/javascript">
    jQuery(document).ready(function() {
        jQuery("#bttn").click(function() {
            if(jQuery("#displayDivb").css("display") == "none") {
                jQuery("#displayDivb").fadeIn();}
            else {jQuery("#displayDivb").fadeOut();}
        });
    });
</script>

	<div align="center">
	    <hr/>
	    <div id="displayDivb">
	        <img src="https://www.ikld.kr/news/photo/201502/43817_21838_3340.jpg" width="400" height="300">
	    </div>
	    <button type="button" id="bttn">2위 휴게소 사진 보기</button>
	    <div>
	    	휴게소명 : 덕평 자연 휴게소(양방향)<br/>
	    	휴게소 테마 : 자연 테마<br/>
	    	휴게소 위치 : 영동고속도로 - 경기 이천시 마장면 덕이로154번길 287-76<br/>
	    	테마설명:덕평휴게소는 소고기국밥 판매량 1위라는 타이틀을 가지고 있다. 매년 17만 그릇이 넘는 소고기국밥이 팔리고 있지만 덕평휴게소의 매력은 먹거리에만 한정되어 있지는 않다.<br/> 
	    	2007년 한국건축문화대상을 받을 만큼 수려한 외관을 자랑하며 자연을 그대로 담은 러브가든과 허브 정원, 각종 예술 작품과 함께 생태공원이 조성되어 있어 진정한 의미의 힐링을 할 수 있는 곳이다.<br/> 
	    	또 국내 최초의 애견 테마파크 '달려라 코코'가 있어 아이들과 애견 가족에게도 높은 인기를 누리고 있다.
	    </div>
	</div>
	<script type="text/javascript">
	    jQuery(document).ready(function() {
	        jQuery("#btttn").click(function() {
	            if(jQuery("#displayDivbb").css("display") == "none") {
	                jQuery("#displayDivbb").fadeIn();}
	            else {jQuery("#displayDivbb").fadeOut();}
	        });
	    });
	</script>

<div align="center">
    <hr/>
    <div id="displayDivbb">
        <img src="https://img1.daumcdn.net/thumb/R720x0.q80/?scode=mtistory2&fname=http%3A%2F%2Fcfile4.uf.tistory.com%2Fimage%2F9907853D5C206EBC2472E1" width="400" height="300">
    </div>
    <button type="button" id="btttn">3위 휴게소 사진 보기</button>
    <div>
    	휴게소명 : 안성 휴게소(하행선, 부산방향)<br/>
    	휴게소 테마 : 맛집 테마<br/>
    	휴게소 위치 : 경부고속도로 하행선 부산방향 - 경기 안성시 원곡면 경부고속도로 365<br/>
    	테마설명:호두과자, 우동, 통감자 등 고속도로 휴게소 음식 하면 가장 먼저 떠오르는 것들이 있다. <br/>
    	이상하게 배가 고프지 않아도 휴게소에 들르면 꼭 무언가를 허겁지겁 먹으며 다시 차에 오르는 재미를 누리고 싶어진다. <br/>
    	휴게소 음식이 대부분 거기서 거기라지만 분명 맛으로 경쟁하는 맛집 휴게소들이 존재한다. <br/>
    	대표적인 곳이 바로 경부고속도로 부산 방향의 안성휴게소. ‘안성국밥’이라고 하는 새빨간 국물의 소고기국밥은 안 먹어보면 서러울 만큼 최고의 맛을 자랑한다. <br/>
    	서울 방향 안성휴게소에서도 소고기국밥을 팔지만, 국물이 하얀 '안성 옥국밥'이기에 하행선 안성휴게소에서만 판매하는 '안성국밥'을 기억해주시기 바란다.
	</div>
</div>
		
</body>
</html>