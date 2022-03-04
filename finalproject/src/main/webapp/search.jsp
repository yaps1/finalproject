<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function () {
	$("#search").click(function() {
		let searchkeyword = $("#searchkeyword").val();
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
	            	let tr = $("<tr id='g_tr'></tr>").attr("goods_no",this.goods_no);
	                $(tr).append($("<td></td>").html(this.goods_image1));
	                $(tr).append($("<td></td>").html(this.goods_name));
	                $(tr).append($("<td></td>").html(this.goods_price));
	                $(tr).append($("<td></td>").html(this.goods_addr));
	                $("#goods").append(tr);
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
            location.href = "getNoticeByNoticeNo?notice_no="+notice_no;
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
	        
	});
});
</script>
</head>
<body>
	<br>
	
	<nav class="navbar navbar-light bg-light">
	  <div class="container-fluid">
	    <form class="d-flex" name="search-form" autocomplete="off">
	      <input style="width: 10rem;height: 3rem;" class="form-control me-2" type="text" placeholder="Search" aria-label="Search"  name="searchkeyword" id="searchkeyword" value="">
	      <input style="width: 5rem;height: 3rem;" type="button" id="search" value="검색" class="btn btn-outline-success">
	    </form>
	  </div>
	</nav>
	<br>
	<h2 style="text-align : center;" id="cntTotal"><strong>통합검색 검색결과</strong></h2>
	
	<br>
	<hr>
	<h4 id="cntGoods">중고거래 검색결과</h4>
	<table border="1" width="80%">
        <thead>
            <tr>
                <td>사진</td>
                <td>상품명</td>
                <td>가격</td>
                <td>지역</td>
            </tr>
        </thead>
        <tbody id="goods"></tbody>
    </table>

	<hr>
	<h4 id="cntGB">공동구매 검색결과</h4>
	<table border="1" width="80%">
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
    
	<hr>
	<h4 id="cntSG">커뮤니티 소모임 검색결과</h4>
	<table border="1" width="80%">
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
	
	<hr>
	<h4 id="cntNotice">공지사항 검색결과</h4>
	<table border="1" width="80%">
        <thead>
            <tr>
                <td>번호</td>
                <td>제목</td>
                <td>작성일</td>
            </tr>
        </thead>
        <tbody id="notice"></tbody>
    </table>
</body>
</html>