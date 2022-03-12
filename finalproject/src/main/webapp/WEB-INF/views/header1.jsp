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
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function name() {
	$("#search").click(function(){
		let searchkeyword = $("#searchkeyword").val();
		location.href="search?searchkeyword="+searchkeyword;
	});
});
</script>
</head>
<body>

<header class="fixed-top;">

 <div class="p-1 bg-secondary bg-gradient text-end text-white d-flex justify-content-end">
         <c:if test="${not empty m}">
			<ul style="display: inline-block;">
		
			<li class="text-end text-white" id="top-header" style="float: left;"><a href="mypage?member_no=${m.member_no }">마이페이지</a><li>
			<li class="text-end text-white" id="top-header" style="float: left;"><a href="saguPalguTalk">4989톡<i class="bi bi-chat-quote-fill" style="margin-left: 5px;"></i></a><li>
			<li class="text-end text-white" id="top-header" style="float: right;"><a href="logout">로그아웃</a><li> 	
	         </ul>
		 </c:if>
		
         <c:if test="${empty m}">
          <ul>
         	<li class="text-end text-white" id="top-header"><a href="/jointype">로그인/회원가입</a><li>
         </ul>
         </c:if>
        
 </div>

<nav class="navbar navbar-expand-lg navbar-light bg-light border-bottom p-0 m-0" aria-label="Tenth navbar example">
 
    <div>
   		<a href="main"><img src="../images/4989_logo.png" style="width: 200px; height: 100px; padding-left: 40px;" ></a>
   	</div>
  
    <div class="container position-relative" style="margin: 0 auto; padding-left: 0; padding-right: 150px;">
      <div class="collapse navbar-collapse justify-content-center" id="navbarsExample08">
      <div class="container-fluid" style="text-align: center; width: 25%;">
	    <form class="d-flex" name="search-form" autocomplete="off">
	      <input style="width: 20rem;height: 3rem;" class="form-control me-2" type="text" placeholder="통합검색" aria-label="Search"  name="searchkeyword" id="searchkeyword">
	      <input style="width: 5rem;height: 3rem;" type="button" id="search" value="검색" class="btn btn-outline-secondary">
	    </form>
	  </div>
      </div>
    </div>
  </nav>
  </header>
</body>
</html>