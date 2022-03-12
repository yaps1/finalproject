<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="true" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">

	$(function(){
		$("#btnQNA").click(function(){
			//alert("OK");
			//var member_no = ${sessionScope.m.member_no};
			var member_no = $("#memberno").val();
			if(member_no==""){ 
				 $("#myModal").modal('show');

			}else{
				location.href="session?delete=4";
			} 
		})
		
		$('#my-modal').modal({
		    show: 'false'
		}); 
		
	})
/*
	function insertQna(){
		

		//var member_no = m.getMember_no();
		//console.log(member_no);

	}*/
	
</script>
<style type="text/css">
	#top_header_ul{
		/*display:inline-block;
		background:red;*/
		list-style: none;
		margin: 0;
		width: 300px;
	
	}
	/*
	.header_li{
		display: inline-block;
		margin-right: 20px;
	}
	.header_a{
		text-decoration: none;
		outline: none;
		color: inherit;
	}*/
	.top_header_a{
		text-decoration: none;
		outline: none;
		color: inherit;
		float: left;
	}
	#top_header_li{
		/*display: inline-block;*/
		margin-right: 10px;
		float: left;
	}
</style>
</head>
<body>

<!-- 전체 header -->
<header class="fixed-top;">

<!-- top-header session유무에 따라 달라지는 메뉴-->
 <div class="p-1 bg-secondary bg-gradient text-end text-white d-flex justify-content-end">
         <c:if test="${not empty m}">
			<ul style="display: inline-block;" id="top_header_ul">
		
			<li class="text-end text-white" id="top_header_li"><a href="mypage?member_no=${m.member_no }" class="top_header_a">마이페이지</a><li>
			<li class="text-end text-white" id="top_header_li"><a href="saguPalguTalk" class="top_header_a">4989톡<i class="bi bi-chat-quote-fill" style="margin-left: 5px;"></i></a><li>
			<li class="text-end text-white" id="top_header_li"><a href="logout" class="top_header_a">로그아웃</a><li> 	
	        </ul>
		 </c:if>
		
         <c:if test="${empty m}">
          <ul style="display: inline-block;" id="top_header_ul">
         	<li class="text-end text-white" id="top-header_li"><a href="/jointype" class="header_a">로그인/회원가입</a><li>
         </ul>
         </c:if>
        
 </div>

<!-- middle-header -->
<nav class="navbar navbar-expand-lg navbar-light bg-light border-bottom p-0 m-0" aria-label="Tenth navbar example">
   <!-- 로고 -->
    <div>
   		<a href="main" class="header_a"><img src="../images/4989_logo.png" style="width: 200px; height: 100px; padding-left: 40px;" ></a>
   	</div>
   	<!-- 메뉴 전체 div -->
    <div class="container position-relative" style="margin: 0 auto; padding-left: 0; padding-right: 150px;">
      <div class="collapse navbar-collapse justify-content-center" id="navbarsExample08">
      <div>
      	<!-- 메뉴 목록 -->  
        <ul class="navbar-nav fs-1 header_ul" id="header_ul">
          <li class="nav-item header_li" id="header_li">
            <a class="nav-link fw-bold text-secondary pt-5 pb-5 header_a" href="session?delete=1" id="header_a">중고거래</a>
          </li>
          <li class="nav-item header_li" id="header_li">
            <a class="nav-link fw-bold text-secondary pt-5 pb-5 header_a" href="session?delete=2" id="header_a">공동구매</a>
          </li>
          
        <!-- 드롭 다운 메뉴 -->
          <li class="nav-item dropdown header_li" id="header_li">
            <a class="nav-link fw-bold text-secondary pt-5 pb-5 header_a" id="dropdown08 header_a" data-bs-toggle="dropdown" aria-expanded="false">커뮤니티</a>
              
            <ul class="dropdown-menu" aria-labelledby="dropdown08" style="width: 176px;" id="header_ul">
              <li style="padding-left: 11px; padding-right: 4px;" id="header_li"><a class="dropdown-item fw-bold text-secondary fs-2 pt-2 pb-2 border-bottom header_li" href="listSG">&nbsp;소모임&nbsp;</a></li>
              <li style="padding-left: 7px;" id="header_li"><a class="dropdown-item fw-bold text-secondary fs-2 pt-2 pb-2 header_li" href="rest">맛집공유</a></li>
            </ul>
          </li>
          
          <!-- 메뉴 목록 -->
          <li class="nav-item header_li" id="header_li">
            <a class="nav-link fw-bold text-secondary pt-5 pb-5 header_a" href="session?delete=3" id="header_a">공지사항</a>
          </li>
          <li class="nav-item header_li" id="">
            <a href="#"  class="nav-link fw-bold text-secondary pt-5 pb-5 header_a" id="btnQNA" id="header_a">문의사항</a>
          </li>
        </ul>
        
      </div>
      </div>
    </div>
  </nav>
  
    <div class="modal" tabindex="-1" id="myModal">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title">로그인 알림</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        <p>로그인이 필요한 항목입니다.</p>
	        <p>로그인하시겠습니까?.</p>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
	        <button type="button" class="btn btn-primary" onclick="location.href='login'">로그인</button>
	      </div>
	    </div>
	  </div>
	 </div>
  </header>
  <input type="hidden" id="memberno" value="${m.member_no }">

</body>
</html>