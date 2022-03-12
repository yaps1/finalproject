<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<style>
*{
	margin:0;
	padding:0;
}
/*
.container{
	width: 1000px;
	margin: 0 auto;
	padding: 25px;
}
*/
.container h1{
	text-align: left;
	padding: 5px 5px 5px 15px;
	color: #787b7b;
	border-left: 3px solid #787b7b;
	margin-bottom: 20px;
}
/*
.chating{
	background-color: lightgrey;
	width: 750px;
	height: 500px;
	overflow: auto;
}
*/
.chating p{
	color: black;
	text-align: left;
}
input{
	width: 330px;
	height: 25px;
}
#yourMsg{
	display: none;
}
img{
 	width: 100px;
 	height: 100px;
}
</style>
</head>
<script type="text/javascript">
	var ws;
	
	function wsOpen(){
		//웹소켓 전송시 현재 방의 번호를 넘겨서 보냄
		ws = new WebSocket("ws://" + location.host + "/chating/"+$("#room_no").val());
		wsEvt();
	}
		
	function wsEvt() {
		//소켓이 열리면 동작
		ws.onopen = function(data){
			//$("#chating").append("<p>기존  채팅</p>");	
			let room_no = $("#room_no").val();
			$.ajax({
				url: "/listChatMessage",
				data: {room_no:room_no},
				type: 'GET',
				success:function(data){
					$.each(data,function(){
						let member_nickname = this.member_nickname;
						let message = this.message;
						if(message=="null"||message==""||message==null){
							message = "<img class='msgImg' src='images/4989_logo.png' style='margin-left:10px;margin-bottom:10px;margin-right:352px;'>"
							
						}else{
							message = "<input type='text' aria-label='First name' class='form-control' value='"+message+"' readonly='readonly' style='height:40px;width:300px;margin-right:10px;'>"
						}
						let time = this.time;
					
						let div = $("<div class='input-group'></div>");
						$(div).append("<span class='input-group-text' style='width:100px;margin-right:10px;height:40px;'>"+member_nickname+"</span>");
						$(div).append(message);
						$(div).append("<input type='text' aria-label='Last name' class='form-control' value='"+time+"' readonly='readonly' style='height:40px;'>");
		            	$("#chating").append(div);
					});
				}
			});
			
		}
		
		ws.onmessage = function(data) {
			//메시지를 받으면 동작
			var msg = data.data;
			if(msg != null && msg.type != ''){
				//파일 업로드가 아닌 경우 메시지 띄우기
				var d = JSON.parse(msg);
				if(d.type == "getId"){
					var si = d.sessionId != null ? d.sessionId : "";
					if(si != ''){
						$("#sessionId").val(si); 
					}
				}else if(d.type == "message"){
					let member_nickname = $("#member_nickname").val();
					if(d.sessionId == $("#sessionId").val()){
						//$("#chating").append("<p class='me'>나 :" + d.msg + "</p>");
						let div = $("<div class='input-group'></div>");
						$(div).append("<span class='input-group-text' style='width:100px;margin-right:10px;'>"+member_nickname+"</span>");
						$(div).append("<input type='text' aria-label='First name' class='form-control' value='"+d.msg+"' readonly='readonly' style='height:40px;width:300px;margin-right:10px;'>");
						$(div).append("<input type='text' aria-label='Last name' class='form-control' readonly='readonly' style='height:40px;'>");
		            	$("#chating").append(div);
					}else{
						//$("#chating").append("<p class='others'>" + d.userName + " :" + d.msg + "</p>");
						let div = $("<div class='input-group'></div>");
						$(div).append("<span class='input-group-text' style='width:100px;margin-right:10px;'>"+d.userName+"</span>");
						$(div).append("<input type='text' aria-label='First name' class='form-control' value='"+d.msg+"' readonly='readonly' style='height:40px;width:300px;margin-right:10px;'>");
						$(div).append("<input type='text' aria-label='Last name' class='form-control' readonly='readonly' style='height:40px;'>");
		            	$("#chating").append(div);
					}
						
				}else{
					console.warn("unknown type!")
				}
			}else{
				//파일 업로드한 경우 업로드한 파일 띄우기
				let member_nickname = $("#member_nickname").val();
				var url = URL.createObjectURL(new Blob([msg]));
				//$("#chating").append("<p class='me'>나 :</p>");
				let div = $("<div class='input-group'></div>");
				$(div).append("<span class='input-group-text' style='width:100px;margin-right:10px;'>"+member_nickname+"</span>");
				$("#chating").append(div);
				$("#chating").append("<div class='img'><img class='msgImg' src="+url+" style='margin-left:120px;margin-bottom:10px;'></div><div class='clearBoth'></div>");
			}
		}


		document.addEventListener("keypress", function(e){
			if(e.keyCode == 13){ //enter press
				send();
			}
		});
	}

	function startChat(){
		var member_nickname = $("#member_nickname").val();
		wsOpen();
		$("#yourName").hide();
		$("#yourMsg").show();
	}

	function send() {
		let message = $("#message").val();
		if(message == null || message == undefined || message == ""){ alert('메시지를 입력해주세요.'); $('#message').focus(); return false;}
		var option ={
			type: "message",
			room_no: $("#room_no").val(),
			sessionId : $("#sessionId").val(),
			userName : $("#member_nickname").val(),
			msg : $("#message").val()
		}
		ws.send(JSON.stringify(option))
		$('#message').val("");
		
		let data ={
			message: message,
			member_no: $("#member_no").val(),
			room_no: $("#room_no").val()
		}
		//db 저장
		$.ajax({
	    	type: 'POST',
	    	url: "/insertChatMessage",
	    	data:data,
	        success:function(data){
	            //alert("ok");
	    }});
	}
	
	function fileSend(){
		let fileUpload = $("#fileUpload").val();
		if(fileUpload == null || fileUpload == undefined || fileUpload == ""){ alert('파일을 선택해주세요'); $('#fileUpload').focus(); return false;}
		var file = document.querySelector("#fileUpload").files[0];
		var fileReader = new FileReader();
		fileReader.onload = function() {
			var param = {
				type: "fileUpload",
				file: file,
				room_no: $("#room_no").val(),
				sessionId : $("#sessionId").val(),
				msg : $("#message").val(),
				userName : $("#member_nickname").val()
			}
			ws.send(JSON.stringify(param)); //파일 보내기전 메시지를 보내서 파일을 보냄을 명시

		    arrayBuffer = this.result;
			ws.send(arrayBuffer); //파일 소켓 전송
		};
		fileReader.readAsArrayBuffer(file);
		
		let data ={
				member_no: $("#member_no").val(),
				room_no: $("#room_no").val()
			}
		
		//db 저장
		setTimeout(function(){
			$.ajax({
		    	type: 'POST',
		    	url: "/insertChatImage",
		    	data:data,
		        success:function(data){
		   
		    }});
		},1000);
		
	}
