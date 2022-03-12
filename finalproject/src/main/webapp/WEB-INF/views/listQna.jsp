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

	function check1() {

	 var qna_process = document.getElementsByClassName("qna_process")[0].value;
	 location.href = '/listQna?qna_process='+qna_process;
	}
	function check2() {

	 var qna_process = document.getElementsByClassName("qna_process")[1].value;
	 location.href = '/listQna?qna_process='+qna_process;
	}
	function check3() {

	 var qna_process = document.getElementsByClassName("qna_process")[2].value;
	 location.href = '/listQna?qna_process='+qna_process;
	}
</script>
<style type="text/css">
	#container{

  		justify-content: center;
		width: 80%;
		text-align: center;
		margin: 0 auto;
	}
	a{
	text-decoration: none; /* 링크의 밑줄 제거 */
  	color: inherit; /* 링크의 색상 제거 */
  	}
  	#searchColumn{
  		display: flex;
  		justify-content: center;
  		width: 40%;
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
	<br>
	<br>
	<br>
	<h2 style="text-align : center;"><strong><a href="../../manager.jsp" class="link-dark" style="text-decoration-line : none;">관리자</a></strong></h2>
	<br>
	<br>
	<!-- 네비게이션바 -->
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
	  <div class="container-fluid" style="text-align : center; width: 70%">
	    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
	      <li class="nav-item">
	       <a class="navbar-brand" href="chart">차트분석</a>
	      </li>
	      <li class="nav-item">
	       <a class="navbar-brand" href="managerListMember">회원관리</a>
	      </li>
	      <li class="nav-item">
	       <a class="navbar-brand" href="listNotice">공지사항관리</a>
	      </li>
	      <li class="nav-item">
	       <a class="navbar-brand" href="">문의사항관리</a>
	      </li>
	    </ul>
	  </div>
	</nav>
	<hr>
	<div id="container">
	<p class="fs-1">문의사항 관리</p>
	<nav>
	  <div class="nav nav-tabs" id="nav-tab" role="tablist">
	  <c:if test="${qna_process==-1 }">
	    <button class="nav-link active qna_process" id="nav-home-tab" data-bs-toggle="tab" data-bs-target="#nav-home" type="button" role="tab" aria-controls="nav-home" aria-selected="true" value="-1" onclick="check1()">전체</button>
	    <button class="nav-link qna_process" id="nav-profile-tab" data-bs-toggle="tab" data-bs-target="#nav-profile" type="button" role="tab" aria-controls="nav-profile" aria-selected="false" value="0" onclick="check2()">답변대기</button>
	    <button class="nav-link qna_process" id="nav-contact-tab" data-bs-toggle="tab" data-bs-target="#nav-contact" type="button" role="tab" aria-controls="nav-contact" aria-selected="false" value="1" onclick="check3()">답변완료</button>
	  </c:if>
	  <c:if test="${qna_process==0 }">
	    <button class="nav-link qna_process" id="nav-home-tab" data-bs-toggle="tab" data-bs-target="#nav-home" type="button" role="tab" aria-controls="nav-home" aria-selected="true" value="-1" onclick="check1()">전체</button>
	    <button class="nav-link active qna_process" id="nav-profile-tab" data-bs-toggle="tab" data-bs-target="#nav-profile" type="button" role="tab" aria-controls="nav-profile" aria-selected="false" value="0" onclick="check2()">답변대기</button>
	    <button class="nav-link qna_process" id="nav-contact-tab" data-bs-toggle="tab" data-bs-target="#nav-contact" type="button" role="tab" aria-controls="nav-contact" aria-selected="false" value="1" onclick="check3()">답변완료</button>
	  </c:if>
	  <c:if test="${qna_process==1 }">
	    <button class="nav-link qna_process" id="nav-home-tab" data-bs-toggle="tab" data-bs-target="#nav-home" type="button" role="tab" aria-controls="nav-home" aria-selected="true" value="-1" onclick="check1()">전체</button>
	    <button class="nav-link qna_process" id="nav-profile-tab" data-bs-toggle="tab" data-bs-target="#nav-profile" type="button" role="tab" aria-controls="nav-profile" aria-selected="false" value="0" onclick="check2()">답변대기</button>
	    <button class="nav-link active qna_process" id="nav-contact-tab" data-bs-toggle="tab" data-bs-target="#nav-contact" type="button" role="tab" aria-controls="nav-contact" aria-selected="false" value="1" onclick="check3()">답변완료</button>
	  </c:if>
	  </div>
	</nav>
	<div class="tab-content" id="nav-tabContent">
	  <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
	  	<table class="table table-hover">
		  <thead>
		    <tr class="table-secondary">
		      <th scope="col">번호</th>
		      <th scope="col">유형</th>
		      <th scope="col">제목</th>
		      <th scope="col">작성일</th>
		      <th scope="col">작성자</th>
		      <th scope="col">처리상태</th>
		    </tr>
		  </thead>
		  <tbody id="listQna">
		  <c:forEach var="q" items="${list }">
		  	    <tr class="table-secondary">
			      <th scope="row">${q.qna_no }</th>
			      <c:if test="${q.qna_type ==1 }"><td>비매너 신고</td></c:if>
			      <c:if test="${q.qna_type ==2 }"><td>문의사항</td></c:if>
			      <td><a href="ansQna?qna_no=${q.qna_no }">${q.qna_title }</a></td>
			      <td>${q.qna_date }</td>
			      <td>${q.member_nickname }</td>
			      <c:if test="${q.qna_process ==0 }"><td>답변대기</td></c:if>
			      <c:if test="${q.qna_process ==1 }"><td>답변완료</td></c:if>
			    </tr>
		  </c:forEach>
		  </tbody>
		</table>
		<br>
		<br>
		<ul style="list-style: none;">
			<c:if test="${prev > 0 }"><li><a href="listQna?pageNUM=${first-1 }&qna_process=${qna_process}" id='prev'>이전</a></li></c:if>
			<c:forEach var="i" begin="${first }" end="${last }">
				<c:if test="${i == pageNUM }"><li class='on'><a href="listQna?pageNUM=${i }&qna_process=${qna_process}">${i }</a></li></c:if>
				<c:if test="${i != pageNUM }"><li><a href="listQna?pageNUM=${i }"&qna_process=${qna_process}>${i }</a></li></c:if>
			</c:forEach>
			<c:if test="${last < totalPage }"><li><a href="listQna?pageNUM=${last+1 }&qna_process=${qna_process}" id='next'>다음</a></li></c:if>
		</ul>
	  </div>
	  <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
	  	<table class="table table-hover">
		  <thead>
		    <tr class="table-secondary">
		      <th scope="col">번호</th>
		      <th scope="col">유형</th>
		      <th scope="col">제목</th>
		      <th scope="col">작성일</th>
		      <th scope="col">작성자</th>
		      <th scope="col">처리상태</th>
		    </tr>
		  </thead>
		  <tbody id="listQna">
		  <c:forEach var="q" items="${list }">
		  	    <tr class="table-secondary">
			      <th scope="row">${q.qna_no }</th>
			      <c:if test="${q.qna_type ==1 }"><td>비매너 신고</td></c:if>
			      <c:if test="${q.qna_type ==2 }"><td>문의사항</td></c:if>
			      <td><a href="ansQna?qna_no=${q.qna_no }">${q.qna_title }</a></td>
			      <td>${q.qna_date }</td>
			      <td>${q.member_nickname }</td>
			      <td>답변대기</td>
			    </tr>
		  </c:forEach>
		  </tbody>
		</table>
		<br>
		<br>
		<ul style="list-style: none;">
			<c:if test="${prev > 0 }"><li><a href="listQna?pageNUM=${first-1 }&qna_process=${qna_process}" id='prev'>이전</a></li></c:if>
			<c:forEach var="i" begin="${first }" end="${last }">
				<c:if test="${i == pageNUM }"><li class='on'><a href="listQna?pageNUM=${i }&qna_process=${qna_process}">${i }</a></li></c:if>
				<c:if test="${i != pageNUM }"><li><a href="listQna?pageNUM=${i }&qna_process=${qna_process}">${i }</a></li></c:if>
			</c:forEach>
			<c:if test="${last < totalPage }"><li><a href="listQna?pageNUM=${last+1 }&qna_process=${qna_process}" id='next'>다음</a></li></c:if>
		</ul>
	  </div>
	  <div class="tab-pane fade" id="nav-contact" role="tabpanel" aria-labelledby="nav-contact-tab">
	  	<table class="table table-hover">
		  <thead>
		    <tr class="table-secondary">
		      <th scope="col">번호</th>
		      <th scope="col">유형</th>
		      <th scope="col">제목</th>
		      <th scope="col">작성일</th>
		      <th scope="col">작성자</th>
		      <th scope="col">처리상태</th>
		    </tr>
		  </thead>
		  <tbody id="listQna">
		  <c:forEach var="q" items="${list }">
		  	    <tr class="table-secondary">
			      <th scope="row">${q.qna_no }</th>
			      <c:if test="${q.qna_type ==1 }"><td>비매너 신고</td></c:if>
			      <c:if test="${q.qna_type ==2 }"><td>문의사항</td></c:if>
			      <td><a href="ansQna?qna_no=${q.qna_no }">${q.qna_title }</a></td>
			      <td>${q.qna_date }</td>
			      <td>${q.member_nickname }</td>
			      <td>답변완료</td>
			    </tr>
		  </c:forEach>
		  </tbody>
		</table>
		<br>
		<br>
		<ul style="list-style: none;">
			<c:if test="${prev > 0 }"><li><a href="listQna?pageNUM=${first-1}&qna_process=${qna_process}" id='prev'>이전</a></li></c:if>
			<c:forEach var="i" begin="${first }" end="${last }">
				<c:if test="${i == pageNUM }"><li class='on'><a href="listQna?pageNUM=${i}&qna_process=${qna_process}">${i }</a></li></c:if>
				<c:if test="${i != pageNUM }"><li><a href="listQna?pageNUM=${i}&qna_process=${qna_process}">${i }</a></li></c:if>
			</c:forEach>
			<c:if test="${last < totalPage }"><li><a href="listQna?pageNUM=${last+1}&qna_process=${qna_process}" id='next'>다음</a></li></c:if>
		</ul>
	  </div>
	</div>
</div>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>