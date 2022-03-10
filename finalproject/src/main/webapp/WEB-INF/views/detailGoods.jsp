<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
  <!-- iamport.payment.js -->
 <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">

$(function(){
	$("#check_module").click(function(){
		console.log("click");
		var member_no = ${sessionScope.m.member_no};
		var goods_no =  ${sessionScope.g.goods_no};
		console.log(goods_no);
		 IMP.init("imp68206371"); // 예: imp00000000
		 IMP.request_pay({ // param
	          pg: "kcp",
	          pay_method: "card",
	          merchant_uid: '${sessionScope.g.goods_no}',
	          name: '${sessionScope.g.goods_name}',
	          amount: '${sessionScope.g.goods_price}',
	          buyer_email: '${sessionScope.m.member_id}',
	          buyer_name: '${sessionScope.m.member_name}',
	          buyer_tel: '${sessionScope.m.member_tel}',
	          buyer_addr: '${sessionScope.m.member_addr}',
	          //buyer_postcode: "01181"
	      }, function (rsp) { // callback
	          if (rsp.success) {
	        	 let data={
	        		member_no:member_no,
	        		goods_no:rsp.merchant_uid
	        	 };
	        	$.ajax({url:"purchaseGoods",
	        		data:data,
	        		success:function(){
	        		let msg = "결제가 완료되었습니다\n";
					msg+="고유넘버:"+member_no;
					msg+="상품넘버:"+goods_no;
					alert(msg);
					location.href="detailGoods?goods_no"+goods_no;
	        	}}) ; 	
	              // 결제 성공 시 로직,

	          } else {
	        	  let msg ="결제에실패하였습니다. "
	        	  msg+="에러내용"+rsp.error_msg;
	        	  alert(msg);
	              // 결제 실패 시 로직,
	          }
	      });
	});
});




function condition(e){
	var goods_condition = $(e).attr("name");
	var goods_no =<%=session.getAttribute("goods_no")%>;
	
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
	<c:if test="${m.member_no != null}">
		<c:if test="${check==0 }"><a href="favorGoods?goods_no=${g.goods_no }"><img src="../images/빈하트.png" width="40px" class="position-absolute top-0 start-100 translate-middle"></a></c:if>
	  	<c:if test="${check==1 }"><a href="favorGoods?goods_no=${g.goods_no }"><img src="../images/찜.png" width="40px" class="position-absolute top-0 start-100 translate-middle"></a></c:if>
	</c:if>
	  
	  <div class="carousel-indicators">
	    <c:if test="${not empty goods_image1}"><button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button></c:if>
	    <c:if test="${not empty goods_image2}"><button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button></c:if>
	    <c:if test="${not empty goods_image3}"><button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button></c:if>
	    <c:if test="${not empty goods_image4}"><button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="3" aria-label="Slide 4"></button></c:if>
	  </div>
	  <div class="carousel-inner">
	  	<c:if test="${not empty goods_image1}">
	    <div class="carousel-item active">
	      <img src="images/${goods_image1}" class="d-block w-50 mx-auto" style="width: 570px; height: 430px;">
	    </div>
	    </c:if>
	  	<c:if test="${not empty goods_image2}">
	    <div class="carousel-item">
	      <img src="../images/${goods_image2}" class="d-block w-50 mx-auto" style="width: 570px; height: 430px;">
	    </div>
	    </c:if>
	  	<c:if test="${not empty goods_image3}">
	    <div class="carousel-item">
	      <img src="../images/${goods_image3}" class="d-block w-50 mx-auto" style="width: 570px; height: 430px;">
	    </div>
	    </c:if>
	   	<c:if test="${not empty goods_image4}">
	    <div class="carousel-item">
	      <img src="../images/${goods_image4}" class="d-block w-50 mx-auto" style="width: 570px; height: 430px;">
	    </div>
	    </c:if>
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
	<c:if test="${gd.goods_condition != 3 }">
	<label class="d-md-flex justify-content-md-middle" style="margin: 0 auto; display: inline; justify-content: center;">	
		<c:if test="${g.member_no != m.member_no }">
		<c:if test="${gd.goods_condition == 1 }"><button type="button" class="btn btn-primary" >판매중</button></c:if>
		<c:if test="${gd.goods_condition == 2 }"><button type="button" class="btn btn-primary" >예약중</button></c:if>
		<c:if test="${gd.goods_condition == 3 }"><button type="button" class="btn btn-primary" >판매완료</button></c:if>
		</c:if>
		<c:if test="${g.member_no == m.member_no }">
		<c:if test="${gd.goods_condition == 1 }"><button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">판매중</button></c:if>
		<c:if test="${gd.goods_condition == 2 }"><button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">예약중</button></c:if>
		<c:if test="${gd.goods_condition == 3 }"><button type="button" class="btn btn-primary" >판매완료</button></c:if>
		</c:if>
		<button type="button" class="btn btn-success">채팅하기</button>
		<button type="button" class="btn btn-danger" id="check_module">결제하기</button>
	</label>
	</c:if>
	<c:if test="${gd.goods_condition == 3 }">
		<div class="d-grid gap-2 col-6 mx-auto">
		<c:if test="${checkPurchase == 0 }"><button class="btn btn-primary" type="button">판매완료</button></c:if>
		<c:if test="${checkPurchase > 0 }"><button class="btn btn-primary" type="button" onClick="window.open('reviewGoods?goods_no=${g.goods_no}','_blank','toolbar=no,location=no,status=no,menubar=no, scrollbars=auto,resizable=no,directories=no,width=800,height=600, top=10,left=10')">결제완료/리뷰남기기</button></c:if>
		</div>
	</c:if>
	
	
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
	        <button type="button" class="btn btn-primary" name="3" onClick="window.open('findNick?goods_no=${g.goods_no}','_blank','toolbar=no,location=no,status=no,menubar=no, scrollbars=auto,resizable=no,directories=no,width=800,height=600, top=10,left=10')">판매완료</button>
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