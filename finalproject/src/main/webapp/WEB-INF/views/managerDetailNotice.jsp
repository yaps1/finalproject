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

function btn_delete(){

		 if (confirm("공지게시글을 삭제하시겠습니까?")) {
             // 확인 버튼 클릭 시 동작
             alert("게시물을 삭제하였습니다.");
             deleteN.submit();
         } else {
             // 취소 버튼 클릭 시 동작
             //alert("동작을 취소했습니다.");
         }
	
} 
</script>
<style type="text/css">
	.container{
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

</style>
</head>
<body>
<jsp:include page="header2.jsp"></jsp:include>
<div id="container"></div>
<hr>
	<table border="2">
	    <tr>
	      <th>제목</th>
	      <td>${n.notice_title }</td>
	    </tr>
	    <tr>
	      <th>내용</th>
	      <td rowspan="3">${n.notice_content }<br>
	      <c:if test="${not empty img }"><img  src="upload/${img }" width="500px" height="500px"></c:if>
	      </td>
	      
	    </tr>
	    <tr>
	      <th></th>
	      <td></td>
	    </tr>
	    <tr>
	      <th></th>
	      <td></td>
	    </tr>
	    <tr>
	      <th>첨부파일</th>
	      <td>${n.notice_file }</td>
	    </tr>
	</table>
	<br>
	<br>
	<c:if test="${n.notice_no > 1 }"><button type="button" class="btn btn-outline-secondary" onclick="location.href = 'managerDetailNotice?notice_no=${n.notice_no-1 }' ">이전글</button></c:if>
	<c:if test="${n.notice_no < max }"><button type="button" class="btn btn-outline-secondary" onclick="location.href = 'managerDetailNotice?notice_no=${n.notice_no +1 }' ">다음글</button></c:if>
	<form action="deleteNotice" method="post" name="deleteN">
		<button type="button" class="btn btn-outline-secondary" style="float: right"; onclick="location.href = 'updateNotice?notice_no=${n.notice_no}' ">수정</button>
		
		<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
		<input type="hidden" value="${n.notice_no } " name="checkedValue">
		<button type="button" class="btn btn-outline-secondary" style="float: right"; onclick="btn_delete()">삭제</button>
		<button type="button" class="btn btn-outline-secondary" style="float: right"; onclick="location.href = 'managerNotice' ">목록</button>
	</form>
	</body>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>