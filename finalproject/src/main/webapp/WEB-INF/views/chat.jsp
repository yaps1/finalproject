<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
*{
	margin:0;
	padding:0;
}
.container{
	width: 500px;
	margin: 0 auto;
	padding: 25px
}
.container h1{
	text-align: left;
	padding: 5px 5px 5px 15px;
	color: #FFBB00;
	border-left: 3px solid #FFBB00;
	margin-bottom: 20px;
}
.chating{
	background-color: lightgrey;
	width: 500px;
	height: 500px;
	overflow: auto;
}
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
						
						$("#chating").append("<p>"+ member_nickname +" : " + message + "</p>");
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
					if(d.sessionId == $("#sessionId").val()){
						$("#chating").append("<p class='me'>나 :" + d.msg + "</p>");	
					}else{
						$("#chating").append("<p class='others'>" + d.userName + " :" + d.msg + "</p>");
					}
						
				}else{
					console.warn("unknown type!")
				}
			}else{
				//파일 업로드한 경우 업로드한 파일 띄우기
				var url = URL.createObjectURL(new Blob([msg]));
				$("#chating").append("<p class='me'>나 :</p>");	
				$("#chating").append("<div class='img'><img class='msgImg' src="+url+"></div><div class='clearBoth'></div>");
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
	<input type="hidden" name="member_no" id="member_no" value="${m.member_no }">
	<div id="container" class="container">
		<h1>4989채팅 NO.${room_name} </h1>
		<input type="hidden" id="sessionId" value="">
		<input type="hidden" name="room_no" id="room_no" value="${room_no}">
		
		<div id="chating" class="chating">
		
		</div>
		
		<div id="yourName">
			<table class="inputTable">
				<tr>
					<th>사용자명</th>
					<th><input type="text" name="member_nickname" id="member_nickname" value="${m.member_nickname }" readonly="readonly"></th>
					<th><button onclick="startChat()" id="startBtn">참여</button></th>
				</tr>
			</table>
		</div>
		<div id="yourMsg">
			<table class="inputTable">
				<tr>
					<th>메시지</th>
					<th><input id="message" placeholder="보내실 메시지를 입력하세요."></th>
					<th><button onclick="send()" id="sendBtn">보내기</button></th>
				</tr>
				<tr>
					<th>파일업로드</th>
					<th><input type="file" id="fileUpload"></th>
					<th><button onclick="fileSend()" id="sendFileBtn">파일올리기</button></th>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>