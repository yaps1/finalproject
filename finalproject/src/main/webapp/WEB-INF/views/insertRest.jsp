<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script type="text/javascript">
$(function(){
		
		$("#btn-insert").click(function(){
			let rest_name = $("#rest_name").val();
			let rest_tel = $("#rest_tel").val();
			let rest_addr = $("#rest_addr").val();
			let rest_avg_score = $("#rest_avg_score").val();
			//console.log(rest_name);
			//console.log(rest_tel);
			//console.log(rest_addr);
			//console.log(rest_avg_score);
			
			$.ajax({
				url:"insertRest",
				type:"post",
				data:{
					rest_name:rest_name,
					rest_tel:rest_tel,
					rest_addr:rest_addr,
					rest_avg_score:rest_avg_score
				},
				success:function(){
					alert("맛집등록에 성공하였습니다!");
					location.href="/rest";
				}
				
			})
		});
	
	
	
});
</script>
<title>Insert title here</title>
</head>
<body>
<jsp:include page="header2.jsp"></jsp:include>
   <div style="height: 1200px; padding:200px;">
	<div class="container">
		<form class="border p-5" action="insertRest" method="post" style="margin: 0 auto; width: 800px;">
			<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
			<!-- 맛집 등록 표시 -->
			<div class="mb-5">
				<p class="text-secondary fw-bold display-4 text-center">맛집 공유</p>
			</div>
			<!-- 식당 이름 -->
			<div class="mb-5">
			  <label for="rest_name" class="form-label pb-2 text-secondary fw-bold h3">맛집 이름</label>
			  <input type="text" name="rest_name" class="form-control" id="rest_name" placeholder="맛집 이름" style="height: 50px;">
			</div>
			<!-- 식당 전화 -->
			<div class="mb-5">
			  <label for="rest_tel" class="form-label pb-2 text-secondary fw-bold h3">맛집 전화</label>
			 <input type="text" name="rest_tel" class="form-control" id="rest_tel" placeholder="맛집 전화" style="height: 50px;">
			</div>
			
			<!-- 식당 주소 -->
			<div class="mb-5">
			  <label for="rest_addr" class="form-label pb-2 text-secondary fw-bold h3">맛집 주소</label>
			 <input type="text" name="rest_addr" class="form-control" id="rest_addr" placeholder="맛집 주소" style="height: 50px;">
			</div>
			
			<input type="hidden" name="rest_avg_score" id="rest_avg_score" value="0">
			
			<!-- 버튼 -->
			<div class="mt-3" style="display: inline-block; width: 100%;">
				<div style="float: left;">
				<button id="btn-insert" class="mb-2 btn btn-lg rounded-4 btn-primary" style="width: 340px; height: 60px;" type="button">등록</button>
				</div>
				
				<div style="float: right;">
				<button class="mb-2 btn btn-lg rounded-4 btn-dark" style="width: 340px; height: 60px;" type="reset">취소</button>
				</div>
			</div>
		</form>
	</div>
</div>  
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>