<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/info/infos_style.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/header/header_style.css">
<style>
.cont input {width:200px}
.cont {font-size: 20px;}
.submit {margin-left:900px;margin-top:80px;
	color: white;
  text-align: center;
  font-size:1.2rem;
  background: #2f3c4a;
  border-radius: 10px;
  border:0px;
  margin-top:15px}
</style>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d033ab2c0002c3aedd619825d12b4956"></script>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script>
	$(function() {		
		$('ul.tab li').click(function() {
			var activeTab = $(this).attr('data-tab');
			$('ul.tab li').removeClass('current');
			$('.tabcontent').removeClass('current');
			$(this).addClass('current');
			$('#' + activeTab).addClass('current');
		
	})
	$('#bu1').click(function(){
		$('#ta1 tr:last').after('<tr><td><input type="text" name="brandname"/></td><td><input type="text" name="brandde"/></td></tr>')
	})
	$('#bud1').click(function(){
		$('#ta1 tr:last').remove()})
		
	$('#bu2').click(function(){
		$('#ta2 tr:last').after('<tr><td><input type="text" name="conname"/></td><td><input type="text" name="conde"/></td></tr>')
	})
	$('#bud2').click(function(){
		$('#ta2 tr:last').remove()})
		
	$('#bu3').click(function(){
		$('#ta3 tr:last').after('<td><input type="text" name="foodname"/></td><td><input type="text" name="foodcost"/></td><td><input type="text" name="season"/></td><td><input type="text" name="foodma"/></td><td><input type="text" name="foodde"/></td>')
	})
	$('#bud3').click(function(){
		$('#ta3 tr:last').remove()})	
		
	$('#bu4').click(function(){
		$('#ta4 tr:last').after('<tr><td><input type="text" name="oilconname"/></td><td><input type="text" name="oilconde"/></td></tr>')
	})
	$('#bud4').click(function(){
		$('#ta4 tr:last').remove()})		
	})
	
