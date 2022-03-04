<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function() {
	function handleInputLength(el, max) {
		  if(el.value.length > max) {
		    el.value = el.value.substr(0, max);
		    alert("비밀번호");
		  }
	};
	
	$("#updateMember").click(function(){
  		$.ajax({
  			url:"updateMember",
  			data:$("#f").serializeArray(),
  			success:function(r){
  				alert("회원 정보 수정 완료");
  				$("#memberModal").hide();
  				$('.modal-backdrop').hide();
  			}
  		});
  	});
	
	$("#deleteMember").click(function(){
  		$.ajax({
  			url:"/deleteMember",
  			data:$("#f").serializeArray(),
  			success:function(r){
  				alert("회원 탈퇴 완료");
  				$("#memberModal").hide();
  				$('.modal-backdrop').hide();
  				location.replace("/header1.jsp");
  			}
  		});
  	});

});
</script>
</head>
<body>
	<jsp:include page="../../header2.jsp"></jsp:include>
	<br>
	<br>
	<br>
	<br>
	<h2 style="text-align : center;"><strong> 마이페이지</strong></h2>
	<p style="text-align : center;">${m.member_name }</p>
	<p style="text-align : center;">${m.member_id }</p>
	<br>
	<br>
	<div style="text-align : center;">
		<a href="#"  data-toggle="modal" data-target="#memberModal" id="member"><img src="/images/내정보수정.png" height="400" width="400"></a>
		<a href="/memberWriting?member_no=${m.member_no }"><img src="/images/작성글관리.png" height="400" width="400"></a>
		<a href="/memberGoods?member_no=${m.member_no }"><img src="/images/상품.png" height="400" width="400"></a>
	</div>

	<div class="modal fade" id="memberModal" data-backdrop="static">
    <div class="modal-dialog modal-lg modal-dialog-centered modal-dialog-scrollable">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title"><strong>내 정보 수정</strong></h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
        
        <form id="f">
        <input type="hidden" name="member_no" id="member_no" value="${m.member_no}">
        <span>아이디 </span> <input type="text" value="${m.member_id }" readonly="readonly" class="form-control"><br>
        <span>비밀번호 </span> <input type="password" value="${m.member_pwd }" maxlength="14" oninput="handleInputLength(this, 14)" class="form-control"><br>
        <p id="maxPwd"></p>
        <span>비밀번호 확인</span> <input type="password" name="member_pwd" id="member_pwd" value="${m.member_pwd }" maxlength="14" class="form-control"><br>
        <span>이름</span> <input type="text"  value="${m.member_name }" readonly="readonly" class="form-control"><br>
        <span>닉네임</span> <input type="text" name="member_nickname" id="member_nickname" value="${m.member_nickname }" class="form-control"><br>
        <span>성별</span> <input type="text" value="${m.member_gender }" class="form-control" readonly="readonly"><br>
        <span>연락처</span> <input type="text" name="member_tel" id="member_tel" value="${m.member_tel }" class="form-control"><br>
        <span>생년월일</span> <input type="text" value="${m.member_birth }" readonly="readonly" class="form-control"><br>
        <span>주소</span> <input type="text" name="member_addr" id="member_addr" value="${m.member_addr }" class="form-control"><br>
        <span>지역인증</span> <input type="text" name="member_loc" id="member_loc" value="${m.member_loc }">
       	</form>
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-primary" id="updateMember">수정</button>
          <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
          <button type="button" class="btn btn-primary" id="deleteMember">회원탈퇴</button>
        </div>
	      </div>
	    </div>
	</div>
	<br>
	<br>
	<br>
	<br>
</body>
</html>