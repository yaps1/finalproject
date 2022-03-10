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
function insert()  {
	var alertPlaceholder = document.getElementById('liveAlertPlaceholder');
	var alertTrigger = document.getElementById('liveAlertBtn');
	
	function alert(message, type) {
	  var wrapper = document.createElement('div')
	  wrapper.innerHTML = '<div class="alert alert-' + type + ' alert-dismissible" role="alert">' + message + '<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button></div>'
	
	  alertPlaceholder.append(wrapper);
	}
	$(".alert").remove(".alert");
	var val = $("#select option:selected").val();
	//alert(val);
	var qnaContent=$("#qnaContent").val();
	var qnaTitle=$("#qnaTitle").val();
	if(val == 0){
		alert("문의사항을 선택해주세요","danger");
	}else if(qnaTitle == ""){
		alert("문의사항 제목을 입력해주세요","danger");
	}else if(qnaContent == ""){
		alert("문의사항 내용을 입력해주세요","danger");
	}else{
		insertQ.submit();
	}
	
}
function getItem(){
	  
	  var result = $("#select option:selected").text();
	  console.log(result);
	  var val = $("#select option:selected").val();
	  
	    if(val==1){
	    	document.getElementById('result').innerText
		    = result;
	    }else if(val==2){
	    	document.getElementById('result').innerText
		    = result;
	    }else{
	    	document.getElementById('result').innerText
		    = "";
	    }
	}

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
  	div{
  		border: 2px;
  	}

</style>
</head>
<body>
<hr>
	<div id="liveAlertPlaceholder"></div>
	<div style="width: 90%; margin: 0 auto;">
	<p class="fs-1" style="text-align: center">문의사항 작성</p>
	<form action="insertQna" method="post" id="sm" name="insertQ">
	<input type="hidden" name="member_no" value="${m.member_no }">
	<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
		<select class="form-select" aria-label="Default select example" id="select" name="qna_type" onclick="getItem()">
		  <option value="0" selected >문의사항을 선택해주세요</option>
		  <option value="1" name="qna_type">비매너 회원 신고</option>
		  <option value="2" name="qna_type">기타문의사항</option>
		</select>
		<div id='result' class="form-control" disabled readonly></div>
		<br>
		<div class="mb-3">
		  <label for="qnaTitle" class="form-label">제목</label>
		  <input type="text" class="form-control" id="qnaTitle" placeholder="제목을 입력해주세요" name="qna_title">
		</div>
		<div class="mb-3">
		  <label for="qnaContent" class="form-label">문의 내용</label>
		  <textarea class="form-control" id="qnaContent" rows="8" cols="100" name="qna_content" style="resize: none;"></textarea>
		</div>
	
		<label class="d-md-flex justify-content-md-middle" style="margin: 0 auto; display: inline; justify-content: center;">
			<button type="button" class="btn btn-primary btn-lg" form="sm" id="liveAlertBtn" onclick="insert()">문의사항 등록</button>
			<button type="button" class="btn btn-secondary btn-lg" onclick="location.href = '#' ">&nbsp;&nbsp;&nbsp;&nbsp;취소&nbsp;&nbsp;&nbsp;&nbsp;</button>
		</label>
	</form>
	</div>
	
</body>
</html>