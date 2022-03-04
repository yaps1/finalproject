<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
	google.charts.load('current', {packages: ['corechart', 'bar']});
	google.charts.setOnLoadCallback(drawBasic);
	
	//판매자 레벨 차트
	function drawBasic() {
	
	      var data = google.visualization.arrayToDataTable([
	        ['판매자', '판매자 레벨',],
	        ['New York City, NY', 5],
	        ['Los Angeles, CA', 4.6],
	        ['Chicago, IL', 3.2],
	        ['Houston, TX', 3],
	        ['Philadelphia, PA', 2]
	      ]);
	
	      var options = {
	        title: '판매자 레벨 TOP5',
	        chartArea: {width: '50%'},
	        hAxis: {
	          title: '판매자 레벨',
	          minValue: 0
	        },
	        vAxis: {
	          title: '판매자'
	        }
	      };
	
	      var chart = new google.visualization.BarChart(document.getElementById('chart_div'));
	
	      chart.draw(data, options);
	    }
</script>
</head>
<body>
<hr>
	<br>
	<br>
	<h2 style="text-align : center;"><strong>차트 분석</strong></h2>
	<br>
	<br>
  	<div id="chart_div" style="width: 800px; height: 500px;"></div>
</body>
</html>