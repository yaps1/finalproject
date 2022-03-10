<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">


$(document).on("keyup","#nick",function(){ 
	let nick = $("#nick").val();
	//console.log(nick);
	$("tbody").empty();
	
	$.ajax({
		type: 'GET',
		url: "findNickName",
	    data: {nick:nick},
	    success:function(data){
	        $.each(data,function(){		        	
	        	let tr = $("<tr id='member_no'></tr>").attr("member_no",this.member_no);

	            $(tr).append($("<td id='member_name'></td>").html(this.member_nickname));
	            $(tr).append($("<td></td>").html(this.member_addr));
	            $("tbody").append(tr);
	        });
	}});
	
});


$(document).on('click', '#member_name',function(){
	let member_no = $('#member_no').attr('member_no');
	let goods_no = <%=(Integer)session.getAttribute("goods_no")%>;
	if (confirm("회원이 구매자입니까?") == true){    //확인

	    location.href="purchaseGoodsNick?member_no="+member_no+"&goods_no="+goods_no;
	    window.opener.top.location.href="detailGoods?goods_no="+goods_no;
		window.close();
	}else{   //취소

	    return;

	}
});




</script>
<style type="text/css">
	body{
		margin: 0 auto;	
		justify-content: center;
		width: 80%;

	}
	a{
	text-decoration: none; /* 링크의 밑줄 제거 */
  	color: inherit; /* 링크의 색상 제거 */
  	}
</style>
</head>
<body>
	<hr>
	<p class="text-center fs-2 fw-bold">닉네임 찾기</p>
	<br>
	<div class="col-md-6">
	<input id="nick" type="text" name="nick" class="form-control col-md-6" placeholder="닉네임을 입력해주세요">
	</div>
	<br>
	<table border="1" width="80%" class="table table-sm table-hover">
		<thead>
			<tr>
				<td scope="col">닉네임</td>
				<td scope="col">주소</td>
			</tr>
		</thead>
		<tbody></tbody>
	</table>
	<hr>
</body>
</html>