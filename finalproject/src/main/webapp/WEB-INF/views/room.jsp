<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
*{
	margin:0;
	padding:0;
}
/*
.container{
	width: 800px;
	margin: 0 auto;
	padding: 25px
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
.roomContainer{
	background-color: #F6F6F6;
	width: 500px;
	height: 500px;
	overflow: auto;
}
*/
.roomList{
	border: none;
}
.roomList th{
	border: 1px solid #787b7b;
	background-color: #fff;
	color: #787b7b;
}
.roomList td{
	border: 1px solid #787b7b;
	background-color: #fff;
	text-align: center;
	color: #787b7b;
}
.roomList .num{
	text-align: center;
}
.roomList .go{
	
	text-align: center;
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
							"<td class='go'><button type='button' onclick='goRoom(\""+room_no+"\", \""+room_name+"\")' class='btn btn-outline-secondary'>참여</button></td>" +
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
	<jsp:include page="header2.jsp"></jsp:include>
	<input type="hidden" name="member_no" id="member_no" value="${m.member_no }">
	<div class="container" style="width: 800px;margin: 0 auto;padding: 25px">
		<h1><strong>${m.member_nickname }</strong>님의 채팅방</h1>
		<div id="roomContainer" class="roomContainer" style="background-color: #F6F6F6;width: 500px;height: 500px;overflow: auto;">
			<table id="roomList" class="roomList" style="text-align: center;width: 100%;"></table>
		</div>
		<div>
			<table class="inputTable">
				<tr>
					<th>채팅창</th>
					<th><input type="text" name="roomName" id="roomName" style="height:30px;"></th>
					<th><button id="createRoom" class="btn btn-outline-secondary">만들기</button></th>
				</tr>
			</table>
		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>