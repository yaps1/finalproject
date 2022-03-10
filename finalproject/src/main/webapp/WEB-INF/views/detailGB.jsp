<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("replaceChar","\n"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style type="text/css">
.container {
	background-color : #EAEAEA;
	width: 60%;
	border-radius: 5px; 5px;
}
.top{
	background-color : white;
	width:800px;
	margin: auto;
	padding: 5px;
	border-radius: 5px; 5px;
}
#carouselExampleIndicators{
	border-radius: 5px; 5px;
	width:80%;
	height: 500px;
	margin: auto;
	text-align: center;
}
img{
	max-height: 500px;
}
.middle{
	width: 500px;
	height: 200px;
	margin: auto;	
	text-align: center;
}
.content{
	border-radius: 5px; 5px;
	width: 800px;
	margin: auto;
	padding:10px;
	text-align: center;
	background-color: white;
}
.comment{
	width: 800px;
	margin: auto;
	padding:10px;
	text-align: center;
}
a{
	text-decoration-line : none;
}
table{
	width: 800px;
	margin: auto;
	padding:10px;
}
#joinGBModal{
	text-align: center;
}
.btn_group{
	float: right;
}
</style>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function () {
	let member_no = $("#member_no").val();
	let member_no_writer = $("#member_no_writer").val();
	
	$(function () {
		if(member_no == member_no_writer){
			$("#btn_update").css("display","inline-block");
			$("#btn_delete").css("display","inline-block");
		}
	});
	
	let gbj_no = $("#gbj_no").val();
	let gb_no = $("#gb_no").val();
	$("#joinGB").click(function name() {
		$.ajax({
  			url:"/insertGBJ",
  			type:"POST",
  			data:$("#f").serializeArray(),
  			success:function(data){
  				$("#joinGBModal").hide();
  				$('.modal-backdrop').hide();
  			}
  		});
		
	});
	
	$.ajax({
		url:"/listGBC",
		type:"GET",
		data:{gb_no:gb_no},
		success:function(data){
			$.each(data,function(){
				//let member_no = $("#member_no").val();
				let gb_level = this.gb_level;
				let gb_comment_date;
				let gb_comment;
				let member_nickname;
				let member_no_comment = this.member_no;
				let gb_comment_no = this.gb_comment_no;
				let display;
				
				if(member_no==member_no_comment){
					display = "inline-block";
				}else{
					display = "none";
				}
				
				if(gb_level>0){
					for(i=0;i<gb_level;i++){
						gb_comment_date = "&nbsp;&nbsp;&nbsp;&nbsp;";
						gb_comment = "&nbsp;&nbsp;&nbsp;&nbsp;";
						member_nickname = "&nbsp;&nbsp;&nbsp;&nbsp;";
						if(i=gb_level){
							gb_comment_date = "&nbsp;&nbsp;&nbsp;&nbsp;" +"<img src='images/re.png' id='re'>" +this.gb_comment_date;
							gb_comment = "&nbsp;&nbsp;&nbsp;&nbsp;" + this.gb_comment;
							member_nickname = "&nbsp;&nbsp;&nbsp;&nbsp;" + this.member_nickname;
						}
					}
				}else{
					gb_comment_date = this.gb_comment_date;
					gb_comment= this.gb_comment;
					member_nickname = this.member_nickname;
				}			    
			    let tr = $("<tr id='gbc_tr'></tr>").attr({"gb_ref":this.gb_ref,"gb_level":this.gb_level,"gb_step":this.gb_step,"member_nickname":this.member_nickname});
		        $(tr).append($("<td></td>").html(gb_comment_date));
		        $(tr).append($("<td></td>").html(gb_comment));
		        $(tr).append($("<td></td>").html(member_nickname));
		        $(tr).append($("<td></td>").html("<button gb_comment_no="+gb_comment_no+" style='display: "+display+";' onclick='deleteComment("+gb_comment_no+")' class='btn btn-outline-secondary'>삭제</button>"));
		        $("#listgbc").append(tr);
			});
		}
	});
	
	$(document).on("click","#gbc_tr",function(){
		let gb_ref = $(this).attr("gb_ref");
		let gb_level = $(this).attr("gb_level");
		let gb_step = $(this).attr("gb_step");
		let member_nickname = $(this).attr("member_nickname");
		$("#gb_ref").val(gb_ref);
		$("#gb_level").val(gb_level*1 +1);
		$("#gb_step").val(gb_step*1 +1);
		$("#member_nickname").val(member_nickname+"님에 대한 답글");
    });
	
	$("#btn_gbc").click(function() {
		let gb_no = $("#gb_no").val();
		$.ajax({
  			url:"/insertGBC",
  			type:"POST",
  			data:$("#insertGBC").serializeArray(),
  			success:function(data){
  				location.href="detailGB?gb_no="+gb_no;
  			}
  		});
	});
	
	$(document).on("click","#nickname_reset",function(){
		$("#member_nickname").val("");
    });
	
	//공동구매 게시글 삭제
	$("#btn_delete").click(function() {
		if (confirm("공동구매 게시글을 정말 삭제하시겠습니까??") == true){    
			let gb_no = $("#gb_no").val();
			$.ajax({
	  			url:"/deleteGB",
	  			type:"POST",
	  			data:{gb_no:gb_no},
	  			success:function(data){
	  				location.href="/listGB";
	  			}
	  		});
		 }else{   
		     return false;
		 }	
	});
	
	$("#btn_update").click(function() {
		let gb_no = $("#gb_no").val();
		location.href="/updateGB?gb_no="+gb_no;
	});
	
});

