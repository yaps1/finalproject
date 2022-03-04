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
</head>
<body>
<div class="modal modal-signin position-static d-block py-5" tabindex="-1" role="dialog" id="modalSignin">
  <div class="modal-dialog" role="document">
    <div class="modal-content rounded-5 shadow" style="width: 600px;">
      <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">	
       <!-- 닫기 버튼 -->
	  <div class="modal-close bg-secondary bg-gradient border-bottom-1 mb-3">
	    <button type="button" class="btn-close bg-light" data-bs-dismiss="modal" aria-label="Close" style="float: right; margin: 10px;"></button>
	  </div> 
      <!-- 아이디 찾기 표시 -->
      <div class="modal-header p-3 pb-3 border-bottom-0 mb-2" style="margin: 0 auto; display: block;">
        <h1 class="fw-bold mb-0 text-secondary mb-1" style="text-align: center;">아이디 찾기</h2>
        <h5 class="text-muted" style="text-align: center;">아이디를 찾았습니다.</h5>
      </div>
	<div>
  </div>
  	  <!-- 아이디 찾기 전체 div -->
      <div class="modal-body p-5 pt-0">
      	<!-- 회원가입한 아이디 **기능처리**-->
      	<div class="modal-searchId bg-secondary border-1 mb-4" style="height: 60px;">
	    	<h5 class="text-white" style="text-align: center; line-height: 60px;">회원가입하신 아이디는 ${member_id}입니다.</h5>
	  	</div>
	  	
	  	
		<!-- 로그인, 비밀번호찾기로 이동 -->	  	
        <form class="">
          	
          <div style="position: relative; width: 100%;">
          <div style="float: left;">
          <button class="mb-1 btn btn-lg rounded-4 btn-primary" type="button" style="padding:10px 90px;" onclick="location.href='/login'">로그인</button>
           </div>
          <div style="float: right;">
          <button class="mb-1 btn btn-lg rounded-4 btn-secondary" type="submit" style="padding:10px 60px;" onclick="location.replace(searchPwd)">비밀번호찾기</button>
          </div>
          </div>
        </form>
        
      </div>

    </div>
  </div>
</div>
</body>
</html>