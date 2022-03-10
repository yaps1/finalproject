<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<style type="text/css">
	ul{
		list-style: none;
		margin: 0;
	}
	li{
		display: inline-block;
		margin-right: 20px;
	}
	a{
		text-decoration: none;
		outline: none;
		color: inherit;
	}
</style>
</head>
<body>

<!-- 전체 header -->
<header class="fixed-top;">

<!-- top-header session유무에 따라 달라지는 메뉴-->
 <div class="p-1 bg-secondary bg-gradient text-end text-white d-flex justify-content-end">
         <c:if test="${not empty m}">
			<ul style="display: inline-block;">
		
			<li class="text-end text-white" id="top-header" style="float: left;"><a href="mypage?member_no=${m.member_no }">마이페이지</a><li>
			<li class="text-end text-white" id="top-header" style="float: left;"><a href="#">4989톡<i class="bi bi-chat-quote-fill" style="margin-left: 5px;"></i></a><li>
			<li class="text-end text-white" id="top-header" style="float: right;"><a href="logout">로그아웃</a><li> 	
	         </ul>
		 </c:if>
		
         <c:if test="${empty m}">
          <ul>
         	<li class="text-end text-white" id="top-header"><a href="/jointype">로그인/회원가입</a><li>
         </ul>
         </c:if>
        
 </div>

<!-- middle-header -->
<nav class="navbar navbar-expand-lg navbar-light bg-light border-bottom p-0 m-0" aria-label="Tenth navbar example">
   <!-- 로고 -->
    <div>
   		<a href="main"><img src="../images/4989_logo.png" style="width: 200px; height: 100px; padding-left: 40px;" ></a>
   	</div>
   	<!-- 메뉴 전체 div -->
    <div class="container position-relative" style="margin: 0 auto; padding-left: 0; padding-right: 150px;">
      <div class="collapse navbar-collapse justify-content-center" id="navbarsExample08">
      <div>
      	<!-- 메뉴 목록 -->  
        <ul class="navbar-nav fs-1">
          <li class="nav-item">
            <a class="nav-link fw-bold text-secondary pt-5 pb-5" href="session?delete=1">중고거래</a>
          </li>
          <li class="nav-item">
            <a class="nav-link fw-bold text-secondary pt-5 pb-5" href="session?delete=2">공동구매</a>
          </li>
          
        <!-- 드롭 다운 메뉴 -->
          <li class="nav-item dropdown">
            <a class="nav-link fw-bold text-secondary pt-5 pb-5" id="dropdown08" data-bs-toggle="dropdown" aria-expanded="false">커뮤니티</a>
              
            <ul class="dropdown-menu" aria-labelledby="dropdown08" style="width: 176px;">
              <li style="padding-left: 11px; padding-right: 4px;"><a class="dropdown-item fw-bold text-secondary fs-2 pt-2 pb-2 border-bottom" href="listSG">&nbsp;소모임&nbsp;</a></li>
              <li style="padding-left: 7px;"><a class="dropdown-item fw-bold text-secondary fs-2 pt-2 pb-2" href="rest">맛집공유</a></li>
            </ul>
          </li>
          
          <!-- 메뉴 목록 -->
          <li class="nav-item">
            <a class="nav-link fw-bold text-secondary pt-5 pb-5" href="session?delete=3">공지사항</a>
          </li>
          <li class="nav-item">
            <a class="nav-link fw-bold text-secondary pt-5 pb-5" href="session?delete=4">문의사항</a>
          </li>
        </ul>
        
      </div>
      </div>
    </div>
  </nav>
  </header>
</body>
</html>