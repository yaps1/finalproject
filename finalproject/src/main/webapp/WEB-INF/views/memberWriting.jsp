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
	width: 1000px;
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
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function(){
		let member_no = $("#member_no").val();
		
		function content() {
			$.ajax({
		    	type: 'GET',
		    	url: "/listGBByMember",
		    	data:{member_no:member_no},
		        success:function(data){
		            $.each(data,function(){
		            	let state="진행중";
		            	if(this.gb_state==0){
		            		state = "공구 종료"
		            	}
		                let tr = $("<tr id='gb_tr'></tr>").attr("gb_no",this.gb_no);
		                $(tr).append($("<td></td>").html(this.gb_no));
		                $(tr).append($("<td></td>").html(state));
		                $(tr).append($("<td></td>").html(this.gb_title));
		                $("#gb").append(tr);
		            });
		    }});
			
			$(document).on("click","#gb_tr",function(){
	            let gb_no = $(this).attr("gb_no");
	            location.href = "detailGB?gb_no="+gb_no;
	        });
			
			$.ajax({
		    	type: 'GET',
		    	url: "/listSGByMember",
		    	data:{member_no:member_no},
		        success:function(data){
		            $.each(data,function(){
		            	let tr = $("<tr id='sg_tr'></tr>").attr("sg_no",this.sg_no);
		                $(tr).append($("<td></td>").html(this.sg_no));
		                $(tr).append($("<td></td>").html(this.sg_title));
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
		    	url: "/cntMemberGB",
		        data: {member_no:member_no},
		        success:function(data){
		        	$("#cntGB").append("<h4><h4>").html("공동구매("+data+"건)");
		    }});
			
			$.ajax({
		    	type: 'GET',
		    	url: "/cntMemberSG",
		        data: {member_no:member_no},
		        success:function(data){
		        	$("#cntSG").append("<h4><h4>").html("커뮤니티 소모임("+data+"건)");
		    }});
			
			$.ajax({
		    	type: 'GET',
		    	url: "/cntMemberWriting",
		        data: {member_no:member_no},
		        success:function(data){
		        	 $("#cntWriting").append("<h4><h4>").html("작성한 게시글("+data+"건)");
		    }});
		};
		
		content();
		
		$("#content").click(function(){
			$("#gb").empty();
			$("#sg").empty();
			
			var tab_id = $(this).attr('data-tab');
	
			$('ul.tabs li').removeClass('current');
			$('.tab-content').removeClass('current');
	
			$(this).addClass('current');
			$("#"+tab_id).addClass('current');

			content();
		});
		
		$("#comment").click(function(){
			$("#gbc").empty();
			$("#sgc").empty();
			var tab_id = $(this).attr('data-tab');
	
			$('ul.tabs li').removeClass('current');
			$('.tab-content').removeClass('current');
	
			$(this).addClass('current');
			$("#"+tab_id).addClass('current');
			
			$.ajax({
		    	type: 'GET',
		    	url: "/listGBCByMember",
		    	data:{member_no:member_no},
		        success:function(data){
		            $.each(data,function(){
		            	let tr = $("<tr id='gbc_tr'></tr>").attr("gb_no",this.gb_no);
		                $(tr).append($("<td></td>").html(this.gb_comment));
		                $(tr).append($("<td></td>").html(this.gb_comment_date));
		                $("#gbc").append(tr);
		            });
		    }});
			
			$(document).on("click","#gbc_tr",function(){
	            let gb_no = $(this).attr("gb_no");
	            location.href = "detailGB?gb_no="+gb_no;
	        });
			
			$.ajax({
		    	type: 'GET',
		    	url: "/listSGCByMember",
		    	data:{member_no:member_no},
		        success:function(data){
		            $.each(data,function(){
		            	let tr = $("<tr id='sgc_tr'></tr>").attr("sg_no",this.sg_no);
		                $(tr).append($("<td></td>").html(this.sg_comment));
		                $(tr).append($("<td></td>").html(this.sg_comment_date));
		                $("#sgc").append(tr);
		            });
		    }});
			
			$(document).on("click","#sgc_tr",function(){
	            let sg_no = $(this).attr("sg_no");
	            location.href = "getSG?sg_no="+sg_no;
	        });
			
			$.ajax({
		    	type: 'GET',
		    	url: "/cntMemberGBC",
		        data: {member_no:member_no},
		        success:function(data){
		        	$("#cntGBC").append("<h5><h5>").html("공동구매("+data+"건)");
		    }});
			
			$.ajax({
		    	type: 'GET',
		    	url: "/cntMemberSGC",
		        data: {member_no:member_no},
		        success:function(data){
		        	$("#cntSGC").append("<h5><h5>").html("소모임("+data+"건)");
		    }});
			
			$.ajax({
		    	type: 'GET',
		    	url: "/cntMemberComment",
		        data: {member_no:member_no},
		        success:function(data){
		        	 $("#cntComment").append("<h4><h4>").html("작성한 댓글("+data+"건)");
		    }});
		});
		
		$("#review").click(function(){
			$("#goodsreview").empty();
			$("#restreview").empty();
			var tab_id = $(this).attr('data-tab');
	
			$('ul.tabs li').removeClass('current');
			$('.tab-content').removeClass('current');
	
			$(this).addClass('current');
			$("#"+tab_id).addClass('current');
			
			$.ajax({
		    	type: 'GET',
		    	url: "/listGRByMember",
		    	data:{member_no:member_no},
		        success:function(data){
		            $.each(data,function(){
		            	let tr = $("<tr id='gr_tr'></tr>").attr("goods_no",this.goods_no);
		                $(tr).append($("<td></td>").html(this.goods_score));
		                $(tr).append($("<td></td>").html(this.goods_review));
		                $("#goodsreview").append(tr);
		            });
		    }});
			
			$(document).on("click","#gr_tr",function(){
	            let goods_no = $(this).attr("goods_no");
	            location.href = "getGoods?goods_no="+goods_no;
	        });
			
			$.ajax({
		    	type: 'GET',
		    	url: "/listRRByMember",
		    	data:{member_no:member_no},
		        success:function(data){
		            $.each(data,function(){
		            	let tr = $("<tr id='rr_tr'></tr>").attr("rest_no",this.rest_no);
		                $(tr).append($("<td></td>").html(this.rest_score));
		                $(tr).append($("<td></td>").html(this.rest_review_content));
		                $("#restreview").append(tr);
		            });
		    }});
			
			$(document).on("click","#rr_tr",function(){
	            let rest_no = $(this).attr("rest_no");
	            location.href = "getRestInfo?rest_no="+rest_no;
	        });
			
			$.ajax({
		    	type: 'GET',
		    	url: "/cntMemberGR",
		        data: {member_no:member_no},
		        success:function(data){
		        	$("#cntGoodsReview").append("<h5><h5>").html("중고거래("+data+"건)");
		    }});
			
			$.ajax({
		    	type: 'GET',
		    	url: "/cntMemberRR",
		        data: {member_no:member_no},
		        success:function(data){
		        	$("#cntRestReview").append("<h5><h5>").html("커뮤니티 맛집공유("+data+"건)");
		    }});
			
			$.ajax({
		    	type: 'GET',
		    	url: "/cntMemberReview",
		        data: {member_no:member_no},
		        success:function(data){
		        	 $("#cntReview").append("<h4><h4>").html("작성한 후기("+data+"건)");
		    }});
		});
		
		$("#qna").click(function(){
			$("#listQna").empty();

			var tab_id = $(this).attr('data-tab');
	
			$('ul.tabs li').removeClass('current');
			$('.tab-content').removeClass('current');
	
			$(this).addClass('current');
			$("#"+tab_id).addClass('current');
			
			$.ajax({
		    	type: 'GET',
		    	url: "/listQnaByMember",
		    	async:false,
		    	data:{member_no:member_no},
		        success:function(data){
		            $.each(data,function(){
		            	let process = "답변대기";
		            	if(this.qna_process==1){
		            		process = "답변완료";
		            	}
		            	let type ="기타 문의사항";
		            	if(this.qna_type == 1){
		            		type="비매너 회원 신고";
		            	}
		            	let tr = $("<tr></tr>");
		                $(tr).append($("<td></td>").html(this.qna_title));
		                $(tr).append($("<td></td>").html(this.qna_content));
		                $(tr).append($("<td></td>").html(process));
		                let td = $("<td></td>");
		                let input = $("<input type='button' value='확인' data-toggle='modal' data-target='#qnaModal' id='btn'>").attr("qna_no",this.qna_no);
		                $(td).append(input);
		                $(tr).append(td);
		                $("#listQna").append(tr);
		            });
		    }});
			
			$(document).on("click","#btn",function(){
	           let qna_no = $(this).attr("qna_no");
	           $.ajax({
			    	type: 'GET',
			    	url: "/getQna",
			    	data:{qna_no:qna_no},
			        success:function(data){
			        	let type ="기타 문의사항";
		            	if(data.qna_type == 1){
		            		type="비매너 회원 신고";
		            	}
			            $("#qna_title").val(data.qna_title);
			            $("#qna_content").val(data.qna_content);
			            $("#qna_comment").val(data.qna_comment);
			            $("#type").val(type);
			    }});
	        });
			
			$.ajax({
		    	type: 'GET',
		    	url: "/cntQna",
		        data: {member_no:member_no},
		        success:function(data){
		        	 $("#cntQna").append("<h4><h4>").html("작성한 문의사항("+data+"건)");
		    }});
		});
	
	});
</script>
</head>
<body>
<input type="hidden" value="${m.member_no }" id="member_no">
<div class="container">
	<ul class="tabs">
		<li class="tab-link current" data-tab="tab-1" id="content">작성한 게시물</li>
		<li class="tab-link" data-tab="tab-2" id="comment">작성한 댓글</li>
		<li class="tab-link" data-tab="tab-3" id="review">작성한 후기</li>
		<li class="tab-link" data-tab="tab-4" id="qna">작성한 문의사항</li>
	</ul>

	<div id="tab-1" class="tab-content current">
		<br>
		<h4 id="cntWriting">작성한 게시글</h4>
		<hr>
		<h5 id="cntGB">공동구매</h5>
		<table border="1" width="80%">
	        <thead>
	            <tr>
	                <td>번호</td>
	                <td>진행상태</td>
	                <td>제목</td>
	            </tr>
	        </thead>
	        <tbody id="gb"></tbody>
	    </table>
	    <br>
	    <h5 id="cntSG">커뮤니티 소모임</h5>
		<table border="1" width="80%">
	        <thead>
	            <tr>
	                <td>번호</td>
	                <td>제목</td>
	                <td>작성일</td>
	            </tr>
	        </thead>
	        <tbody id="sg"></tbody>
	    </table>	
	</div>
	
	<div id="tab-2" class="tab-content">
		<br>
		<h4 id="cntComment">작성한 댓글</h4>
		<hr>
		<h5 id="cntGBC">공동구매</h5>
		<table border="1" width="80%">
	        <thead>
	            <tr>
	                <td>내용</td>
	                <td>작성일</td>
	            </tr>
	        </thead>
	        <tbody id="gbc"></tbody>
	    </table>
	    <br>
	    <h5 id="cntSGC">커뮤니티 소모임</h5>
		<table border="1" width="80%">
	        <thead>
	            <tr>
	                <td>내용</td>
	                <td>작성일</td>
	            </tr>
	        </thead>
	        <tbody id="sgc"></tbody>
	    </table>
	</div>
	<div id="tab-3" class="tab-content">
		<br>
		<h4 id="cntReview">작성한 후기</h4>
		<hr>
		<h5 id="cntGoodsReview">중고거래</h5>
		<table border="1" width="80%">
	        <thead>
	            <tr>
	                <td>별점</td>
	                <td>후기</td>
	            </tr>
	        </thead>
	        <tbody id="goodsreview"></tbody>
	    </table>
	    <br>
	    <h5 id="cntRestReview">커뮤니티 맛집공유</h5>
		<table border="1" width="80%">
	        <thead>
	            <tr>
	                <td>별점</td>
	                <td>후기</td>
	            </tr>
	        </thead>
	        <tbody id="restreview"></tbody>
	    </table>
	</div>
	<div id="tab-4" class="tab-content">
		<br>
		<h4 id="cntQna">작성한 문의사항</h4>
		<hr>
		<table border="1" width="100%">
	        <thead>
	            <tr>
	                <td>제목</td>
	                <td>내용</td>
	                <td>진행상황</td>
	                <td>확인</td>
	            </tr>
	        </thead>
	        <tbody id="listQna"></tbody>
	    </table>
	</div>
	
	<div class="modal fade" id="qnaModal" data-backdrop="static">
    <div class="modal-dialog modal-lg modal-dialog-centered modal-dialog-scrollable">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title"><strong>문의사항</strong></h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
       		분류 <input type='text' readonly='readonly' id="type"><br>
     		제목<br> 
     		<textarea style='width:80%' readonly='readonly' id="qna_title"></textarea><br>
     		문의 내용<br>
     		<textarea style='width:80%' readonly='readonly' id="qna_content"></textarea><br>
     		<hr>
     		답변<br>
     		<textarea style='width:80%' readonly='readonly' id="qna_comment"></textarea>
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
        </div>
        
	      </div>
	    </div>
	</div>
</div>

</body>
</html>