</script>
</head>
<body>
<form action="<%=request.getContextPath()%>/insert.go" method="post">
<div class="cont">
	<ul class="tab">
		<li class="current" data-tab="tab1"><a href="#">휴게소</a></li>
		<li data-tab="tab2"><a href="#">편의 시설</a></li>
		<li data-tab="tab3"><a href="#">음식</a></li>
		<li data-tab="tab4"><a href="#">주유소</a></li>
	</ul>

	<div id="tab1" class="tabcontent current">
		<table class="location">
            <tr>
                <td colspan="2">
					지도를 추가하세요
                </td>
            </tr>
            <tr>    
            	<td>
					휴게소번호
                </td>
                <td>
					<input type="text" name="restno"/>
				</td>
            </tr>
            <tr> 
                <td>휴게소명</td>
                <td>
					<input type="text" name="restname"/>
				</td>
			</tr>
            <tr> 
                <td>주소</td>
                <td><input id="td" type="text" name="restadd"/></td>
             </tr>   
            <tr>
                <td>전화번호</td>
                <td><input id="td" type="text" name="resttel"/></td>
            </tr>
        </table>
		
		<table class="location">
			<tr>
				<td>테마명</td>
				<td><input type="text" name="theme"/></td>
			</tr>
			<tr>
				<td>테마상세설명</td>
				<td><input type="text" name="themede"/></td>
			</tr>
			<tr>
				<td>대표 음식</td>
				<td><input type="text" name="firstfood"/></td>
			</tr>
		</table>

		<table id=ta1 class="location">
		브랜드
		<input id=bu1 type="button" value="브랜드 추가">
		<input id=bud1 type="button" value="브랜드 삭제">
			<tr>
				<td>브랜드명</td>
				<td>브랜드 설명</td>
			</tr>
			<tbody>
			<tr>
				<td><input type="text" name="brandname"/></td>
				<td><input type="text" name="brandde"/></td>
			</tr>
			</tbody>
		</table>

	</div>

	<div id="tab2" class="tabcontent">
		<table id=ta2>
		편의시설
		<input id=bu2 type="button" value="편의시설 추가">
		<input id=bud2 type="button" value="편의시설 삭제">
			<tr>
				<td>편의시설명 </td>
				<td>편의시설 설명</td>
			</tr>
			<tr>
				<td><input type="text" name="conname"/></td>
				<td><input type="text" name="conde"/></td>
			</tr>
		</table>
		<table class="location">
			<tr>
				<td>임산부 휴게시설</td>
				<td><input type="text" name="pregnant"/></td>
			</tr>
			<tr>
				<td>점자블록</td>
				<td><input type="text" name="block"/></td>
			</tr>
			<tr>
				<td>화물차 휴게소 (화물차휴게소 운영  or X)</td>
				<td><input type="text" name="truck"/></td>
			</tr>
			<tr>
				<td>경정비 시설 (경정비 가능  or X)</td>
				<td><input type="text" name="maintenance"/></td>
			</tr>
			<tr>
				<td>wifi (가능  or 불가능)</td>
				<td><input type="text" name="wifi"/></td>
			</tr>
						<tr>
				<td>점자블록</td>
				<td><input type="text" name="block"/></td>
			</tr>
			<tr>
				<td colspan="2">화장실</td>
			</tr>
			<tr>
				<td>남자 화장실 칸수</td>
				<td><input type="text" name="m_toilet"/> 개</td>
			</tr>
			<tr>
				<td>여자 화장실 칸수</td>
				<td><input type="text" name="w_toilet"/> 개</td>
			</tr>
			<tr>
				<td colspan="2">주차</td>
			</tr>
			<tr>
				<td>전체 주차 구역 수</td>
				<td><input type="text" name="topark"/></td>
			</tr>
			<tr>
				<td>소형 주차 구역 수</td>
				<td><input type="text" name="spark"/></td>
			</tr>
			<tr>
				<td>대형 주차 구역 수</td>
				<td><input type="text" name="bpark"/></td>
			</tr>
			<tr>
				<td>장애인 주차구역  (설치 or 설치안함)</td>
				<td><input type="text" name="jpark"/></td>
			</tr>
		</table>
	</div>

	<div id="tab3" class="tabcontent">
		<table id=ta3 class="location">
		<input id=bu3 type="button" value="음식 추가">
		<input id=bud3 type="button" value="음식 삭제">
			<tr>
				<td>음식명 </td>
				<td>음식 가격</td>
				<td>계절메뉴 (w or s or 4)</td>
				<td>음식 재료</td>
				<td>음식 설명</td>
			</tr>
			<tr>
				<td><input type="text" name="foodname"/></td>
				<td><input type="text" name="foodcost"/></td>
				<td><input type="text" name="season"/></td>
				<td><input type="text" name="foodma"/></td>
				<td><input type="text" name="foodde"/></td>				
			</tr>
		</table>
	</div>
	
	<div id="tab4" class="tabcontent">
			<table class="location">
			<tr>
				<td>주유소명</td>
				<td><input type="text" name="oilname"/></td>
			</tr>
			<tr>
				<td>주유소전화번호</td>
				<td><input type="text" name="oiltel"/></td>
			</tr>
			<tr>
				<td>휘발유 가격</td>
				<td><input type="text" name="gasoline"/></td>
			</tr>
			<tr>
				<td>경유 가격</td>
				<td><input type="text" name="disel"/></td>
			</tr>
			<tr>
				<td>LPG 가격</td>
				<td><input type="text" name="lpg"/></td>
			</tr>
			<tr>
				<td>회사명</td>
				<td><input type="text" name="company"/></td>
			</tr>
			<tr>
				<td>공기압점검기 유무 (1 or 0)</td>
				<td><input type="text" name="air"/></td>
			</tr>
			<tr>
				<td>진공청소기 유무 (1 or 0)</td>
				<td><input type="text" name="cleaner"/> 개</td>
			</tr>
			<tr>
				<td>매트청소기 유무 (1 or 0)</td>
				<td><input type="text" name="mat"/> 개</td>
			</tr>
		</table>
		<table id=ta4 class="location">
		<input id=bu4 type="button" value="주유소 편의시설 추가">
		<input id=bud4 type="button" value="주유소 편의시설  삭제">
			<tr>
				<td>주유소 편의시설명 </td>
				<td>주유소 편의시설 설명</td>
			</tr>
			<tr>
				<td><input type="text" name="oilconname"/></td>
				<td><input type="text" name="oilconde"/></td>
			</tr>
		</table>
	</div>
</div>
<input type="submit" value="입력" class="submit">
</form>
</body>
</html>