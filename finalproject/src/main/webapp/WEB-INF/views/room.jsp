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
.roomContainer{
	background-color: #F6F6F6;
	width: 500px;
	height: 500px;
	overflow: auto;
}
.roomList{
	border: none;
}
.roomList th{
	border: 1px solid #FFBB00;
	background-color: #fff;
	color: #FFBB00;
}
.roomList td{
	border: 1px solid #FFBB00;
	background-color: #fff;
	text-align: left;
	color: #FFBB00;
}
.roomList .num{
	width: 75px;
	text-align: center;
}
.roomList .room{
	width: 350px;
}
.roomList .go{
	width: 71px;
	text-align: center;
}
button{
	background-color: #FFBB00;
	font-size: 14px;
	color: #000;
	border: 1px solid #000;
	border-radius: 5px;
	padding: 3px;
	margin: 3px;
}
.inputTable th{
	padding: 5px;
}
.inputTable input{
	width: 330px;
	height: 25px;
}
</style>
</head>
<script type="text/javascript">
	
	var ws;
	window.onload = function(){
		let member = $("#member_no").val();
		//alert(member)
		getRoom(member);
		createRoom();
	}

	function getRoom(member){
		let member_no = member;
		commonAjax('/getRoom', {member_no:member_no}, 'post', function(result){
			createChatingRoom(result);
		});
	}
	
	function createRoom(){
		$("#createRoom").click(function(){
			var msg = {	roomName : $('#roomName').val()	};

			commonAjax('/createRoom', msg, 'post', function(result){
				createChatingRoom(result);
			});

			$("#roomName").val("");
		});
	}

	function goRoom(number, name){
		let member_no = $("#member_no").val();
		location.href="/moveChating?room_name="+name+"&room_no="+number+"&member_no="+member_no;
	}

	function createChatingRoom(res){
		if(res != null){
			var tag = "<tr><th class='num'>순서</th><th class='room'>채팅창</th><th class='go'></th></tr>";
			res.forEach(function(d, idx){
				//var rn = d.roomName.trim();
				var room_name = d.room_name;
				var room_no = d.room_no;
				tag += "<tr>"+
							"<td class='num'>"+(idx+1)+"</td>"+
							"<td class='room'>"+ room_name +"</td>"+
							"<td class='go'><button type='button' onclick='goRoom(\""+room_no+"\", \""+room_name+"\")'>참여</button></td>" +
						"</tr>";	
			});
			$("#roomList").empty().append(tag);
		}
	}

	function commonAjax(url, parameter, type, calbak, contentType){
		$.ajax({
			url: url,
			data: parameter,
			type: type,
			contentType : contentType!=null?contentType:'application/x-www-form-urlencoded; charset=UTF-8',
			success: function (res) {
				calbak(res);
			},
			error : function(err){
				console.log('error');
				calbak(err);
			}
		});
	}
</script>
<body>
	<input type="hidden" name="member_no" id="member_no" value="${m.member_no }">
	<div class="container">
		<h1>4989 채팅 - ${m.member_nickname }님의 채팅방</h1>
		<div id="roomContainer" class="roomContainer">
			<table id="roomList" class="roomList"></table>
		</div>
		<div>
			<table class="inputTable">
				<tr>
					<th>방 이름</th>
					<th><input type="text" name="roomName" id="roomName"></th>
					<th><button id="createRoom">방 만들기</button></th>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>