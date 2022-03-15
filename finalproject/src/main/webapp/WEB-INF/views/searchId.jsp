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
	$(function(){
		$(".btn-close").click(function(){
		 	location.href="/login";
		});
	});
	
</script>
</head>
<body>
<jsp:include page="header1.jsp"></jsp:include>
<div class="modal modal-signin position-static d-block py-5" id="searchId" tabindex="-1" role="dialog" id="modalSignin"  style="margin-top:50px; margin-bottom: 50px;">
  <div class="modal-dialog" role="document">
    <div class="modal-content rounded-5 shadow">
      
       <!-- 닫기 버튼 -->
	  <div class="modal-close bg-secondary bg-gradient border-bottom-1 mb-3">
	    <button type="button" class="btn-close bg-light" data-bs-dismiss="modal" aria-label="Close" style="float: right; margin: 10px;"></button>
	  </div> 
      <!-- 아이디 찾기 표시 -->
      <div class="modal-header p-3 pb-3 border-bottom-0 mb-3" style="margin: 0 auto;">
        <h1 class="fw-bold mb-0 text-secondary">아이디 찾기</h2>
      </div>
	  <!-- 전체 div -->
      <div class="modal-body p-5 pt-0">
        <form class="form-searchId" action="/searchId" method="post">
       	<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">		
       
        <!-- 입력태그 감싸는 div -->
         <div class="mb-3">
         <!-- 이름 작성란 -->
          <div style="position: relative; text-align: right;">
	          <div style="display: inline-block; width: 50px;">
	          	<label>이름 </label>
	          </div>
	          <div class="form-floating mb-3" style="display: inline-block;">
	            <input type="text" class="form-control rounded-4" name="member_name" id="floatingInput" placeholder="이름(실명)" style="width: 330px;">
	            <label for="floatingInput">이름(실명)</label>
	          </div>
          </div>
          <!-- 연락처 작성란 -->
          <div style="position: relative; text-align: right;">
	          <div style="display: inline-block; width: 50px;">
		          	<label>연락처 </label>
		      </div>
	          <div class="form-floating mb-3" style="display: inline-block;">
	            <input type="text" class="form-control rounded-4" name="member_tel" id="floatingTel" placeholder="휴대전화번호" style="width: 330px;">
	            <label for="floatingTel">연락처</label>
	          </div>
          </div>
          <!-- 입력태그 감싸는 div 끝 -->
         </div>
         <!-- 버튼 -->
          <button class="w-100 mb-2 btn btn-lg rounded-4 btn-primary" type="submit">확인</button>
          <button class="w-100 mb-2 btn btn-lg rounded-4 btn-secondary" type="reset">취소</button>
        </form>
         <!-- 전체 div 끝-->
      </div>
    </div>
  </div>
</div>
	
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
