<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/info/infos_style.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/header/header_style.css">
<style>
#td {
	font-size:15px;
	font-family:'NanumSquareRoundB';
}
.submit {
	top: 900px;
  left: 900px;
  position: relative;
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
	})
</script>
</head>
<body>
<form method="post">
<input type="hidden" name="site" value="<%=request.getParameter("site")%>">
<input type="submit" class="submit" value="수정" formaction="<%=request.getContextPath()%>/update.go">
<input type="submit" class="submit" value="삭제" formaction="<%=request.getContextPath()%>/delete.go">
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
                <td rowspan="3">
					<c:set var="i" value='<%=request.getParameter("site")%>'/>
					<c:set var="m" value="info${i}.js"/>
					<div id="map"></div>
					<script src="<%=request.getContextPath()%>/info/infomap/${m}"></script>
                </td>
                <td colspan="2" style="width:100px;font-size: 30px">
					<input type="text" name="restname" value="${infoData.restinfo.restname}"/>
				</td>
            </tr>
                <td style="font-size: 20px;">주소</td>
                <td><input id="td" type="text" name="restadd" value="${infoData.restinfo.restadd}" style="width: 300px"/></td>
            <tr>
                <td style="width: 150px;font-size: 20px;height:80px;">전화번호</td>
                <td><input id="td" type="text" name="resttel" value="${infoData.restinfo.resttel}"/></td>
            </tr>
        </table>
		
		<ul class="infolist">
		 <li><input type="text" name="theme" value="${infoData.restinfo.theme}"/></li>
		 <li><input type="text" name="themede" value="${infoData.restinfo.themede}"/></li>
		 
		 <li>대표 음식 : <input type="text" name="firstfood" value="${infoData.restinfo.firstfood}"/></li>
		 <li>브랜드</li>
			<div>
			<c:forEach var="brand" items="${infoData.brand}" varStatus="i"><!-- brandname${i.index} -->
				<h3><input type="text" name="brandname" value="${brand.brandname}"/></h3>
				<a> <input type="text" name="brandde" value="${brand.brandde}"/></a>
			</c:forEach>
			</div>
		</ul>
	</div>

	<div id="tab2" class="tabcontent">
		<ul class="infolist">
			<li>편의시설</li>
			<div>
				<c:forEach var="restcon" items="${infoData.restcon}" >
					<h3><input type="text" name="conname" value="${restcon.conname}"/></h3>
					<a><input type="text" name="conde" value="${restcon.conde}"/></a>
				</c:forEach>
				<h3>임산부 휴게시설<input type="text" name="pregnant" value="${infoData.restinfo.pregnant}"/></h3>
				<h3>점자블록<input type="text" name="block" value="${infoData.restinfo.block}"/></h3>
				<h3><input type="text" name="truck" value="${infoData.restinfo.truck}"/> X or 화물차휴게소 운영</h3>
				<h3><input type="text" name="maintenance" value="${infoData.restinfo.maintenance}"/> X or 경정비 가능</h3>
				<h3>wifi <input type="text" name="wifi" value="${infoData.restinfo.wifi}"/></h3>
			</div>
			
			<li>화장실</li>
			<div>
				<a>남자 화장실 칸수</a> <a><input type="text" name="m_toilet" value="${infoData.restinfo.m_toilet}"/> 개</a><br>
				<a>여자 화장실 칸수</a> <a><input type="text" name="w_toilet" value="${infoData.restinfo.w_toilet}"/> 개</a>
			</div>

			<li>주차</li>
			<div>
				<a>전체 주차 구역 수</a> <a><input type="text" name="topark" value="${infoData.restinfo.topark}"/> 개</a><br>
				<a>소형 주차 구역 수</a> <a><input type="text" name="spark" value="${infoData.restinfo.spark}"/> 개</a><br>
				<a>대형 주차 구역 수</a> <a><input type="text" name="bpark" value="${infoData.restinfo.bpark}"/> 개</a>
				<h3>장애인 주차구역  <input type="text" name="jpark" value="${infoData.restinfo.jpark}"/></h3>
			</div>
		</ul>	
	</div>

	<div id="tab3" class="tabcontent">
		<ul class="infolist">
			<c:forEach var="food" items="${infoData.food}" >
				<li><input type="text" name="foodname" value="${food.foodname}"/>   
				￦<input type="text" name="foodcost" value=" ${food.foodcost}"/> </li>
				
				<input type="text" name="season" value="${food.season}"/> w or s or 4
				<a>음식 재료 : <input type="text" name="foodma" value="${food.foodma}"/></a><br/>
				<a>음식 음식설명 : <input type="text" name="foodde" value="${food.foodde}"/></a><br/>
			</c:forEach>
		</ul>
	</div>
	
	<div id="tab4" class="tabcontent">
	<ul class="infolist">
		<h3>주유소명 : <input type="text" name="oilname" value="${infoData.oil.oilname}"/></h3>
		<div>
			<h3>주유소 전화번호 : <input type="text" name="oiltel" value="${infoData.oil.oiltel}"/></h3>
			<h3>주유소 회사 : <input type="text" name="company" value="${infoData.oil.company}"/></h3>
			<li>가격 목록</li>
			<h3>현재 휘발유 가격 : <input type="text" name="gasoline" value="${infoData.oil.gasoline}"/></h3>
			<h3>현재 경유 가격 : <input type="text" name="disel" value="${infoData.oil.disel}"/></h3>
			<h3>현재 LPG 가격 : <input type="text" name="lpg" value="${infoData.oil.lpg}"/></h3>
			<h3>공기압점검기<input type="text" name="air" value="${infoData.oil.air}"/></h3>
			<h3>진공청소기<input type="text" name="cleaner" value="${infoData.oil.cleaner}"/></h3>
			<h3>매트청소기<input type="text" name="mat" value="${infoData.oil.mat}"/></h3>
		</div>
		<div>
			<c:forEach var="oilcon" items="${infoData.oilcon}" >
				<h3><input type="text" name="oilconname" value="${oilcon.oilconname}"/></h3>
				<a><input type="text" name="oilconde" value="${oilcon.oilconde}"/></a>
			</c:forEach>
		</div>
		</ul>
	</div>
</div>
</form>
</body>
</html>