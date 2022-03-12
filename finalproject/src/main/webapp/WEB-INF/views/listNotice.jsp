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

 });
</script>
<style type="text/css">
	#container{

  		justify-content: center;
		width: 80%;
		text-align: center;
		margin: 0 auto;
	}
	.notice_a{
	text-decoration: none; /* 링크의 밑줄 제거 */
  	color: inherit; /* 링크의 색상 제거 */
  	}
  	#searchColumn{
  		display: flex;
  		justify-content: center;
  		width: 40%;
  	}
  	

</style>
</head>
<body>
<jsp:include page="header2.jsp"></jsp:include>
	<hr>
	<div id="container">
		<p class="fs-1">공지사항</p>
		
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
		  <div class="container-fluid">
		    <a class="navbar-brand" href="#">검색</a>
		    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
		      <span class="navbar-toggler-icon"></span>
		    </button>
		    <div class="collapse navbar-collapse" id="navbarSupportedContent">
		      <form class="d-flex" action="listNotice" method="post">
		      <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
		      	<select class="form-select" aria-label="Default select example" name="searchColumn" id="searchColumn">
					<option value="notice_title" selected>제목</option>
					<option value="notice_content">내용</option>
					<option value="notice_date">작성일</option>		
				</select>
		        <input class="form-control me-2" type="search" placeholder="내용을 입력해주세요" aria-label="Search" name="keyword" id="keyword">
		        <button class="btn btn-outline-success" type="submit">검&nbsp;색</button>
		       </form> 
		    </div>
		  </div>
		</nav>
		
		<table class="table table-hover">
		  <thead>
		    <tr class="table-secondary">
		      <th scope="col">번호</th>
		      <th scope="col">제목</th>
		      <th scope="col">작성일</th>
		      <th scope="col">조회수</th>
		    </tr>
		  </thead>
		  <tbody id="listNotice">
		  <c:forEach var="n" items="${list }">
		  	    <tr class="table-secondary">
			      <th scope="row">${n.notice_no }</th>
			      <td><a href="detailNotice?notice_no=${n.notice_no }" class="notice_a">${n.notice_title }</a></td>
			      <td>${n.notice_date }</td>
			      <td>${n.notice_hit }</td>
			    </tr>
		  </c:forEach>
		  </tbody>
		</table>
		<br>
		<br>
		<div> 
			<nav aria-label="Page navigation example">
				<ul style="list-style: none;" class="pagination justify-content-center">
					<c:if test="${prev > 0 }"><li class="page-item"><a href="listNotice?pageNUM=${first-1 }" id='prev' class="page-link">이전</a></li></c:if>
					<c:forEach var="i" begin="${first }" end="${last }">
						<c:if test="${i == pageNUM }"><li class="page-item active"><a href="listNotice?pageNUM=${i }" class="page-link">${i }</a></li></c:if>
						<c:if test="${i != pageNUM }"><li class="page-item"><a href="listNotice?pageNUM=${i }" class="page-link">${i }</a></li></c:if>
					</c:forEach>
					<c:if test="${last < totalPage }"><li class="page-item"><a href="listNotice?pageNUM=${last+1 }" id='next' class="page-link">다음</a></li></c:if>
				</ul>
			</nav>
		</div>
		<br>
	</div>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>