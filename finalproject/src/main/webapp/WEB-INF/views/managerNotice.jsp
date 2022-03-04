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
		var no='';
		const query = 'input[name="checkedValue"]:checked';
		const selectedEls = 
		    document.querySelectorAll(query);
		 selectedEls.forEach((el) => {
			    no += el.value + ' ';
			  });
		//alert(no);
		if(no != ''){
			 if (confirm("공지게시글을 삭제하시겠습니까?")) {
	             // 확인 버튼 클릭 시 동작
	             alert("게시물을 삭제하였습니다.");
	             deleteN.submit();
	         } else {
	             // 취소 버튼 클릭 시 동작
	             //alert("동작을 취소했습니다.");
	         }
		}
		
	} 
</script>
<style type="text/css">
	body{

  		justify-content: center;
		width: 80%;
		text-align: center;
		margin: 0 auto;
	}
	a{
	text-decoration: none; /* 링크의 밑줄 제거 */
  	color: inherit; /* 링크의 색상 제거 */
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
	<hr>
	<p class="fs-1">공지사항 관리</p>

	
	<table class="table table-hover">
	  <thead>
	    <tr class="table-secondary">
	      <th scope="col">선택</th>
	      <th scope="col">번호</th>
	      <th scope="col">제목</th>
	      <th scope="col">작성일</th>
	    </tr>
	  </thead>
	  <tbody id="deleteNotice">
	  <form action="deleteNotice" method="post" name="deleteN">
	  <c:forEach var="n" items="${list }">
	  	    <tr class="table-secondary">
		      <td> <input class="form-check-input" type="checkbox" value="${n.notice_no}" id="flexCheckDefault" name="checkedValue"></td>
		      <td>${n.notice_no }</td>
		      <td><a href="managerDetailNotice?notice_no=${n.notice_no }">${n.notice_title }</a></td>
		      <td>${n.notice_date }</td>
		    </tr>
	  </c:forEach>
	  </tbody>
	</table>
	<br>
	<br>
	<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
	<button type="button" class="btn btn-outline-secondary" style="float: left" onclick="btn_delete()">선택삭제</button>
	</form>
	<button type="button" class="btn btn-outline-secondary" style="float: right"; onclick="location.href = 'insertNotice' ">작성하기</button>
	<br>
	<br>
	<ul style="list-style: none;">
		<c:if test="${prev > 0 }"><li><a href="managerNotice?pageNUM=${first-1 }" id='prev'>이전</a></li></c:if>
		<c:forEach var="i" begin="${first }" end="${last }">
			<c:if test="${i == pageNUM }"><li class='on'><a href="managerNotice?pageNUM=${i }">${i }</a></li></c:if>
			<c:if test="${i != pageNUM }"><li><a href="managerNotice?pageNUM=${i }">${i }</a></li></c:if>
		</c:forEach>
		<c:if test="${last < totalPage }"><li><a href="managerNotice?pageNUM=${last+1 }" id='next'>다음</a></li></c:if>
	</ul>
</body>
</html>