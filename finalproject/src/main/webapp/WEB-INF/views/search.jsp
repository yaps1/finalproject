<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<style type="text/css">
.searchContainer{
	width: 70%;
	margin: auto;
}
h4{
	color: #555f73;
	font-weight: bold;
}
#goods{
	display: flex;
	align-items: center;
	justify-content: center;
	text-align: center;
}
#goods div{
	margin-right: 15px;
	border-radius: 15px;
	background: silver;
}
img{
	width: 150px;
	height: 250px;
	padding: 10px;
}
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function () {
	$(document).ready(function () {
		search();
	});
	
	function search() {
		let searchkeyword = $("#searchkeyword").val();
		if(searchkeyword == null || searchkeyword == undefined || searchkeyword == ""){ alert('검색어를 입력해주세요.'); $('#searchkeyword').focus(); return false;} 
		
		$("#goods").empty();
		$("#gb").empty();
		$("#sg").empty();
		$("#notice").empty();
		
	    $.ajax({
	    	type: 'GET',
	    	url: "/searchGoodsByMain",
	        data: {searchkeyword:searchkeyword},
	        success:function(data){
	            $.each(data,function(){
	            	let div = $("<div class='card' style='width: 18rem;'></div>");
	            	let img = $("<img class='card-img-top'>").attr("src","../images/"+this.goods_image1);
	            	$(div).append(img);
	            	let div2 = $("<div class='card-body'></div>");
	            	$(div2).append($("<h6 class='card-title'></h6>").html(this.goods_name));
	            	$(div2).append($("<p class='card-text'></p>").html(this.goods_price+"원"));
	            	$(div2).append($("<a href='/detailGoods?goods_no=${goods_no}' class='btn btn-outline-secondary'>상품확인</a>"));
	            	$(div).append(div2);
	                $("#goods").append(div);
	            });
	    }});
	    
	    $(document).on("click","#g_tr",function(){
            let goods_no = $(this).attr("goods_no");
            location.href = "getGoods?goods_no="+goods_no;
        });
	    
	    $.ajax({
	    	type: 'GET',
	    	url: "/searchGBByMain",
	        data: {searchkeyword:searchkeyword},
	        success:function(data){
	            $.each(data,function(){
	            	let state = "진행 중";
	            	if(this.gb_state == 0){
	            		state = "공구 종료"
	            	}
	            	let tr = $("<tr id='gb_tr'></tr>").attr("gb_no",this.gb_no);
	                $(tr).append($("<td></td>").html(this.gb_no));
	                $(tr).append($("<td></td>").html(state));
	                $(tr).append($("<td></td>").html(this.gb_title));
	                $(tr).append($("<td></td>").html(this.gb_capacity));
	                $("#gb").append(tr);
	            });
	    }});
	    
	    $(document).on("click","#gb_tr",function(){
            let gb_no = $(this).attr("gb_no");
            location.href = "detailGB?gb_no="+gb_no;
        });
	    
	    $.ajax({
	    	type: 'GET',
	    	url: "/searchSGByMain",
	        data: {searchkeyword:searchkeyword},
	        success:function(data){
	            $.each(data,function(){
	            	let tr = $("<tr id='sg_tr'></tr>").attr("sg_no",this.sg_no);
	                $(tr).append($("<td></td>").html(this.sg_no));
	                $(tr).append($("<td></td>").html(this.sg_title));
	                $(tr).append($("<td></td>").html(this.member_nickname));
	                $(tr).append($("<td></td>").html(this.sg_date));
	                $("#sg").append(tr);
	            });
	    }});
	    
	    $(document).on("click","#sg_tr",function(){
            let sg_no = $(this).attr("sg_no");
            location.href = "getSG?sg_no="+sg_no;
        });
	    
	    $.ajax({
	    	type: 'GET',
	    	url: "/searchNoticeByMain",
	        data: {searchkeyword:searchkeyword},
	        success:function(data){
	            $.each(data,function(){
	            	let tr = $("<tr id='n_tr'></tr>").attr("notice_no",this.notice_no);
	                $(tr).append($("<td></td>").html(this.notice_no));
	                $(tr).append($("<td></td>").html(this.notice_title));
	                $(tr).append($("<td></td>").html(this.notice_date));
	                $("#notice").append(tr);
	            });
	    }});
	    
	    $(document).on("click","#n_tr",function(){
            let notice_no = $(this).attr("notice_no");
            location.href = "detailNotice?notice_no="+notice_no;
        });
		
	    $.ajax({
	    	type: 'GET',
	    	url: "/cntSearchGoods",
	        data: {searchkeyword:searchkeyword},
	        success:function(data){
	        	 $("#cntGoods").append("<h4><h4>").html("중고거래 검색결과("+data+"건)");
	    }});
	    
	    $.ajax({
	    	type: 'GET',
	    	url: "/cntSearchGB",
	        data: {searchkeyword:searchkeyword},
	        success:function(data){
	        	 $("#cntGB").append("<h4><h4>").html("공동구매 검색결과("+data+"건)");
	    }});
	    
	    $.ajax({
	    	type: 'GET',
	    	url: "/cntSearchSG",
	        data: {searchkeyword:searchkeyword},
	        success:function(data){
	        	 $("#cntSG").append("<h4><h4>").html("커뮤니티 소모임 검색결과("+data+"건)");
	    }});
	    
	    $.ajax({
	    	type: 'GET',
	    	url: "/cntSearchNotice",
	        data: {searchkeyword:searchkeyword},
	        success:function(data){
	        	 $("#cntNotice").append("<h4><h4>").html("공지사항 검색결과("+data+"건)");
	    }});
	    
	    $.ajax({
	    	type: 'GET',
	    	url: "/cntTotal",
	        data: {searchkeyword:searchkeyword},
	        success:function(data){
	        	 $("#cntTotal").append("<h2><h2>").html("통합검색 검색결과("+data+"건)");
	    }});
	}
	
	$("#search").click(function(){
		search();
	})
	
});
</script>
</head>
<body>
	<jsp:include page="header2.jsp"></jsp:include>
	<br>
	<br>
	<h2 style="text-align : center;"><strong><a href="/search" class="link-dark" style="text-decoration-line : none;">통합검색</a></strong></h2>
	<br>
	
	<!-- 검색창 -->
	<nav class="navbar navbar-light bg-light">
	  <div class="container-fluid" style="text-align: center; width: 25%;">
	    <form class="d-flex" name="search-form" autocomplete="off">
	      <input style="width: 20rem;height: 3rem;" class="form-control me-2" type="text" placeholder="통합검색" aria-label="Search"  name="searchkeyword" id="searchkeyword" value="${searchkeyword }">
	      <input style="width: 5rem;height: 3rem;" type="button" id="search" value="검색" class="btn btn-outline-secondary">
	    </form>
	  </div>
	</nav>
	<br>
	<br>
	<h3 style="text-align : center;color: #555f73;" id="cntTotal"><strong>검색결과</strong></h3>
	<br>
	<hr>
	<br>
	<div class="searchContainer">
		<h4 id="cntGoods">중고거래 검색결과</h4>
		<br>
		<div id="goods"></div>
		<br>
		<hr>
		<br>
		<h4 id="cntGB">공동구매 검색결과</h4>
		<br>
		<table border="1" width="80%" class="table table-secondary table-hover">
	        <thead>
	            <tr>
	                <td>번호</td>
	                <td>진행상태</td>
	                <td>제목</td>
	                <td>모집인원</td>
	            </tr>
	        </thead>
	        <tbody id="gb"></tbody>
	    </table>
	    <br>
		<hr>
		<br>
		<h4 id="cntSG">커뮤니티 소모임 검색결과</h4>
		<br>
		<table border="1" width="80%" class="table table-secondary table-hover">
	        <thead>
	            <tr>
	                <td>번호</td>
	                <td>제목</td>
	                <td>작성자</td>
	                <td>작성일</td>
	            </tr>
	        </thead>
	        <tbody id="sg"></tbody>
	    </table>
		<br>
		<hr>
		<br>
		<h4 id="cntNotice">공지사항 검색결과</h4>
		<br>
		<table border="1" width="80%" class="table table-secondary table-hover">
	        <thead>
	            <tr>
	                <td>번호</td>
	                <td>제목</td>
	                <td>작성일</td>
	            </tr>
	        </thead>
	        <tbody id="notice"></tbody>
	    </table>
	    <br>
	    <hr>
    </div>
    <br>
    <br>
    <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>