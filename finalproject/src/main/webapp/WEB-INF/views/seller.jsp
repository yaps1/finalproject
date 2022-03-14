<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<title>Insert title here</title>
<meta
      name="viewport"
      content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1"
    />
     <link
      rel="stylesheet"
      href="https://unpkg.com/swiper/swiper-bundle.min.css"
    />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
function MovePage(e) {
	var goods_no=$(e).attr("name");
	window.opener.top.location.href="detailGoods?goods_no="+goods_no;
	window.close();
	}

</script>
<style type="text/css">
	body{
		margin: 0 auto;	
		justify-content: center;
		width: 80%;
		text-align: center;

	}
	a{
	text-decoration: none; /* 링크의 밑줄 제거 */
  	color: inherit; /* 링크의 색상 제거 */
  	}
      .swiper {
        width: 100%;
        height: 100%;
      }

      .swiper-slide {
        text-align: center;
        font-size: 18px;
        background: #fff;

        /* Center slide text vertically */
        display: -webkit-box;
        display: -ms-flexbox;
        display: -webkit-flex;
        display: flex;
        -webkit-box-pack: center;
        -ms-flex-pack: center;
        -webkit-justify-content: center;
        justify-content: center;
        -webkit-box-align: center;
        -ms-flex-align: center;
        -webkit-align-items: center;
        align-items: center;
      }

      .swiper-slide img {
        display: block;
        width: 100%;
        height: 100%;
        object-fit: cover;
      }
      ul {
	    text-align: center;
	    display: inline-block;
	    border: 1px solid #ccc;
	    border-right: 0;
	    padding-left: 0px;
	}

	ul li {
	    text-align: center;
	    float: left;
	}
	
	ul li a {
	    display: block;
	    font-size: 14px;
	    padding: 9px 12px;
	    border-right: solid 1px #ccc;
	    box-sizing: border-box;
	}
	
	ul li.on {
	    background: gray;
	}
	
	ul li.on a {
	    color: #fff;
	}
</style>
</head>
<body>
	<div style="border: 1px solid">
		<p class="fs-1 text-center fw-bold">판매자 정보</p>
		<p class="fs-5 fw-bold lh-1 text-center" style="display:inline;">판매자 닉네임</p>
		<p class="fs-6 lh-1 text-center" style="display:inline;">${sm.member_nickname }</p>
		<br><br>
		<p class="fs-5 fw-bold lh-1" style="display:inline;">판매자 레벨</p>
		<c:forEach begin="1" end="${sm.member_level }"><img src="../images/레벨.png"></c:forEach>
		<br>
		<br>
		<p class="text-light bg-dark">판매 중 상품</p>
		<br>
		<p class="fs-5 fw-bold lh-1" style="display:inline;">상품 ${goods }개</p>
		<!-- Swiper -->
	    <div class="swiper mySwiper">
	      <div class="swiper-wrapper">
	      <c:forEach var="sg" items="${sg }">
	        <div class="swiper-slide card">
	       		<img src="../images/${sg.goods_image1 }" class="card-img-top " name="${sg.goods_no }" onclick="MovePage(this)" style="width: 100%; height: 150px;">
					<div class="card-body">
					<h5 class="card-title">${sg.goods_name }</h5>
					<p class="card-text">${sg.goods_price }</p>
					</div>
	        </div>
		  </c:forEach>
	      </div>
	      <div class="swiper-button-next"></div>
	      <div class="swiper-button-prev"></div>
	      <br>
	      <div class="swiper-pagination"></div>
	    </div>
	
	    <!-- Swiper JS -->
	    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
	
	    <!-- Initialize Swiper -->
	    <script>
	      var swiper = new Swiper(".mySwiper", {
	        slidesPerView: 3,
	        spaceBetween: 30,
	        slidesPerGroup: 3,
	        loop: true,
	        loopFillGroupWithBlank: true,
	        pagination: {
	          el: ".swiper-pagination",
	          clickable: true,
	        },
	        navigation: {
	          nextEl: ".swiper-button-next",
	          prevEl: ".swiper-button-prev",
	        },
	      });
	    </script>

		<br>
		<br>
		<p class="text-light bg-dark">판매 완료 상품</p>
		<p class="fs-5 fw-bold lh-1" style="display:inline;">상품 ${goodsSold }개</p>
		<br>

		<!-- Swiper -->
	    <div class="swiper mySwiper">
	      <div class="swiper-wrapper">
	      <c:forEach var="sgs" items="${sgs }">
	        <div class="swiper-slide card">
	       		<img src="../images/${sgs.goods_image1 }" class="card-img-top "name="${sgs.goods_no }" onclick="MovePage(this)">
					<div class="card-body">
					<h5 class="card-title">${sgs.goods_name }</h5>
					<p class="card-text">${sgs.goods_price }</p>
					</div>
	        </div>
		  </c:forEach>
	      </div>
	      <div class="swiper-button-next"></div>
	      <div class="swiper-button-prev"></div>
	      <br>
	      <div class="swiper-pagination"></div>
	    </div>
	
	    <!-- Swiper JS -->
	    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
	
	    <!-- Initialize Swiper -->
	    <script>
	      var swiper = new Swiper(".mySwiper", {
	        slidesPerView: 3,
	        spaceBetween: 30,
	        slidesPerGroup: 3,
	        loop: true,
	        loopFillGroupWithBlank: true,
	        pagination: {
	          el: ".swiper-pagination",
	          clickable: true,
	        },
	        navigation: {
	          nextEl: ".swiper-button-next",
	          prevEl: ".swiper-button-prev",
	        },
	      });
	    </script>
		
		<br>
		<br>
		<p class="text-light bg-dark">판매 상품 후기</p>
		
		<c:forEach var="sr" items="${sr }">
		<c:forEach begin="1" end="${sr.goods_score }"><img src="../images/별점1.png"></c:forEach>
		<p class="fs-5 fw-bold lh-1"">${sr.goods_review }</p>
		<hr>
		</c:forEach>
		
		<ul style="list-style: none;">
			<c:if test="${prev > 0 }"><li><a href="seller?pageNUM=${first-1 }" id='prev'>이전</a></li></c:if>
			<c:forEach var="i" begin="${first }" end="${last }">
				<c:if test="${i == pageNUM }"><li class='on'><a href="seller?pageNUM=${i }">${i }</a></li></c:if>
				<c:if test="${i != pageNUM }"><li><a href="seller?pageNUM=${i }">${i }</a></li></c:if>
			</c:forEach>
			<c:if test="${last < totalPage }"><li><a href="seller?pageNUM=${last+1 }" id='next'>다음</a></li></c:if>
		</ul>
		
		<br>
	</div>
	<br>
</body>
</html>