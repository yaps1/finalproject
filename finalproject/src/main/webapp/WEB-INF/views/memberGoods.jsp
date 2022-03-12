<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<style type="text/css">
body{
	margin-top: 100px;
	line-height: 1.6
}
.container{
	width: 70%;
	margin: auto;
}

ul.tabs{
	margin-left: 0px;
	padding: 0px;
	list-style: none;
}
ul.tabs li{
	background: none;
	color: #222;
	display: inline-block;
	padding: 15px 15px;
	cursor: pointer;
	border-radius: 15px;
}

ul.tabs li.current{
	background: #ededed;
	color: #222;
}

.tab-content{
	display: none;
	background: #ededed;
	padding: 15px;
	border-radius: 15px;
	padding-bottom: 100px;
}

.tab-content.current{
	display: inherit;
}
th,td{
	text-align: center;
	text-valign: middle;
}
.fontTitle{
	font-weight: bold;
}
#cardSale,#purchase,#favor{
	display: flex;
	align-items: center;
	justify-content: center;
	text-align: center;
}
#cardSale div,#purchase div,#favor div{
	margin-right: 15px;
	border-radius: 15px;
	background: silver;
}
img{
	width: 150px;
	height: 250px;
	padding: 10px;
}
h6{
	font-weight: bold;
}
#heart{
	width: 50px;
	height: 50px;
}
#favorcnt{
	color: #a20000;
}
p{
	font-weight: bold;
	color: #747474;
}
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function(){
	let member_no = $("#member_no").val();
	
	function sale() {
		$.ajax({
	    	type: 'GET',
	    	url: "/saleGoodsByMember",
	    	data:{member_no:member_no},
	        success:function(data){
	            $.each(data,function(){
	            	let goods_no = this.goods_no;
	            	let div = $("<div class='card' style='width: 18rem;'></div>");
	            	let img = $("<img class='card-img-top'>").attr("src","../images/"+this.goods_image1);
	            	$(div).append(img);
	            	let div2 = $("<div class='card-body'></div>");
	            	$(div2).append($("<h6 class='card-title'></h6>").html(this.goods_name));
	            	$(div2).append($("<p class='card-text'></p>").html(this.goods_price+"원"));
	            	$(div2).append($("<a href='/detailGoods?goods_no="+goods_no+"' class='btn btn-outline-secondary'>상품확인</a>"));
	            	$(div).append(div2);
	                $("#cardSale").append(div);
	            });			
		}});
		
		$.ajax({
	    	type: 'GET',
	    	url: "/cntSale",
	        data: {member_no:member_no},
	        success:function(data){
	        	$("#cntSale").append("<h4><h4>").html("판매상품("+data+")").addClass("fontTitle");
	    }});
	};
	sale();
	
	
	$("#saleGoods").click(function(){
		$("#cardSale").empty();
		var tab_id = $(this).attr('data-tab');

		$('ul.tabs li').removeClass('current');
		$('.tab-content').removeClass('current');

		$(this).addClass('current');
		$("#"+tab_id).addClass('current');
		
		sale();
	});
	
	$("#purchaseGoods").click(function(){
		$("#purchase").empty();
		var tab_id = $(this).attr('data-tab');

		$('ul.tabs li').removeClass('current');
		$('.tab-content').removeClass('current');

		$(this).addClass('current');
		$("#"+tab_id).addClass('current');
		
		$.ajax({
	    	type: 'GET',
	    	url: "/purchaseGoodsByMember",
	    	data:{member_no:member_no},
	        success:function(data){
	            $.each(data,function(){
	            	let goods_no = this.goods_no;
	            	let div = $("<div class='card' style='width: 18rem;'></div>");
	            	let img = $("<img class='card-img-top'>").attr("src","../images/"+this.goods_image1);
	            	$(div).append(img);
	            	let div2 = $("<div class='card-body'></div>");
	            	$(div2).append($("<h6 class='card-title'></h6>").html(this.goods_name));
	            	$(div2).append($("<p class='card-text'></p>").html(this.goods_price+"원"));
	            	$(div2).append($("<a href='/detailGoods?goods_no="+goods_no+"' class='btn btn-outline-secondary'>상품확인</a>"));
	            	$(div).append(div2);
	                $("#purchase").append(div);
	            });			
		}});
		
		$.ajax({
	    	type: 'GET',
	    	url: "/cntPurchase",
	        data: {member_no:member_no},
	        success:function(data){
	        	$("#cntPurchase").append("<h4><h4>").html("구매상품("+data+")").addClass("fontTitle");
	    }});
		
	});
	
	$("#favorGoods").click(function(){
		$("#favor").empty();
		var tab_id = $(this).attr('data-tab');

		$('ul.tabs li').removeClass('current');
		$('.tab-content').removeClass('current');

		$(this).addClass('current');
		$("#"+tab_id).addClass('current');
		
		$.ajax({
	    	type: 'GET',
	    	url: "/favorByMember",
	    	data:{member_no:member_no},
	        success:function(data){
	            $.each(data,function(){
	            	let goods_no = this.goods_no;
	            	let div = $("<div class='card' style='width: 18rem;'></div>");
	            	let img = $("<img class='card-img-top'>").attr("src","../images/"+this.goods_image1);
	            	let cnt = "<img src='../images/favorheart.png' id='heart'>"+this.cnt;
	            	$(div).append(img);
	            	let div2 = $("<div class='card-body'></div>");
	            	$(div2).append($("<h6 class='card-title'></h6>").html(this.goods_name));
	            	$(div2).append($("<p class='card-text'></p>").html(this.goods_price+"원"));
	            	$(div2).append($("<p class='card-text'></p>").html(this.goods_addr));
	            	$(div2).append($("<p class='card-text' id='favorcnt'></p>").html(cnt));
	            	$(div2).append($("<a href='/detailGoods?goods_no="+goods_no+"' class='btn btn-outline-secondary'>상품확인</a>"));
	            	$(div).append(div2);
	                $("#favor").append(div);
	            });			
		}});
		
		$.ajax({
	    	type: 'GET',
	    	url: "/cntFavor",
	        data: {member_no:member_no},
	        success:function(data){
	        	$("#cntFavor").append("<h4><h4>").html("찜상품("+data+")").addClass("fontTitle");
	    }});
	});

});
</script>
</head>
<body>
	<jsp:include page="header2.jsp"></jsp:include>
	<br>
	<br>
	<h2 style="text-align : center;"><strong><a href="/mypage?member_no=${m.member_no }" class="link-dark" style="text-decoration-line : none;">마이페이지</a></strong></h2>
	<br>
	<div class="bodycontainer">
	<!-- 네비게이션바 -->
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
	  <div class="container-fluid" style="text-align : center; width: 70%">
	    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
	      <li class="nav-item">
	       <a class="navbar-brand" href="/memberWriting?member_no=${m.member_no}">작성글</a>
	      </li>
	      <li class="nav-item">
	       <a class="navbar-brand" href="#">상품</a>
	      </li>
	    </ul>
	  </div>
	</nav>
	<br>
	<br>

<!-- 찜상품 탭 -->
<input type="hidden" value="${m.member_no }" id="member_no">
<div class="container" style="width: 70%;margin: auto;">
	<ul class="tabs"  style="text-align: center;">
		<li class="tab-link current" data-tab="tab-1" id="saleGoods"><strong>판매상품</strong></li>
		<li class="tab-link" data-tab="tab-2" id="purchaseGoods"><strong>구매상품</strong></li>
		<li class="tab-link" data-tab="tab-3" id="favorGoods"><strong>찜상품</strong></li>
	</ul>
	
	<div>
	<!-- 첫 화면 선택시 보이는 탭 -->	
	<div id="tab-1" class="tab-content current">
		<br>
		<h4 id="cntSale">판매상품</h4>
		<hr>
		<div id="cardSale"></div>
	</div>
	
	<div id="tab-2" class="tab-content">
		<br>
		<h4 id="cntPurchase">구매상품</h4>
		<hr>
		<div id="purchase"></div>
	</div>
	
	<div id="tab-3" class="tab-content">
		<br>
		<h4 id="cntFavor">찜상품</h4>
		<hr>
		<div id="favor"></div>
	</div>
	</div>
	</div>
	</div>
	<br>
	<br>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>