//댓글 삭제
function deleteComment(n) {
	let gb_no = $("#gb_no").val();
	if (confirm("댓글을 정말 삭제하시겠습니까??") == true){  
		$.ajax({
  			url:"/deleteGBC",
  			type:"POST",	
  			data:{gb_comment_no:n},
  			success:function(data){
  				location.href="/detailGB?gb_no="+gb_no;
  			}
  		});
	 }else{   
	     return false;
	 }
}
</script>
</head>
<body>
	<input type="hidden" value="${m.member_no }" id="member_no">
	<input type="hidden" value="${g.member_no }" id="member_no_writer">
	<br>
	<br>
	<h2 style="text-align : center;"><strong>공동구매 상세</strong></h2>
	<br>
	<!-- 네비게이션바 -->
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
	  <div class="container-fluid" style="text-align : center; width: 60%">
	   
	    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
	      <li class="nav-item">
	       <a class="navbar-brand" href="/listGB">목록</a>
	      </li>
	      <li class="nav-item">
	       <a class="navbar-brand" href="/insertGB">등록</a>
	      </li>
	    </ul>
	  </div>
	</nav>
	<br>
	<br>
	<div class="container">
	<br>
	<!-- 상단 바 -->
	<div class="top">
	<span style="color: red; font-weight: bold; font-size: 1.5em">
    <c:if test="${g.gb_state==1}">&nbsp;진행중</c:if>
	<c:if test="${g.gb_state==0}">&nbsp;공구 종료</c:if>
	</span>
	&nbsp;&nbsp;${g.gb_start_date } ~ ${g.gb_end_date }
	<div class="btn_group">
	<button id="btn_update" class="btn btn-outline-secondary" style="display: none;">수정</button>
	<button id="btn_delete" class="btn btn-outline-secondary" style="display: none;">삭제</button>
	</div>
	</div>
	<br>
	<div>
	<!-- 이미지 -->
	<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
	  <div class="carousel-indicators">
	    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
	    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
	    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
	  </div>
	  <div class="carousel-inner">
	    <div class="carousel-item active">
	      <img src="../images/${gbd.gb_image1}" class="d-block w-100" alt="...">
	    </div>
	    <div class="carousel-item">
	      <c:if test="${empty gbd.gb_image2}"><img src="../images/gb4989.png" class="d-block w-100"></c:if>
	      <c:if test="${not empty gbd.gb_image2}"><img src="../images/${gbd.gb_image2}" class="d-block w-100"></c:if>
	    </div>
	    <div class="carousel-item">
	      <c:if test="${empty gbd.gb_image3}"><img src="../images/gb4989.png" class="d-block w-100" ></c:if>
	      <c:if test="${not empty gbd.gb_image3}"><img src="../images/${gbd.gb_image3}" class="d-block w-100"></c:if>
	    </div>
	  </div>
	  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
	    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
	    <span class="visually-hidden">Previous</span>
	  </button>
	  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
	    <span class="carousel-control-next-icon" aria-hidden="true"></span>
	    <span class="visually-hidden">Next</span>
	  </button>
	</div>
	
	<!-- 제목/가격/인원/ -->
	</div>
	<br>
	<div class="middle">
	<br>
	<h3><strong>${g.gb_title }</strong></h3>
	<h5><strong>${gbd.gb_price } 원</strong></h5>
	<p><span id="joinNum">${joinNum }</span> / <span id="gb_capacity">${g.gb_capacity }</span></p>
	<input class="btn btn-warning" type="button" value="참여하기" data-toggle="modal" data-target="#joinGBModal" id="btnjoin">
	</div>
	<br>
	
	<div class="content">
	<span>작성자 <strong>${gbd.member_nickname }</strong></span><br>
	${fn:replace(gbd.gb_content,replaceChar,"<br/>") }
	</div>
	
	<br>
	<br>
	
	<!-- 댓글 -->
	<div class="comment">
	<h5><strong>문의사항 댓글</strong></h5>
	</div>
	<br>
	<table border="1"  class="table table-hover">
	<!-- 
        <thead>
            <tr>
                <td>날짜</td>
                <td>댓글</td>
                <td>작성자</td>
            </tr>
        </thead>
         -->
        <tbody id="listgbc"></tbody>
    </table>
    <br>
    <form id="insertGBC">
    	<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
    	<!-- 
    	<input type="hidden" id="gb_comment_no" name="gb_comment_no" value="${gb_comment_no }">
    	 -->
    	<input type="hidden" value="${g.gb_no}" id="gb_no" name="gb_no">
    	<input type="hidden" value="${m.member_no}" id="member_no" name="member_no">
    	<input type="hidden" id="gb_ref" name="gb_ref" value="0">
    	<input type="hidden" id="gb_level" name="gb_level" value="0">
    	<input type="hidden" id="gb_step" name="gb_step" value="0">
    	<div class="input-group">
    	<input type="text" aria-label="First name" class="form-control" id="member_nickname" readonly="readonly">
	    <input type="text" aria-label="Last name" class="form-control" id="gb_comment" name="gb_comment">
    	<input type="button" value="등록" id="btn_gbc" class="btn btn-outline-secondary">
    	<input type="button" value="취소" id="nickname_reset" class="btn btn-outline-secondary">
    	</div>
    </form>
    
    
   <form id="f" >
	   <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
	   <input type="hidden" value="${gbj_no}" id="gbj_no" name="gbj_no">
	   <input type="hidden" value="${g.gb_no}" id="gb_no" name="gb_no">
	   <input type="hidden" value="${m.member_no}" id="member_no" name="member_no">
   </form>
   
   <br>
   <br>
   
   <!-- 공동구매 참여 모달 -->
   <div class="modal fade" id="joinGBModal" data-backdrop="static">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
      <div class="modal-content">
        <!-- Modal body -->
        <div class="modal-body">
        	<div>
       		<h4><strong>참여신청을 하시겠습니까?</strong></h4>
       		<strong>(작성자 수락시 신청완료)</strong><br>
       		</div>
       		<br>
       		<button type="button" class="btn btn-primary" id="joinGB">신청</button>
        	<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
        </div>
	      </div>
	    </div>
	</div>
	</div>
	<br>
	<br>
	<br>
	<br>
</body>
</html>