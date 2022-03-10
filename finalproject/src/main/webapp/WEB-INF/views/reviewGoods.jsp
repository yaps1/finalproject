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
	$(function(){
		document.getElementById('result').innerText
	    = "별점 등록(0/5)";
		
		
	})
	function star(){
		var listVar = $('input[name=goods_score]:checked').val();
		
		document.getElementById('result').innerText
	    = "별점 등록("+listVar+"/5)";
	}
	function check(){
		var alertPlaceholder = document.getElementById('liveAlertPlaceholder');
		var alertTrigger = document.getElementById('liveAlertBtn');
		
		function alert(message, type) {
		  var wrapper = document.createElement('div')
		  wrapper.innerHTML = '<div class="alert alert-' + type + ' alert-dismissible" role="alert">' + message + '<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button></div>'
		
		  alertPlaceholder.append(wrapper);
		}
		$(".alert").remove(".alert");
		
		var listVar = $('input[name=goods_score]:checked').val();
		var goodsR=$("#goodsReview").val();
		if(listVar ==null){
			alert('점수를 등록해주세요', 'warning')
				
		}else if(goodsR ==""){
			alert("리뷰내용을 남겨주세요",'warning');
		}else{
			insertR.submit();
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
  	.star-rating {
	  display: flex;
	  flex-direction: row-reverse;
	  font-size: 2.25rem;
	  line-height: 2.5rem;
	  justify-content: space-around;
	  padding: 0 0.2em;
	  text-align: left;
	  width: 5em;
	}
	 
	.star-rating input {
	  display: none;
	}
	 
	.star-rating label {
	  -webkit-text-fill-color: transparent; /* Will override color (regardless of order) */
	  -webkit-text-stroke-width: 2.3px;
	  -webkit-text-stroke-color: #2b2a29;
	  cursor: pointer;
	}
	 
	.star-rating :checked ~ label {
	  -webkit-text-fill-color: gold;
	}
	 
	.star-rating label:hover,
	.star-rating label:hover ~ label {
	  -webkit-text-fill-color: #fff58c;
	}
</style>
</head>
<body>
<hr>
<div style="border: 1px solid;">
	<div style="width: 90%; margin: 0 auto;">
		<div id="liveAlertPlaceholder"></div>
		<p class="fs-1 fw-bold text-center">후기 작성</p>
		<p class="fs-4" id="result"></p>
		<form action="reviewGoods" method="post" id="insertR">
			<input type="hidden" name="member_no" value="${m.member_no }">
			<input type="hidden" name="goods_no" value="${goods_no }">
			<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
			<div class="star-rating space-x-4 mx-auto" required>
				<input type="radio" id="5-stars" name="goods_score" value="5" v-model="ratings" onclick="star()"/>
				<label for="5-stars" class="star pr-4">★</label>
				<input type="radio" id="4-stars" name="goods_score" value="4" v-model="ratings" onclick="star()"/>
				<label for="4-stars" class="star">★</label>
				<input type="radio" id="3-stars" name="goods_score" value="3" v-model="ratings" onclick="star()"/>
				<label for="3-stars" class="star">★</label>
				<input type="radio" id="2-stars" name="goods_score" value="2" v-model="ratings" onclick="star()"/>
				<label for="2-stars" class="star">★</label>
				<input type="radio" id="1-star" name="goods_score" value="1" v-model="ratings" onclick="star()"/>
				<label for="1-star" class="star">★</label>
			</div>
			<br>
			<div class="mb-3">
			  <textarea class="form-control" id="goodsReview" rows="3" placeholder="리뷰를 남겨주세요" name="goods_review" maxlength="49" style="resize: none;" required></textarea>
			</div>	
			<div class="d-grid gap-2 col-6 mx-auto">
			  <button class="btn btn-primary" type="button" onclick="check()" id="liveAlertBtn">후기 등록</button>
			</div>
		</form>
		<br>
	</div>
</div>
	
</body>
</html>