</script>
<body>
	<jsp:include page="header2.jsp"></jsp:include>
	<input type="hidden" name="member_no" id="member_no" value="${m.member_no }">
	<input type="hidden" name="dir" id="dir" value="${dir }">
	<div id="container" class="container" style="width: 1000px;margin: 0 auto;padding: 25px;">
		<button class="btn btn-outline-secondary" onclick="location.href='room'">채팅방 목록</button>
		<br>
		<br>
		<h1><strong>${room_name}</strong>번 채팅방 </h1>
		<input type="hidden" id="sessionId" value="">
		<input type="hidden" name="room_no" id="room_no" value="${room_no}">
		
		<div id="chating" class="chating" style="margin-bottom: 10px;background-color: lightgrey;width: 750px;height: 500px;overflow: auto;">
		</div>
		
		<div id="yourName">
			<table class="inputTable" style="margin-left:120px;">
				<tr>
					<th>&nbsp;&nbsp;&nbsp;&nbsp;채팅에 참여하시겠습니까?</th>
					<th><input type="text" class="form-control me-2" name="member_nickname" id="member_nickname" value="${m.member_nickname }" readonly="readonly" style="width: 100px;margin-left: 40px;height: 35px;text-align: center;"></th>
					<th><button onclick="startChat()" id="startBtn" class="btn btn-outline-secondary" style="margin-left: 30px;">참여</button></th>
				</tr>
			</table>
		</div>
		<div id="yourMsg" >
			<table class="inputTable" style="height: 100px;">
				<tr>
					<th><input id="message" placeholder="메시지를 입력하세요." class="form-control me-2" style="height: 35px;width: 500px;"></th>
					<th><button onclick="send()" id="sendBtn" class="btn btn-outline-secondary" style="margin-left: 40px;">보내기</button></th>
				</tr>
				<tr>
					<th><input type="file" id="fileUpload" class="btn btn-outline-secondary" style="height: 45px;width: 500px;"></th>
					<th><button onclick="fileSend()" id="sendFileBtn" style="margin-left: 40px;" class="btn btn-outline-secondary">업로드</button></th>
				</tr>
			</table>
		</div>
	</div>
	<br>
	<br>
	<br>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>