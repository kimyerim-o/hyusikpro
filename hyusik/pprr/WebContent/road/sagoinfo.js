$(function() {
	setInterval(updateTable, 10000);
});

function updateTable() {
	$.get('../roadre.go', {}, function(data) {
		drawTable(data);
	}, 'xml');
}

$(document).ready(function(){
	$.get('../roadre.go', {}, function(data) {
		drawTable(data);
	}, 'xml');
});

function drawTable(data) {
	$('div.error').empty();
	
	var $xml = $(data);
	
	var disableTable = $xml.find('response').text();
	console.log(disableTable);
	
	if (disableTable=="NULL") {
		$('div.error').empty().append("현재 사고가 없습니다.");
		return;
	}
	
	console.log("사고가 있습니다");
	
	var $table = $('.table');
	
	var $tbodyTr = "";
	
	$xml.find('data').children().each(function(index,node) {
	
		console.log("사고가 data");
		
		$tbodyTr += "<tr><td>사고</td>";
		
		var type=$xml.find('data').children('type').text();
		if(type=="ex"){
			type="고속도로";
		}else if(type=="its"){
			type="국도";
		}else if(type=="police"){
			type="경찰청";
		}
		$tbodyTr +="<td>"+type+"</td>"
		
		var msg = $xml.find('data').children('incidentmsg').text();
		console.log(msg);
		$tbodyTr += "<td>"+msg+"</td>"
			
		var block = $xml.find('data').children('lanesblocktype').text();
		if(block==0){
			block="통제없음";
		}else if(block==1){
			block="갓길통제";
		}else if(block==2){
			block="차로부분통제";
		}else if(block==3){
			block="전면통제 ";
		}
		console.log("block"+block);
		$tbodyTr += "<td>"+block+"</td></tr>"
		return false;
		
	});
	
	$table.find('tbody').empty().append($tbodyTr);
	
}