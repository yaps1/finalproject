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

</script>
<style type="text/css">
	#container{
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
<hr>
<div id="container">
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
	<c:if test="${n.notice_no > 1 }"><button type="button" class="btn btn-outline-secondary" onclick="location.href = 'detailNotice?notice_no=${n.notice_no-1 }' ">이전글</button></c:if>
	<c:if test="${n.notice_no < max }"><button type="button" class="btn btn-outline-secondary" onclick="location.href = 'detailNotice?notice_no=${n.notice_no +1 }' ">다음글</button></c:if>
	<button type="button" class="btn btn-outline-secondary" style="float: right"; onclick="location.href = 'listNotice' ">목록</button>
</div>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>