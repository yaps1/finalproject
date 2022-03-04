<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script type="text/javascript">

		function checkInput(){
			let member_id = document.getElementById("member_id").value;
			let member_name = document.getElementById("member_name").value;
			let member_tel = document.getElementById("member_tel").value;
			if(member_id == ""){alert("아이디를 입력해주세요");}
			if(member_name == ""){alert("이름을 입력해주세요");}
			if(member_tel == ""){alert("휴대전화번호를 입력해주세요");}
		}


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
      <!-- 비밀번호 찾기 표시 -->
      <div class="modal-header p-3 pb-3 border-bottom-0" style="margin: 0 auto;">
        <h1 class="fw-bold mb-0 text-secondary">비밀번호 찾기</h2>
      </div>
      <div>
			<h5 class="text-secondary fw-6 text-center">본인확인을 위해 가입시 <br>등록한 이메일주소로 인증코드가 발송됩니다.</h5> <br>
      </div>
	  <!-- 전체 div -->
      <div class="modal-body p-5 pt-0">
        <form action="searchPwd" method="post">
      <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">		
       
        <!-- 입력태그 감싸는 div -->
         <div class="mb-3">
         <!-- 아이디 작성란 -->
          <div style="position: relative; text-align: right;">
	          <div style="display: inline-block; width: 60px; margin-right: 10px;">
	          	<label>아이디 </label>
	          </div>
	          <div class="form-floating mb-3" style="display: inline-block;">
	            <input type="email" class="form-control rounded-4" id="member_id" name="member_id" placeholder="아이디(이메일)" style="width: 310px;">
	            <label for="floatingId">아이디(이메일)</label>
	          </div>
          </div>
         <!-- 이름 작성란 -->
          <div style="position: relative; text-align: right;">
	          <div style="display: inline-block; width: 60px; margin-right: 10px;">
	          	<label>이름 </label>
	          </div>
	          <div class="form-floating mb-3" style="display: inline-block;">
	            <input type="text" class="form-control rounded-4" id="member_name" name="member_name" placeholder="이름(실명)" style="width: 310px;">
	            <label for="floatingName">이름(실명)</label>
	          </div>
          </div>
          <!-- 연락처 작성란 -->
          <div style="position: relative; text-align: right;">
	          <div style="display: inline-block; width: 60px; margin-right: 10px;">
		          	<label>연락처 </label>
		      </div>
	          <div class="form-floating mb-3" style="display: inline-block;">
	            <input type="text" class="form-control rounded-4" id="member_tel" name="member_tel" placeholder="휴대전화번호" style="width: 310px;" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" maxlength="11">
	            <label for="floatingTel">휴대전화번호('-'제외)</label>
	          </div>
          </div>
        
          
          <!-- 입력태그 감싸는 div 끝 -->
         </div>
         <!-- 버튼 -->
          <button class="w-100 mb-2 btn btn-lg rounded-4 btn-primary" type="submit" onclick="checkInput()">확인</button>
          <button class="w-100 mb-2 btn btn-lg rounded-4 btn-secondary" type="reset">취소</button>
        </form>
         <!-- 전체 div 끝-->
      </div>
    </div>
  </div>
</div>



</body>
</html>