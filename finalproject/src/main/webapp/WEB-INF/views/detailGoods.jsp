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
function condition(e){
	var goods_condition = $(e).attr("name");
	var goods_no =<%=session.getAttribute("goods_no")%>;
	
	/* alert(goods_condition);
	alert(goods_no); */
	
/* 	let form = document.createElement('form');
	form.action = 'updateGoodsCondition';
	form.method = 'post';
	form.innerHTML = "<input type='hidden' name='goods_no' value="+goods_no+">";
	form.innerHTML += "<input type='hidden' name='goods_codition' value="+goods_condition+">";
	form.innerHTML += "<input type='hidden' name='${_csrf.parameterName }' value='${_csrf.token }'>";
	
	// 폼을 제출하려면 반드시 폼이 문서 안에 있어야 합니다.
	document.body.append(form);

	form.submit(); */
	location.href="updateGoodsCondition?goods_no="+goods_no+"&goods_condition="+goods_condition;

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

</style>
</head>
<body>
	<hr>
	
	
	<div id="carouselExampleIndicators" class="carousel slide w-75 mx-auto bg-secondary" data-bs-ride="carousel">
	  <c:if test="${check==0 }"><a href="favorGoods?goods_no=${g.goods_no }&member_no=4"><img src="../images/별점0.png" width="40px" class="position-absolute top-0 end-0"></a></c:if>
	  <c:if test="${check==1 }"><a href="favorGoods?goods_no=${g.goods_no }&member_no=4"><img src="../images/찜.png" width="40px" class="position-absolute top-0 end-0"></a></c:if>
	  <div class="carousel-indicators">
	    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
	    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
	    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
	  </div>
	  <div class="carousel-inner">
	    <div class="carousel-item active">
	      <img src="../images/공동구매.png" class="d-block w-50 mx-auto" alt="...">
	    </div>
	    <div class="carousel-item">
	      <img src="../images/공동구매.png" class="d-block w-50 mx-auto" alt="...">
	    </div>
	    <div class="carousel-item">
	      <img src="../images/공동구매.png" class="d-block w-50 mx-auto" alt="...">
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
	<hr>
	<br>
	<p class="text-center fs-1 lh-1">${g.goods_name }</p>
	<p class="text-center fs-4 lh-1">${g.goods_price }원</p>
	<p class="text-center fs-6 lh-1">${g.goods_addr}</p>
	<label class="d-md-flex justify-content-md-middle" style="margin: 0 auto; display: inline; justify-content: center;">
		<c:if test="${gd.goods_condition == 1 }"><button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">판매중</button></c:if>
		<c:if test="${gd.goods_condition == 2 }"><button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">예약중</button></c:if>
		<c:if test="${gd.goods_condition == 3 }"><button type="button" class="btn btn-primary" >판매완료</button></c:if>
		<button type="button" class="btn btn-success">채팅하기</button>
		<button type="button" class="btn btn-danger">결제하기</button>
	</label>
	
	
	
	<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">거래 상태</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        거래 상태를 변경하시겠습니까?
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-primary" name="1" onclick="condition(this)">판매중</button>
	        <button type="button" class="btn btn-primary" name="2" onclick="condition(this)">예약중</button>
	        <button type="button" class="btn btn-primary" name="3" onclick="condition(this)">판매완료</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	
	
	
	
	
	<br>
	<div style="border: 1px solid;">
		<p class="text-center fs-1 fw-bold">상품정보</p>
		<p class="fs-4 fw-bold lh-1">등록일</p>
		<p class="fs-5 lh-1">${g.goods_date }</p>
		<br>
		<p class="fs-4 fw-bold lh-1">상품설명</p>
		<p class="fs-5 lh-1">${gd.goods_content }</p>
		<br>
		<p class="fs-4 fw-bold lh-1">상품상태</p>
		<c:if test="${gd.goods_state == 1}"><p class="fs-5 lh-1">미개봉</p></c:if>
		<c:if test="${gd.goods_state == 2}"><p class="fs-5 lh-1">거의 새 것</p></c:if>
		<c:if test="${gd.goods_state == 3}"><p class="fs-5 lh-1">사용감 있음</p></c:if>
	</div>
	<br>
		<div style="border: 1px solid;">
		<p class="text-center fs-1 fw-bold">판매자 정보</p>
		<p class="fs-4 fw-bold lh-1 " style="display:inline;">판매자 닉네임</p>
		<p class="fs-5 lh-1" style="display:inline;">${g.member_nickname }</p>
		<br><br>
		<p class="fs-4 fw-bold lh-1" style="display:inline;">판매자 레벨</p>
		<c:forEach begin="1" end="${g.member_level }"><img src="../images/레벨.png"></c:forEach>
		<br><br>
		<a href="#"class="btn btn-secondary" onClick="window.open('seller?goods_no=${g.goods_no}','_blank','toolbar=no,location=no,status=no,menubar=no, scrollbars=auto,resizable=no,directories=no,width=800,height=600, top=10,left=10')">판매자 정보 보기</a>
		<br>
		<br>
	</div>
	<br>
	<div class="d-grid gap-2 col-6 mx-auto">
		<button class="btn btn-secondary" type="button" onclick="location.href='goods'">목록으로 가기</button>
	</div>
	<br>
	<br>
</body>
</html>