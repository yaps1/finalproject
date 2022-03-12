<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<style type="text/css">
div{
	margin:0 auto;
}
</style>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
	google.charts.load('current', {packages: ['corechart', 'bar']});
	google.charts.setOnLoadCallback(member_level);
	google.charts.setOnLoadCallback(chart_member_join);
	google.charts.setOnLoadCallback(chart_goods);
	

	//판매자 레벨 차트
	function member_level() {	
      var data = google.visualization.arrayToDataTable([
    	['판매자', '판매자 레벨'],
    	${result_member}
      ]);

      var options = {
        title: '판매자 레벨 TOP5',
        chartArea: {width: '50%'},
        hAxis: {
          title: '판매자 레벨',
          minValue: 0
        },
        vAxis: {
          title: '판매자 아이디'
        }
      };

      var chart = new google.visualization.BarChart(document.getElementById('chart_member_level'));

      chart.draw(data, options);
      
	}
	
	//월별 회원 증감추이
	function chart_member_join() {
        var data = google.visualization.arrayToDataTable([
       	 ['Year/Month', '신규 회원수'],
       	 ${result_member_join}
        ]);

        var options = {
          title: '월별 회원 증감 추이',
          curveType: 'function',
          legend: { position: 'bottom' }
        };

        var chart = new google.visualization.LineChart(document.getElementById('chart_member_join'));

        chart.draw(data, options);
    }
	
	//판매 카테고리 top3
	function chart_goods() {
        var data = google.visualization.arrayToDataTable([
          ['물품 카테고리', '판매량'],
          ${result_goods}
        ]);

        var options = {
          title: '판매 물품 카테고리 TOP3',
          pieHole: 0.4,
        };

        var chart = new google.visualization.PieChart(document.getElementById('chart_goods'));
        chart.draw(data, options);
      }
</script>
</head>
<body>
	<br>
	<br>
	<br>
	<h2 style="text-align : center;"><strong><a href="../../manager.jsp" class="link-dark" style="text-decoration-line : none;">관리자</a></strong></h2>
	<br>
	<br>
	<!-- 네비게이션바 -->
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
	  <div class="container-fluid" style="text-align : center; width: 70%">
	    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
	      <li class="nav-item">
	       <a class="navbar-brand" href="#">차트분석</a>
	      </li>
	      <li class="nav-item">
	       <a class="navbar-brand" href="managerListMember">회원관리</a>
	      </li>
	      <li class="nav-item">
	       <a class="navbar-brand" href="managerNotice">공지사항관리</a>
	      </li>
	      <li class="nav-item">
	       <a class="navbar-brand" href="listQna">문의사항관리</a>
	      </li>
	    </ul>
	  </div>
	</nav>
	<br>
	<h3 style="text-align : center;"><strong>차트 분석</strong></h3>
	<br>
		
  	<div id="chart_member_level" style="width: 1200px; height: 500px;"></div>
  	<div id="chart_member_join" style="width: 1200px; height: 500px;"></div>
  	<div id="chart_goods" style="width: 1200px; height: 500px;"></div>
</body>
</html>