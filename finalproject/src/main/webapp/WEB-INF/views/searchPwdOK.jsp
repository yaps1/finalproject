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
 		
 		let email_injeung = document.getElementById("email_injeung").value;
 		//if(email_injeung==""){alert("인증코드를 입력해주세요");}
 		
 		$("#btn").click(function(){
 			check_email_injeung();
 		});
 		
 		function check_email_injeung(){
 			let email_injeung = document.getElementById("email_injeung").value;
 			let code = document.getElementById("code").value;
 			
 			if(email_injeung==code){
 				alert("인증완료되었습니다.");
 				location.href='/updatePwd';
 			}else{
 				alert("입력값이 틀렸습니다.");		
 			}
 		}
 		
 		$(".btn-close").click(function(){
 		 	location.href="/login";
 		});
 		
 		
 	});
</script>
</head>
<body>

<input type="hidden" id="code" value="${code }"><br>
<div class="modal modal-signin position-static d-block py-5" tabindex="-1" role="dialog" id="modalSignin">
  <div class="modal-dialog" role="document">
    <div class="modal-content rounded-5 shadow">
      
       <!-- 닫기 버튼 -->
	  <div class="modal-close bg-secondary bg-gradient border-bottom-1 mb-3">
	    <button type="button" class="btn-close bg-light" data-bs-dismiss="modal" aria-label="Close" style="float: right; margin: 10px;"></button>
	  </div> 
      <!-- 비밀번호 찾기 표시 -->
      <div class="modal-header p-3 pb-3 border-bottom-0 mb-2" style="margin: 0 auto; display: block;">
        <h1 class="fw-bold mb-0 text-secondary mb-1" style="text-align: center;">비밀번호 찾기</h2>
        <h5 class="text-muted mt-3" style="text-align: center;">인증코드를 입력해주세요.</h5>
      </div>
	<div>
  </div>
  	  <!-- 비밀번호 찾기 전체 div -->
      <div class="modal-body p-5 pt-0">
        <form action="searchPwdOK" method="post">
	  <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
	  	<!-- 인증코드 작성란 -->
          <div style="position: relative;">
	          <div style="display: inline-block; width: 80px; line-height:58px; float: left; text-align: center;">
	          	<label>인증코드 :</label>
	          </div>
	          <div class="form-floating mb-4" style="display: inline-block; float: right;">
	            <input type="text" class="form-control rounded-4" id="email_injeung" name="email_injeung" placeholder="인증코드" style="width: 310px;">
	            <label for="floatingInput">인증코드</label>
	          </div>
          </div>
		<!-- 로그인, 비밀번호재설정으로 이동 -->	  	
      
          <div>
          <button id="btn" class="w-100 mb-1 mt-2 btn btn-lg rounded-4 btn-primary" type="button" style="padding:10px 60px;">비밀번호 재설정</button>
           </div>

        </form>
        
      </div>

    </div>
  </div>
</div>
</body>
</html>