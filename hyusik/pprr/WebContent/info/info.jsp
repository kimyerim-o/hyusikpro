<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/header/header_style.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/info/infos_style.css">
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
		});
</script>
</head>
<body>
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
					${infoData.restinfo.restname}
				</td>
            </tr>
            	<td style="font-size: 20px;">주소</td>
                <td>${infoData.restinfo.restadd}</td>
            <tr>
                <td style="width: 150px;font-size: 20px;height:80px;">전화번호</td>
                <td>${infoData.restinfo.resttel}</td>
            </tr>
        </table>
		
		<ul class="infolist">
		 <li>대표 음식 : ${infoData.restinfo.firstfood}</li>
		 <li>브랜드</li>
			<div>
			<c:forEach var="brand" items="${infoData.brand}" >
				<h3>${brand.brandname}</h3>
				<a> ${brand.brandde}</a>
			</c:forEach>
			</div>
		</ul>
	</div>

	<div id="tab2" class="tabcontent">
		<ul class="infolist">
			<li>편의시설</li>
			<div>
				<c:forEach var="restcon" items="${infoData.restcon}" >
					<h3>${restcon.conname}</h3>
					<c:if test="${! empty restcon.conde}">
						<a> ${restcon.conde}</a>
					</c:if>
				</c:forEach>
				<h3>임산부 휴게시설 ${infoData.restinfo.pregnant}</h3>
				<h3>점자블록 ${infoData.restinfo.block}</h3>
				<c:if test="${infoData.restinfo.truck !='X'}">
					<h3>${infoData.restinfo.truck}</h3>
				</c:if>
				<c:if test="${infoData.restinfo.maintenance !='X'}">
					<h3>${infoData.restinfo.maintenance}</h3>
				</c:if>
				<h3>wifi ${infoData.restinfo.wifi}</h3>
			</div>
			
			<li>화장실</li>
			<div>
				<a>남자 화장실 칸수</a> <a>${infoData.restinfo.m_toilet} 개</a><br>
				<a>여자 화장실 칸수</a> <a>${infoData.restinfo.w_toilet} 개</a>
			</div>

			<li>주차</li>
			<div>
				<a>전체 주차 구역 수</a> <a>${infoData.restinfo.topark} 개</a><br>
				<a>소형 주차 구역 수</a> <a>${infoData.restinfo.spark} 개</a><br>
				<a>대형 주차 구역 수</a> <a>${infoData.restinfo.bpark} 개</a>
				<h3>장애인 주차구역 ${infoData.restinfo.jpark}</h3>
			</div>
		</ul>	
	</div>

	<div id="tab3" class="tabcontent">
		<ul class="infolist">
			<c:forEach var="food" items="${infoData.food}" >
				<li>${food.foodname}   ￦  ${food.foodcost}</li>
				<c:choose>
				<c:when test="${food.season=='w'}">
				    <a>겨울메뉴</a><br/>
				</c:when>
				<c:when test="${food.season=='s'}">
					<a>여름메뉴</a><br/>
				</c:when>
				<c:otherwise>
					<a>${food.season}계절</a><br/>
				</c:otherwise>
				</c:choose>
				<c:if test="${! empty food.foodma}">
					<a>음식 재료 : ${food.foodma}</a><br/>
				</c:if>
				<c:if test="${! empty food.foodde}">
					<a>음식 음식설명 : ${food.foodde}</a><br/>
				</c:if>
			</c:forEach>
		</ul>
	</div>
	
	<div id="tab4" class="tabcontent">
	<ul class="infolist">
		<h1>${infoData.oil.oilname}</h1>
		<div>
			<h3>주유소 전화번호 : ${infoData.oil.oiltel}</h3>
			<h3>주유소 회사 : ${infoData.oil.company}</h3>
			<li>가격 목록</li>
			<h3>현재 휘발유 가격 : ${infoData.oil.gasoline}</h3>
			<h3>현재 경유 가격 : ${infoData.oil.disel}</h3>
			<c:if test="${infoData.oil.lpg !=0}">
				<h3>현재 LPG 가격 : ${infoData.oil.lpg}</h3>
			</c:if>		
		</div>
		<div>
		<li>주유소 편의 시설</li>
		
			<c:if test="${infoData.oil.air ==1}">
				<h3>공기압점검기 사용가능</h3>
			</c:if>
			<c:if test="${infoData.oil.cleaner ==1}">
				<h3>진공청소기 사용가능</h3>
			</c:if>
			<c:if test="${infoData.oil.mat ==1}">
				<h3>매트청소기 사용가능</h3>
			</c:if>
			
			<c:forEach var="oilcon" items="${infoData.oilcon}" >
				<h3>${oilcon.oilconname}</h3>
				<c:if test="${! empty oilcon.oilconde}">
					<a>${oilcon.oilconde}</a>
				</c:if>
			</c:forEach>		
		</div>
		</ul>
	</div>
</div>
</body>
</html>