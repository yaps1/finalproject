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
	//$(function(){
	//	$("#updateSG").on("click", function(){
	//		$("#updateForm").submit();
	//		location.href = "getSG?sg_no=${s.sg_no}";
	//	});
	//});
	
	
	
</script>
</head>
<body >
<jsp:include page="header2.jsp"></jsp:include>
   <div style="height: 1200px; padding:130px;">
	<div class="container">
		<form class="border p-5" id="updateForm" action="updateSG" method="post" style="margin: 0 auto; width: 800px;">
			<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
			<input type="hidden" name="sg_no" id="sg_no" value="${s.sg_no }"> 
			<!-- 소모임 등록 표시 -->
			<div class="mb-5">
			<h1 class="text-secondary fw-bold display-4 text-center">소모임 수정</h1>
			</div>
			<!-- 게시글 제목 -->
			<div class="mb-5">
			  <label for="sg_title" class="form-label pb-2 text-secondary fw-bold h3">게시글 제목</label>
			  <input type="text" name="sg_title" class="form-control" id="sg_title" value="${s.sg_title }" style="height: 50px;">
			</div>
			<!-- 게시글 내용 -->
			<div class="mb-0 pb-0">
			  <label for="sg_content" class="form-label pb-2 text-secondary fw-bold h3">게시글 내용</label>
			  <textarea class="form-control" name="sg_content" id="sg_content" rows="15">${s.sg_content }</textarea>
			</div>
			<!-- 회원번호, 회원 닉네임 -->
			<input type="hidden" name="member_no" id="member_no" value="${s.member_no }"> <br>
			<input type="hidden" name="member_nickname" id="member_nickname" value="${s.member_nickname}"> <br>
			<!-- 버튼 -->
			<div style="display: inline-block; width: 100%;">
				<div style="float: left;">
				<button class="mb-2 btn btn-lg rounded-4 btn-primary" id="updateSG" style="width: 340px; height: 60px;" type="submit">수정</button>
				</div>
				
				<div style="float: right;">
				<button class="mb-2 btn btn-lg rounded-4 btn-dark" style="width: 340px; height: 60px;" type="reset">취소</button>
				</div>
			</div>
		</form>
	</div>
</div>  
</body>
</html>