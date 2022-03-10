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
function update(){
	var qna_comment = document.getElementsByClassName("qna")[0].value;
	var qna_no = document.getElementById('qnano').value;
	location.href = '/listQna?qna_comment='+qna_comment+"&qna_no="+qna_no;

}

</script>
<style type="text/css">
	body{
		margin: 0 auto;	
		justify-content: center;
		width: 80%;

	}
	a{
	text-decoration: none; /* 링크의 밑줄 제거 */
  	color: inherit; /* 링크의 색상 제거 */
  	}
  	p{
  		text-align: center;
  	}
  	.container{
  		border: 3px black;
  		width: 80%;
  		margin: 0 auto;
  	}
  	textarea {
		resize: none;
	}

</style>
</head>
<body>
	<hr>
	<div class="container">
		<p class="fs-1">문의사항 관리</p>
		  <div class="mb-3 row">
		    <label for="staticEmail" class="col-sm-2 col-form-label">닉네임</label>
		    <div class="col-sm-10">
		      <input type="text" readonly class="form-control-plaintext" id="staticEmail" value="${q.member_nickname }">
		    </div>
		  </div>
		  <div class="mb-3 row">
		    <label for="staticEmail" class="col-sm-2 col-form-label">등록일</label>
		    <div class="col-sm-10">
		      <input type="text" readonly class="form-control-plaintext" id="staticEmail" value="${q.qna_date }">
		    </div>
		  </div>
		  <div class="mb-3 row">
		    <label for="staticEmail" class="col-sm-2 col-form-label">분류</label>
		    <div class="col-sm-10">
		      <c:if test="${q.qna_type==1 }"><input type="text" readonly class="form-control-plaintext" id="staticEmail" value="[비매너 회원 신고]"></c:if>
		      <c:if test="${q.qna_type==2 }"><input type="text" readonly class="form-control-plaintext" id="staticEmail" value="[기타문의사항]"></c:if>
		    </div>
		  </div>
		<div class="mb-3">
		  <label for="exampleFormControlInput1" class="form-label">제목</label>
		  <input type="email" class="form-control" id="exampleFormControlInput1" placeholder="${q.qna_title }" readonly="readonly">
		</div>
		<div class="mb-3">
		  <label for="exampleFormControlTextarea1" class="form-label">내용</label>
		  <textarea class="form-control" id="exampleFormControlTextarea1" rows="8" cols="100" readonly="readonly">${q.qna_content}</textarea>
		</div>
	</div>
	<hr>
	<div class="container">
		<p class="fs-1">문의사항 답변</p>
		<div class="form-floating">
			<form action="updateQna?qna_no=${q.qna_no }" method="post" class="form-floating" id="sm">
			<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
		  	<c:if test="${q.qna_process==0 }"><textarea class="form-control" placeholder="Leave a comment here" id="floatingTextarea2" style="height: 200px" name="qna_comment"></textarea></c:if>
		  	<c:if test="${q.qna_process==1 }"><textarea class="form-control" placeholder="Leave a comment here" id="floatingTextarea2" style="height: 200px" name="qna_comment" readonly="readonly">${q.qna_comment }</textarea></c:if>
		  	<label for="floatingTextarea2">Comments</label>
		  </form>
		  
		</div>
		<br>
			<c:if test="${q.qna_process==0 }">
			<div class="d-grid gap-2 col-6 mx-auto">
			<nav>
			<button type="submit" class="btn btn-primary btn-lg" form="sm">문의사항 답변</button>
			<button type="button" class="btn btn-secondary btn-lg" onclick="location.href = 'listQna' ">&nbsp;&nbsp;&nbsp;&nbsp;취소&nbsp;&nbsp;&nbsp;&nbsp;</button>
			</nav>
			</div>
			</c:if>
			<c:if test="${q.qna_process==1 }">
				<div class="d-grid gap-2 col-6 mx-auto">
				  <button class="btn btn-primary" type="button" onclick="location.href = 'listQna' ">목록</button>
				</div>
			</c:if>

	</div>
	<br>
</body>
</html>