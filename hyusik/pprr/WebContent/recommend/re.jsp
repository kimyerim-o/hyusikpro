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
  }
.a {
        margin: 0px 0px;
        text-align: left;
        font-size: 80px;
        color: #4969F2;
        }  
</style>

<div class="rounded">
<strong>휴게소 맛집 랭킹</strong>
</div>
</head>
<body>
	<div float="left">
		<a href="#none" onclick="fn()">
				<h1>1. 1등 휴게소</h1></a>
		    <h3>  이영자 추천 맛집</h3>
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
	<h1>2. 2등 휴게소</h1>
	<h1>3. 3등 휴게소</h1>
	<h2>4. 4등 휴게소</h2>
	<h2>5. 5등 휴게소</h2>
</div>
</body>
</html>