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
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	
</script>
</head>
<jsp:include page="header2.jsp"></jsp:include>
<body>
  <div style="width: 100%; height: 1000px;">
	<div style="margin: 0 auto; padding:100px 500px 130px;">
		<div class="mb-5">
		<h1 class="fw-bold display-4 text-secondary text-center">커뮤니티 소모임</h1>
		</div>
		<div class="mb-3">
		<table class="table table-hover table-striped table-borderless">
			<thead>
				<tr class="table-secondary">
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
				</tr>
			</thead>
		<tbody>
		<c:forEach var="s" items="${list }">
			<tr>
				<td>${s.sg_no}</td>
				<td><a href="getSG?sg_no=${s.sg_no}">${s.sg_title }</a></td>
				<td>${s.member_nickname }</td>
				<td>${s.sg_date }</td>			
			</tr>
		</c:forEach>
		</tbody>
		</table>
		</div>
		
		<div class="mb-2" style="float: right; padding:0px;">
			<button class="mb-2 btn btn-lg rounded-4 btn-primary" style="padding-left: 30px; padding-right: 30px; height: 60px;" type="button" onclick="location.href='insertSG'">작성하기</button>
		</div>
		
		<div style="padding: 80px;">
		<nav aria-label="Page navigation">
		  <ul class="pagination pagination-lg link-hover justify-content-center">  
		    <c:forEach var="i" begin="1" end="${totalPage }">
		    <li class="page-item"><a style="color: inherit;" class="page-link text-secondary" href="listSG?pageNum=${i}">${i }</a>&nbsp;&nbsp;</li>
		    </c:forEach> <br>
		  </ul>
		</nav>
		</div>		
		
		
	</div>
</div>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>