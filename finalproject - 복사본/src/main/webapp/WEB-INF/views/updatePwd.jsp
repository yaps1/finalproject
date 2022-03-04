<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function(){
		
		//$("#member_pwd").on('keyup',function(){
		//	if($("#member_pwd").val()=""){
		//		alert("비밀번호는 필수정보입니다.");
		//	}
		//});
	
		$("#btn").click(function check_pwd(){
			let member_pwd = document.getElementById("member_pwd").value;
			let member_pwd_check = document.getElementById("member_pwd_check").value;
			
			if(member_pwd==member_pwd_check){
				alert("비밀번호가 일치합니다.");
				location.href='/login';
				return true;
			}else{
				alert("비밀번호가 다릅니다.");		
				false;
			}
		});
		
		
		
});
	
	
	
</script>
</head>
<body>
<div class="modal modal-signin position-static d-block py-5" tabindex="-1" role="dialog" id="modalSignin">
  <div class="modal-dialog" role="document">
    <div class="modal-content rounded-5 shadow">
      
       <!-- 닫기 버튼 -->
	  <div class="modal-close bg-secondary bg-gradient border-bottom-1 mb-3">
	    <button type="button" class="btn-close bg-light" data-bs-dismiss="modal" aria-label="Close" style="float: right; margin: 10px;"></button>
	  </div> 
      <!-- 비밀번호 재설정 표시 -->
     <div class="modal-header p-3 pb-2 border-bottom-0 mb-2" style="margin: 0 auto; display: block;">
        <h1 class="fw-bold mb-0 text-secondary mb-3" style="text-align: center;">비밀번호 재설정</h2>
        <h5 class="text-muted" style="text-align: center;">비밀번호를 재설정합니다.</h5>
      </div>
	  <!-- 전체 div -->
      <div class="modal-body p-5 pt-0">
        <form action="updatePwd" method="post" onsubmit="return check_pwd();">
        	<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
			
        <!-- 입력태그 감싸는 div -->
         <div class="mb-3">
         
         <!-- test -->
         <!-- 아이디 작성란 -->
          <div style="position: relative; text-align: right;">
	          <div style="display: inline-block; width: 120px; margin-right: 10px;">
	          	<label>아이디 </label>
	          </div>
	          <div class="form-floating mb-3" style="display: inline-block;">
	            <input type="email" class="form-control rounded-4" id="member_id" name="member_id" placeholder="아이디(이메일)" style="width: 260px;">
	            <label for="floatingId">아이디(이메일)</label>
	          </div>
          </div>
         <!-- test -->
         
         
         <!-- 비밀번호 -->
         
          <div style="position: relative; text-align: right;">
	          <div style="display: inline-block; width: 120px;">
	          	<label>비밀번호</label>
	          </div>
	          <div class="form-floating mb-3" style="display: inline-block;">
	            <input type="text" class="form-control rounded-4" id="member_pwd" name="member_pwd" placeholder="비밀번호" style="width: 260px;">
	            <label for="floatingPwd">비밀번호</label>
	          </div>
          </div>
          <!-- 비밀번호 확인 --> 
          <div style="position: relative; text-align: right;">
	          <div style="display: inline-block; width: 120px;">
		          	<label>비밀번호 확인 </label>
		      </div>
	          <div class="form-floating mb-3" style="display: inline-block;">
	            <input type="text" class="form-control rounded-4" id="member_pwd_check" name="member_pwd_check" placeholder="비밀번호 확인" style="width: 260px;">
	            <label for="floatingPwdCheck">비밀번호 확인</label>
	          </div>
          </div>
           
          <!-- 입력태그 감싸는 div 끝 -->
         </div>
         <!-- 버튼 -->
          <button id="btn" class="w-100 mb-2 btn btn-lg rounded-4 btn-primary" type="submit">확인</button>
          <button class="w-100 mb-2 btn btn-lg rounded-4 btn-secondary" type="reset">취소</button>
        </form>
         <!-- 전체 div 끝-->
      </div>
    </div>
  </div>
</div>
</body>
</html>