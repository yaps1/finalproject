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
	function category(e){
		var goods_category=$(e).attr("name");
		//alert(goods_category);
		
		let form = document.createElement('form');
		form.action = 'goods';
		form.method = 'post';

		form.innerHTML = "<input type='hidden' name='goods_category' value="+goods_category+">";
		form.innerHTML += "<input type='hidden' name='${_csrf.parameterName }' value='${_csrf.token }'>";
		
		// 폼을 제출하려면 반드시 폼이 문서 안에 있어야 합니다.
		document.body.append(form);

		form.submit();
		
		//document.getElementById('goods').submit(goods_category);
	}
	function orderColumn(e){
		var orderColumn = $(e).attr("name");
		//alert(orderColumn)
		let form = document.createElement('form');
		form.action = 'goods';
		form.method = 'post';

		form.innerHTML = "<input type='hidden' name='orderColumn' value="+orderColumn+">";
		form.innerHTML += "<input type='hidden' name='${_csrf.parameterName }' value='${_csrf.token }'>";
		
		// 폼을 제출하려면 반드시 폼이 문서 안에 있어야 합니다.
		document.body.append(form);

		form.submit();
	}
	function addr(e){
		var member_no = $(e).attr("name");
		
		let form = document.createElement('form');
		form.action = 'goods';
		form.method = 'post';

		form.innerHTML = "<input type='hidden' name='member_no' value="+member_no+">";
		form.innerHTML += "<input type='hidden' name='${_csrf.parameterName }' value='${_csrf.token }'>";
		
		// 폼을 제출하려면 반드시 폼이 문서 안에 있어야 합니다.
		document.body.append(form);

		form.submit();
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
  	.p1{
  		display:inline;
  		white-space: nowrap;
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
<hr>
	<div class="accordion accordion-flush" id="accordionFlushExample" style="float: left;">
	  <div class="accordion-item">
	    <h2 class="accordion-header" id="flush-headingOne">
	      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
	        의류
	      </button>
	    </h2>
	    <div id="flush-collapseOne" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
	      <div class="accordion-body" onclick="category(this)" name="11">아우터</div>
	      <div class="accordion-body" onclick="category(this)" name="12">상의 </div>
	      <div class="accordion-body" onclick="category(this)" name="13">하의 </div>
	      <div class="accordion-body" onclick="category(this)" name="14">언더웨어 </div>
	    </div>
	  </div>
	  <div class="accordion-item">
	    <h2 class="accordion-header" id="flush-headingTwo">
	      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo" aria-expanded="false" aria-controls="flush-collapseTwo">
	        잡화
	      </button>
	    </h2>
	    <div id="flush-collapseTwo" class="accordion-collapse collapse" aria-labelledby="flush-headingTwo" data-bs-parent="#accordionFlushExample">
	      <div class="accordion-body" onclick="category(this)" name="21">신발</div>
	      <div class="accordion-body" onclick="category(this)" name="22">가방 </div>
	      <div class="accordion-body" onclick="category(this)" name="23">반려동물 물품 </div>
	      <div class="accordion-body" onclick="category(this)" name="24">지갑 </div>
	      <div class="accordion-body" onclick="category(this)" name="25">모자 </div>
	      <div class="accordion-body" onclick="category(this)" name="26">악세사리 </div>
	    </div>
	  </div>
	  <div class="accordion-item">
	    <h2 class="accordion-header" id="flush-headingThree">
	      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseThree" aria-expanded="false" aria-controls="flush-collapseThree">
	        생활가전
	      </button>
	    </h2>
	    <div id="flush-collapseThree" class="accordion-collapse collapse" aria-labelledby="flush-headingThree" data-bs-parent="#accordionFlushExample">
	      <div class="accordion-body" onclick="category(this)" name="31">모바일</div>
	      <div class="accordion-body" onclick="category(this)" name="22">가전제품 </div>
	      <div class="accordion-body" onclick="category(this)" name="33">PC/노트북 </div>
	      <div class="accordion-body" onclick="category(this)" name="34">카메라 </div>
	      <div class="accordion-body" onclick="category(this)" name="35">오디오/영상 </div>
	    </div>
	  </div>
	  <div class="accordion-item">
	    <h2 class="accordion-header" id="flush-headingOne">
	      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseFour" aria-expanded="false" aria-controls="flush-collapseFour">
	        가구/인테리어
	      </button>
	    </h2>
	    <div id="flush-collapseFour" class="accordion-collapse collapse" aria-labelledby="flush-headingFour" data-bs-parent="#accordionFlushExample">
	      <div class="accordion-body" onclick="category(this)" name="41">가구</div>
	      <div class="accordion-body" onclick="category(this)" name="42">인테리어</div>

	    </div>
	  </div>
	  <div class="accordion-item">
	    <h2 class="accordion-header" id="flush-headingTwo">
	      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseFive" aria-expanded="false" aria-controls="flush-collapseFive">
	        게임/취미
	      </button>
	    </h2>
	    <div id="flush-collapseFive" class="accordion-collapse collapse" aria-labelledby="flush-headingFive" data-bs-parent="#accordionFlushExample">
	      <div class="accordion-body" onclick="category(this)" name="51">게임</div>
	      <div class="accordion-body" onclick="category(this)" name="52">취미 </div>
	    </div>
	  </div>
	  <div class="accordion-item">
	    <h2 class="accordion-header" id="flush-headingThree">
	      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseSix" aria-expanded="false" aria-controls="flush-collapseSix">
	        스포츠/레저
	      </button>
	    </h2>
	    <div id="flush-collapseSix" class="accordion-collapse collapse" aria-labelledby="flush-headingSix" data-bs-parent="#accordionFlushExample">
	      <div class="accordion-body" onclick="category(this)" name="61">스포츠</div>
	      <div class="accordion-body" onclick="category(this)" name="62">레저</div>
	    </div>
	  </div>
	  <div class="accordion-item">
	    <h2 class="accordion-header" id="flush-headingOne">
	      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseSeven" aria-expanded="false" aria-controls="flush-collapseSeven">
	        뷰티/미용
	      </button>
	    </h2>
	    <div id="flush-collapseSeven" class="accordion-collapse collapse" aria-labelledby="flush-headingSeven" data-bs-parent="#accordionFlushExample">
	      <div class="accordion-body" onclick="category(this)" name="71">헤어/바디</div>
	      <div class="accordion-body" onclick="category(this)" name="72">메이크업</div>
	    </div>
	  </div>
	  <div class="accordion-item">
	    <h2 class="accordion-header" id="flush-headingTwo">
	      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseEight" aria-expanded="false" aria-controls="flush-collapseEight">
	        도서/티켓/문구
	      </button>
	    </h2>
	    <div id="flush-collapseEight" class="accordion-collapse collapse" aria-labelledby="flush-headingEight" data-bs-parent="#accordionFlushExample">
	      <div class="accordion-body" onclick="category(this)" name="81">도서</div>
	      <div class="accordion-body" onclick="category(this)" name="82">문구</div>
	      <div class="accordion-body" onclick="category(this)" name="83">티켓/기프티콘/상품권</div>
	    </div>
	  </div>
	  <div class="accordion-item">
	    <h2 class="accordion-header" id="flush-headingThree">
	      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseNine" aria-expanded="false" aria-controls="flush-collapseNine">
	        차량/오토바이
	      </button>
	    </h2>
	    <div id="flush-collapseNine" class="accordion-collapse collapse" aria-labelledby="flush-headingNine" data-bs-parent="#accordionFlushExample">
	      <div class="accordion-body" onclick="category(this)" name="91">차량</div>
	      <div class="accordion-body" onclick="category(this)" name="92">오토바이</div>
	    </div>
	  </div>
	  <div class="accordion-item">
	    <h2 class="accordion-header" id="flush-headingThree">
	      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseZero" aria-expanded="false" aria-controls="flush-collapseZero">
	        기타
	      </button>
	    </h2>
	    <div id="flush-collapseZero" class="accordion-collapse collapse" aria-labelledby="flush-headingZero" data-bs-parent="#accordionFlushExample">
	      <div class="accordion-body" onclick="category(this)" name="0">기타</div>
	    </div>
	  </div>
	</div>
	<div>
		<div class="d-grid gap-2 d-md-flex justify-content-md-end">
		  <button class="btn btn-secondary me-md-2" type="button">상품등록하기</button>
		  <c:if test="${member_no ==null  or member_no==0}">
		  <h3 class="btn btn-primary" onclick="addr(this)" name="4">우리동네 거래하기</h3>
		  </c:if>
		  <c:if test="${member_no>0 }">
		  <h3 class="btn btn-primary" onclick="addr(this)" name="0">전체지역 거래하기</h3>
		  </c:if>
		</div>
		<br>
		<c:if test="${member_no ==null  or member_no==0}">
		  	<p class="fs-1" style="text-align: center">전체지역 중고거래</p>
		</c:if>
		<c:if test="${member_no>0 }">
		  	<p class="fs-1" style="text-align: center">우리동네 중고거래</p>
		</c:if>

		
		<form class="d-flex">		
        	<input class="form-control me-2" type="search" placeholder="Search" aria-label="Search" name="keywordGoods"id="keywordGoods">
        	<button class="btn btn-outline-success" type="submit">Search</button>
      	</form>
		<br>
      	<div class="text-end text-break">
      		<p class="p1" name="cnt" onclick="orderColumn(this)">인기순</p>
      		<p class="p1">|</p>
      		<p class="p1" name="goods_no" onclick="orderColumn(this)">최신순</p>
      	</div>
      	<hr>	
      	<br>
      	<div class="container">
		  <div class="row">
		  <c:forEach var="g" items="${list }">
		    <div class="col">
		      <div class="card" style="width: 18rem;">
				  <a href="detailGoods?goods_no=${g.goods_no }"><img src="../upload/${g.goods_image1 }" class="card-img-top"></a>
				  <div class="card-body">
				    <h5 class="card-title">${g.goods_name }</h5>
				    <p class="card-text">${g.goods_price }</p>
				    <p class="card-text">${g.goods_addr }</p>
				    <p class="card-text">♥ ${g.cnt }</p>
				  </div>
				</div>
		    </div>
		  </c:forEach>
		  </div>

		  
		</div>
		
	</div>
	<br>
	<br>
	<div style="clear:none;"> 
		<ul style="list-style: none;">
			<c:if test="${prev > 0 }"><li><a href="goods?pageNUM=${first-1 }" id='prev'>이전</a></li></c:if>
			<c:forEach var="i" begin="${first }" end="${last }">
				<c:if test="${i == pageNUM }"><li class='on'><a href="goods?pageNUM=${i }">${i }</a></li></c:if>
				<c:if test="${i != pageNUM }"><li><a href="goods?pageNUM=${i }">${i }</a></li></c:if>
			</c:forEach>
			<c:if test="${last < totalPage }"><li><a href="goods?pageNUM=${last+1 }" id='next'>다음</a></li></c:if>
		</ul>
	</div>

</body>
</html>