<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#deleteMember").click(function(){
			var cnt = $("input[name='checkMember']:checked").length;
			var arr = new Array();
			$("input[name='checkMember']:checked").each(function(){
				arr.push($(this).attr('id'))	
			});
			//alert(cnt);
			//alert(arr);
			if(cnt == 0){
				alert("강퇴할 회원이 없습니다.");
			}
			
			$.ajax({
				url:"deleteListMember",
				type:"post",
				data:{arr:arr},
				success:function(){
					alert("강퇴 성공하였습니다.");
					location.href="/managerListMember";
				}
			})
			
			
		})
	});
	
</script>
</head>
<body>
<div style="width: 60%; height:900px; margin: 0 auto; text-align: center; padding: 100px 0px;">
	<!-- 회원관리 테이블 -->
	<p class="display-5 text-bold mb-4">회원 관리</p>
	<table class="table  table-border">
		<thead>
			<tr class="table-secondary">
				<td>선택</td>
				<td>회원번호</td>
				<td>아이디</td>
				<td>이름</td>
				<td>닉네임</td>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="member" items="${listmember }">
			<tr>
				<td style="text-align: center;">
					<!-- checkbox로 강퇴할 회원 선택 가능 -->
					<input class="form-check-input" type="checkbox" name="checkMember" id="${member.member_no }" style="margin: 0 auto;">
				</td>
				<td>${member.member_no }</td>
				<td>${member.member_id }</td>
				<td>${member.member_name }</td>
				<td>${member.member_nickname }</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	<!-- 강퇴 버튼 -->
	<div>
		<button class="btn btn-lg btn-primary" id="deleteMember" style="width:110px; float: left;">강퇴</button>
	</div>
	<!-- 회원관리 페이징 처리 -->
	<div style="padding: 80px;">
		<nav aria-label="Page navigation">
	 	 <ul class="pagination pagination-lg link-hover justify-content-center">  
	    	<c:forEach var="i" begin="1" end="${totalPage }">
	    	<li class="page-item"><a style="color: inherit;" class="page-link text-secondary" href="managerListMember?pageNum=${i}">${i }</a>&nbsp;&nbsp;</li>
	    	</c:forEach> <br>
	 	 </ul>
		</nav>
	</div>		
</div>
</body>
</html>