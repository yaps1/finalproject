<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<style type="text/css">
	th,td{
		text-align: center;
		text-valign: middle;
	}
	#reset{
	margin-right: 3px;
	}
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function () {
	$("tr").click(function() {
		let th = $(this).children();
		let gb_no = th.eq(0).text();
		location.href="detailGB?gb_no="+gb_no;
	});
});
</script>
</head>
<body>
	
	<br>
	<br>
	<h2 style="text-align : center;"><strong>공동구매</strong></h2>
	<br>
	
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
	  <div class="container-fluid" style="text-align : center; width: 60%">
	   
	   <!-- 검색 정렬 -->
	    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
	      <span class="navbar-toggler-icon"></span>
	    </button>
	    <div class="collapse navbar-collapse" id="navbarSupportedContent">
	      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
	        <li class="nav-item">
	          <a class="nav-link active navbar-brand" aria-current="page" href="listGB?orderColumn=gb_no">기본순</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link navbar-brand" href="listGB?orderColumn=gb_start_date">과거순</a>
	        </li>	        
	        <li class="nav-item dropdown">
	          <a class="nav-link dropdown-toggle navbar-brand" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
	            분류
	          </a>
	          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
	            <li><a class="dropdown-item" href="listGB?gb_category=1">ott</a></li>
	            <li><a class="dropdown-item" href="listGB?gb_category=2">음식</a></li>
	            <li><a class="dropdown-item" href="listGB?gb_category=3">기타</a></li>
	          </ul>
	        </li>
	      </ul>
			
			<div class="container-fluid d-flex align-items-center" style="width:30%; margin-left:-20px;">
			<form action="listGB" method="post" class="d-flex align-items-center">	
				<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
		        <input type="hidden" name="searchColumn" value="gb_title">
		        <input  class="form-control me-2" type="search" placeholder="제목" aria-label="Search" name="keyword">
		        <input type="submit" value="검색" class="btn btn-outline-secondary">
		    </form>
	    	</div>
	    	
	    	<!-- 검색결과 초기화 -->
	    	<form action="listGB" method="post" class="d-flex align-items-center">	
				<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
		        <input type="hidden" name="searchColumn" value="gb_title">
		        <input type="hidden" name="keyword">
		        <input type="hidden" name="gb_category" value="">
		        <input type="hidden" name="orderColumn" value="gb_no">
		        <input id="reset" type="submit" value="초기화" class="btn btn-outline-secondary">
	    	</form>
	    	
	    	<!-- 공동구매 등록 -->
		    <button id="insertgb" type="button" class="btn btn-outline-secondary" onclick="location.href='insertGB'">공동구매 등록</button>
	    </div>
	  </div>
	</nav>
    <br>
    <br>
    <br>
    <br>
    <div style="margin-left: auto; margin-right: auto; width: 60%">
	    <table class="table table-dark table-hover" >
	    	<thead>
		        <tr>
		            <th scope="col">번호</th>
		            <th scope="col">진행상태</th>
		            <th scope="col">분류</th>
		            <th scope="col">공구기간</th>
		            <th scope="col">제목</th>
		            <th scope="col">모집인원</th>
		        </tr>
	        </thead>
	        <tbody>
	        	<c:forEach var="g" items="${list }">
		            <tr class="table-secondary">
		                <th scope="row">${g.gb_no}</th>
		                <td>
		                <c:if test="${g.gb_state==1}">진행중</c:if>
		                <c:if test="${g.gb_state==0}">공구 종료</c:if>
		                </td>
		                <td>
		                <c:if test="${g.gb_category==1}">ott</c:if>
		                <c:if test="${g.gb_category==2}">식자재</c:if>
		                <c:if test="${g.gb_category==3}">기타</c:if>
		                </td>
		                <td>${g.gb_start_date} ~ ${g.gb_end_date}</td>
		                <td>${g.gb_title} </td>
		                <td>${g.gb_capacity}</td>
		            </tr>
	        	</c:forEach>
	        </tbody>
	    </table>
    </div>
	<br>
    <br>
    <br>
    <br>
    <!-- 페이징 -->
    <nav aria-label="Page navigation example">
	  <ul class="pagination justify-content-center">
	    <c:if test="${preGroup > 0 }"><li class="page-item"><a class="page-link" href="listGB?pageNum=${firstPage-1 }" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li></c:if>
	    <c:forEach var="i" begin="${firstPage }" end="${lastPage }">
	    	<c:if test="${i == pageNum }"><li class="page-item"><a class="page-link" href="listGB?pageNum=${i }">${i }</a></li></c:if>
	    	<c:if test="${i != pageNum }"><li class="page-item"><a class="page-link" href="listGB?pageNum=${i }">${i }</a></li></c:if>
	    </c:forEach>
	    <c:if test="${lastPage < totalPage }"><li class="page-item"><a class="page-link" href="listGB?pageNum=${lastPage+1}" aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li></c:if>
	  </ul>
	</nav>
	
    <br>
    <br>
    <br>
    <br>
</body>
</html>