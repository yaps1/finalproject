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

function update() {

 var qna_comment = document.getElementsByClassName("qna")[0].value;
 location.href = '/listQna?qna_comment='+qna_comment;
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
	th{
		width: 20%;
	}
	td{
		width: 80%;
	}
	textarea {
		resize: none;
	}

</style>
</head>
<body>
<hr>
<p class="fs-1" style="text-align: center">공지사항 수정</p>
	<form action="updateNotice?notice_no=${n.notice_no }" method="post"
					enctype="multipart/form-data" class="form-floating" id="sm">
	<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
	<div class="mb-3">
	<table border="2">
	    <tr>
	      <th>제목</th>
	      <td><input type="text" class="form-control" id="exampleFormControlInput1" name="notice_title" value="${n.notice_title }"></td>
	    </tr>
	    <tr>
	      <th>내용</th>
	      <td><textarea class="form-control" aria-label="With textarea" name="notice_content" rows="8" cols="100" >${n.notice_content }</textarea></td>
	    </tr>
	    <tr>
	      <th>첨부파일</th>

		    <td><div class="mb-3">
				  <input class="form-control" type="file" id="formFile" name="uploadFile">
				</div>   

			<label for="inputPassword" class="col-sm-2 col-form-label">수정 전 파일</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" id="inputPassword" name="notice_file" value="${n.notice_file }" readonly="readonly">
		    </div>
	      </td>

	    </tr>
	</table>
	</div>
	<br>
	<br>
	</form>
	<button type="button" class="btn btn-outline-secondary" onclick="location.href = 'managerNotice' ">목록</button>
	<div class="d-grid gap-2 col-6 mx-auto">
		<nav>
		
		<button type="submit" class="btn btn-outline-secondary" form="sm">수정</button>
		<button type="button" class="btn btn-outline-secondary" onclick="location.href = 'managerDetailNotice?notice_no=${n.notice_no}' ">취소</button>
		</nav>
	</div>
	
</body>
</html>