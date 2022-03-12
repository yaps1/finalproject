<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$('ul.tabs li').click(function(){
			var tab_id = $(this).attr('data-tab');
		
			$('ul.tabs li').removeClass('current');
			$('.tab-content').removeClass('current');
		
			$(this).addClass('current');
			$("#"+tab_id).addClass('current');
		});
	});
	
	//알람 함수 2초마다 동작함
	function alarmList(){
	let member_no = $("#member_no").val();
	//alert(member_no);
	
	//타이머................ 
	timer = setInterval( function () {
	$("#alarm-box").empty();
	$.ajax({
		url:"saguPalguAlarm",
		data:{
			member_no:member_no
		},
		type:"get",
		success:function(data){
			$.each(data,function(index,item){
				//console.log(item.member_nickname);
				
				let li = $("<li></li>").addClass("border").css("width","100%").css("background","white").css("border-radius","15px").attr("gbj_no",item.gbj_no).attr("id","gbj_box");
				$(li).append($("<p></p>").addClass("fs-3").addClass("mx-3").addClass("mb-0").addClass("text-secondary").html(item.gb_title).css("text-decoration","underline"));
				$(li).append($("<span></span>").addClass("fs-5").addClass("mx-3").addClass("text-secondary").addClass("fw-bold").html(item.member_nickname));
				$(li).append($("<span></span>").addClass("fs-5").addClass("mx-0").addClass("text-secondary").html("님으로 부터 공동구매 참여신청이 도착했어요!"));
				$(li).append($("<span></span>").addClass("fs-5").addClass("mx-2").addClass("bi bi-bell"));
				
				$("#alarm-box").append(li);
			
			});//each함수 끝	
		}//success끝
	})//ajax끝
	
	}, 2000);
}//함수 끝
	
	
	
	$(function(){
		alarmList();

		//참여신청알림을 누를 경우
		//$(document).on("click",".gbj_val",function(){ 
		$(document).on("click","#gbj_box",function(){ 

			//$(".gbj_val")는 배열
			let gbj_no = $(this).attr("gbj_no");
			//alert(gbj_no);
			$(".modal").fadeIn();
		
			//수락할 경우 ~~~~
			$("#btnOK").click(function(){
				//alert("ok");
				$.ajax({
					url:"updateGBJOk",
					type:"post",
					data:{gbj_no:gbj_no},
					success:function(re){
						alert("공동구매 참여신청을 수락했습니다.");
						$(".modal").fadeOut();
						//alarmList.empty();
						$("#alarm-box").empty();

						alarmList();
					}
				})
			})
			
			//수락을 거절할 경우
			$("#btnNO").click(function(){
				$.ajax({
					url:"updateGBJNo",
					type:"post",
					data:{gbj_no:gbj_no},
					success:function(re){
						alert("공동구매 참여신청을 거절했습니다.");
						$(".modal").fadeOut();
						$("#alarm-box").empty();
						alarmList();
					}
				}) 
				
			})
			
		});
		
		 //모달창 닫기 
		 $(".btn-close").click(function(){
			 $(".modal").fadeOut();
		 });
		
		
	});//function끝
</script>
<style type="text/css">
li{
	list-style: none;
}

ol{
	list-style: none;
}

ul.tabs{
	margin-left: 0px;
	padding: 0px;
	list-style: none;
}
ul.tabs li{
	width:250px;
	height:80px;
	background: none;
	color: #222;
	display: inline-block;
	padding: 25px 10px;
	cursor: pointer;
	border-radius: 15px;
	text-align: center;
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
	padding-bottom: 50px;
}

.tab-content.current{
	display: inherit;
}


</style>
</head>
<body>
<jsp:include page="header2.jsp"></jsp:include>
<input type="hidden" value="${m.member_no }">

<!-- Modal -->
<div class="modal" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" style="padding-top: 300px;">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
    <!-- 닫기 버튼 -->
	  <div class="modal-close bg-secondary bg-gradient border-bottom-1 mb-3">
		<button type="button" class="btn-close bg-light" data-bs-dismiss="modal" aria-label="Close" style="float: right; margin: 10px;"></button>
	  </div> 
      <div class="modal-body fs-3" style="text-align: center;">
        참여신청을 수락하시겠습니까?
      </div>
      <div class="mb-3" style="text-align: center; width: 100%;">
      	<button type="button" id="btnOK" class="btn btn-lg btn-primary" style="padding: 0px 50px; height: 45px;">수락</button>
       	<button type="button" id="btnNO" class="btn btn-lg btn-secondary" style="padding: 0px 50px; height: 45px;" data-dismiss="modal">취소</button>
      </div>
    </div>
  </div>
</div>
<!-- 모달끝 -->




<!-- setInterval(function(){},5000) -->
<div style="padding: 200px; height: 900px;">

	<div class="container">
		<ul class="tabs" style="text-align: center;">
			<li class="tab-link current text-bold" data-tab="tab-1" id="alarm"><strong style="font-size: 20px;">4989알림</strong></li>
			<li class="tab-link text-bold" data-tab="tab-2" id="talk"><strong style="font-size: 20px;">4989톡</strong></li>
		</ul>
		<!-- tab-1시작 -->	
		<div id="tab-1" class="tab-content current" style="width: 80%; margin: 0 auto;">
			<input type="hidden" id="member_no" name="member_no" value="${ m.member_no} ">
			<ol class="p-1 mb-0 pb-3" id="alarm-box"></ol>	
		</div>
		<!-- tab-1끝 -->
		
		
		
		<div id="tab-2" class="tab-content" style="width: 80%; margin: 0 auto; text-align: center; padding-top:40px;">
			<div class="pt-3 pb-3" style="background: white; width: 70%; margin: 0 auto; border-radius: 15px;">
			<a href="room" style="list-style: none; color: inherit; text-decoration: none;"><i class="bi bi-chat-dots-fill display-3">4989톡</i></a>
		    </div>
		    
		</div>
		<!-- tab-2끝 -->
	</div>

</div>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>