<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1"> 
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<!-- 구글 차트 호출 -->
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js">
</script>
<script type="text/javascript">
//구글 차트 라이브러리 로딩
google.charts.load("current", {packages:["corechart"]});
//라이브러리 로딩이 완료되면 drawChart함수호출, ()는 안씀
google.charts.setOnLoadCallback(drawChart);

function drawChart(){
 //차트 그리기에 필요한 json 데이터 로딩
 var jsonData=$.ajax({
	 url: "${path}/admin_servlet/chart.do",
	 dataType: "json",
	 async: false, //동기식처리(순차적 처리:데이터를 다부른 후 챠트출력하기 위해)
	 success:function(){
		 console.log(jsonData);
	 }
 }).responseText;
 console.log(jsonData);//콘솔에도 출력해봄
 var data=new google.visualization.DataTable(jsonData);
 console.log("데이터 테이블:"+data);
 var options = {title: '차트 예제', is3D: true,}
 
 var chart=new google.visualization.PieChart(
		 document.getElementById("chart_div"));  
/* 	 var chart=new google.visualization.LineChart(
		 document.getElementById("chart_div"));  */
/*  	var chart=new google.visualization.ColumnChart(
		 document.getElementById("chart_div"));	  */
		 
		 
 
 chart.draw(data, options);
	
}
</script>
<%@ include file="../include/menu.jsp" %>
<!-- 구글차트 -->

</head>
<body>
<section style="text-align: center;">
<div id="chart_div" style="width: 600px; height: 440px;"></div>
<button id="btn" type="button" onclick="drawChart()">refresh</button>
</section>
<%@ include file="../include/footer.jsp" %>
</body>
</html>