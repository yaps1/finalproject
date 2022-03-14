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
	var keyword = new Array();
	
	var docWidth = $( 'div#hot' ).innerWidth()+150; // 문서 가로값
	var docHeight = $( 'div#hot' ).innerHeight()+280; // 문서 세로값


	// 설정값

	var maxRox = 0; // random offset x 최대값

	var maxRoh = 300; // random offset y 최대값

	
	var minRox = 300; // random offset x 최소값

	var minRoh = 430; // random offset y 최소값


	var imgWidth = 200; // 이미지 가로 크기

	var imgHeight = 100; // 이미지 세로 크기

	$.ajax({url:"hotKeyword",success:function(data){
		$.each(data,function(){
			var rox = Math.floor((Math.random()*docWidth)+1)-0; // random offset x

			var roh = Math.floor((Math.random()*docHeight)+1)-0; // random offset y
			var size=Math.floor(Math.random()*(37-15+1))+15;
			//console.log(size);
			
			// offset이 화면 밖으로 넘어가지 않도록

			if( (rox+imgWidth) > docWidth ){

			rox = docWidth-imgWidth;

			}else if( (rox-imgWidth) < 0 ){

			rox = 0;

			}

			if( (roh+imgHeight) > docHeight ){

			roh = docHeight-imgHeight;

			}else if( (roh-imgHeight) < 0 ){

			roh = 0;

			}

			// 최소 최대 영역이 있다면

			if( rox < minRox && minRox != 0 ){

			rox = minRox;

			}else if( rox > maxRox && maxRox != 0 ){

			rox = maxRox;

			}



			if( roh < minRoh && minRoh != 0 ){

			roh = minRoh;

			}else if( roh > maxRoh && maxRoh != 0 ){

			roh = maxRoh;

			}
			let p =$("<p style='position: absolute; left:"+rox+"px; top:"+roh+"px; z-index:1000; font-size: "+size+"px; '></p>").html("#"+this)
			let a=$("<a href='searchkeyword?searchkeyword="+this+"'></a>").append(p);
			$("#hot").append(a);
			
		});
	}});

});
</script>
<style type="text/css">
	
	a{
	text-decoration: none; /* 링크의 밑줄 제거 */
  	color: inherit; /* 링크의 색상 제거 */
  	}
  	#hot{
  		border: 1px solid #444444;
  		width: 100%;
  		height: 300px;
  		
  	}

</style>
</head>
<body>
<jsp:include page="header1.jsp"></jsp:include>
<!-- body 대신 div-->
<div style="margin: 0 auto;	justify-content: center; width: 80%;">
	<hr>
	<div id="hot">
	<p class="fs-1" style="text-align: center;">인기검색어</p>
	</div>
	
	<hr>
	<!-- 중고거래 -->
	<div class="card mb-3 w-100 bg-secondary text-white" >
	  <div class="row g-0">
	    <div class="col-md-4">
	      <img src="../images/중고거래.png" class="img-fluid rounded-start">
	    </div>
	    <div class="col-md-8">
	      <div class="card-body" >
	        <h2 class="card-title" style="line-height :1.8em; padding: 40px;">중고거래</h2>
	        <p class="card-text" style="line-height :1.8em; padding: 40px;">버리기에는 쓸만하고 나에게는 필요없는 물건들을 거래하고 싶다면 동네주민과 직거래 혹은 원거리 택배로 중고거래를 해보세요!</p>
	        <a href="session?delete=1"" class="btn btn-info" style="margin-left: 40px;">중고거래 바로가기</a>
	      </div>
	    </div>
	  </div>
	</div>
	<!-- 공동구매 -->
	<div class="card mb-3 w-100 bg-secondary text-white" >
	  <div class="row g-0">
	    <div class="col-md-4">
	      <img src="../images/공동구매.png" class="img-fluid rounded-start">
	    </div>
	    <div class="col-md-8">
	      <div class="card-body" >
	        <h2 class="card-title" style="line-height :1.8em; padding: 40px;">공동구매</h2>
	        <p class="card-text" style="line-height :1.8em; padding: 40px;">구입하고싶은 식자재가 대용량이거나 ott플랫폼 가입비가 부담스럽다면 4989를 통해 공동구매를 해보세요!</p>
	        <a href="session?delete=2" class="btn btn-info" style="margin-left: 40px;">공동구매 바로가기</a>
	      </div>
	    </div>
	  </div>
	</div>
	<!-- 커뮤니티 -->
	<div class="card mb-3 w-100 bg-secondary text-white" >
	  <div class="row g-0">
	    <div class="col-md-4">
	      <img src="../images/커뮤니티.png" class="img-fluid rounded-start">
	    </div>
	    <div class="col-md-8">
	      <div class="card-body" >
	        <h2 class="card-title" style="line-height :1.8em; padding: 40px;">커뮤니티</h2>
	        <p class="card-text" style="line-height :1.8em; padding: 40px;">관심사가 비슷한 이웃과 소모임을 통해만나보세요! 맛집공유를 통해 맛집을 찾을 수 있어요!</p>
	        <a href="listSG" class="btn btn-info" style="margin-left: 40px;">소모임찾기</a>
	        <a href="rest" class="btn btn-info">맛집찾기</a>
	      </div>
	    </div>
	  </div>
	</div>
</div>	<!-- 바디 수정? test -->
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>