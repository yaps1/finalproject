<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
<style type="text/css">
body{
	margin-top: 100px;
	line-height: 1.6
}
.container{
	width: 800px;
	margin: 0 auto;
}


ul.tabs{
	margin: 0px;
	padding: 0px;
	list-style: none;
}
ul.tabs li{
	background: none;
	color: #222;
	display: inline-block;
	padding: 15px 15px;
	cursor: pointer;
}

ul.tabs li.current{
	background: #ededed;
	color: #222;
}

.tab-content{
	display: none;
	background: #ededed;
	padding: 15px;
}

.tab-content.current{
	display: inherit;
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
	                let tr = $("<tr></tr>");
	                $(tr).append($("<td></td>").html(this.goods_image1));
	                $(tr).append($("<td></td>").html(this.goods_name));
	                $(tr).append($("<td></td>").html(this.goods_price));
	                $("#sale").append(tr);
	            });			
		}});
		
		$.ajax({
	    	type: 'GET',
	    	url: "/cntSale",
	        data: {member_no:member_no},
	        success:function(data){
	        	$("#cntSale").append("<h4><h4>").html("판매상품("+data+")");
	        	//$("<hr>").insertAfter("#cntSale")
	    }});
	};
	sale();
	
	
	$("#saleGoods").click(function(){
		$("#sale").empty();
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
	                let tr = $("<tr></tr>");
	                $(tr).append($("<td></td>").html(this.goods_image1));
	                $(tr).append($("<td></td>").html(this.goods_name));
	                $(tr).append($("<td></td>").html(this.goods_price));
	                $("#purchase").append(tr);
	            });			
		}});
		
		$.ajax({
	    	type: 'GET',
	    	url: "/cntPurchase",
	        data: {member_no:member_no},
	        success:function(data){
	        	$("#cntPurchase").append("<h4><h4>").html("구매상품("+data+")");
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
	                let tr = $("<tr></tr>");
	                $(tr).append($("<td></td>").html(this.goods_image1));
	                $(tr).append($("<td></td>").html(this.goods_name));
	                $(tr).append($("<td></td>").html(this.goods_price));
	                $(tr).append($("<td></td>").html(this.goods_addr));
	                $(tr).append($("<td></td>").html(this.cnt));
	                $("#favor").append(tr);
	            });			
		}});
		
		$.ajax({
	    	type: 'GET',
	    	url: "/cntFavor",
	        data: {member_no:member_no},
	        success:function(data){
	        	$("#cntFavor").append("<h4><h4>").html("찜상품("+data+")");
	    }});
	});

});
</script>
</head>
<body>
<input type="hidden" value="${m.member_no }" id="member_no">
<div class="container">
	<ul class="tabs">
		<li class="tab-link current" data-tab="tab-1" id="saleGoods">판매상품</li>
		<li class="tab-link" data-tab="tab-2" id="purchaseGoods">구매상품</li>
		<li class="tab-link" data-tab="tab-3" id="favorGoods">찜상품</li>
	</ul>

	<div id="tab-1" class="tab-content current">
		<br>
		<h4 id="cntSale">판매상품</h4>
		<hr>
		<table border="1" width="80%">
	        <thead>
	            <tr>
	                <td>사진</td>
	                <td>상품명</td>
	                <td>가격</td>
	            </tr>
	        </thead>
	        <tbody id="sale"></tbody>
	    </table>
	</div>
	
	<div id="tab-2" class="tab-content">
		<br>
		<h4 id="cntPurchase">구매상품</h4>
		<hr>

		<table border="1" width="80%">
	        <thead>
	            <tr>
	                <td>사진</td>
	                <td>상품명</td>
	                <td>가격</td>
	            </tr>
	        </thead>
	        <tbody id="purchase"></tbody>
	    </table>
	    
	</div>
	<div id="tab-3" class="tab-content">
		<br>
		<h4 id="cntFavor">찜상품</h4>
		<hr>
		
		<table border="1" width="80%">
	        <thead>
	            <tr>
	                <td>사진</td>
	                <td>상품명</td>
	                <td>가격</td>
	                <td>주소</td>
	                <td>찜수</td>
	            </tr>
	        </thead>
	        <tbody id="favor"></tbody>
	    </table>
	    
	</div>
</div>
</body>
</html>