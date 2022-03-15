<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	$(".btn-close").click(function(){
	 	location.href="/login";
	});
	
	$(document).on("click","#searchPWD",function(){ 
		location.href="/searchPwd";
	});	
	
});
</script>
</head>
<body>
<jsp:include page="header1.jsp"></jsp:include>	
<div class="modal modal-signin position-static d-block py-5" tabindex="-1" role="dialog" id="modalSignin" style="margin-top: 150px; margin-bottom: 100px; padding-right: 80px;">
  <div class="modal-dialog" role="document" style="margin: 0 auto;">
    <div class="modal-content rounded-5 shadow" style="width: 600px;">
      <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">	
       <!-- 닫기 버튼 -->
	  <div class="modal-close bg-secondary bg-gradient border-bottom-1 mb-3">
	    <button type="button" class="btn-close bg-light" data-bs-dismiss="modal" aria-label="Close" style="float: right; margin: 10px;"></button>
	  </div> 
      <!-- 아이디 찾기 표시 -->
      <div class="modal-header p-3 pb-3 border-bottom-0 mb-2" style="margin: 0 auto; display: block;">
        <p class="fs-1 fw-bold mb-0 text-secondary mb-1" style="text-align: center;">아이디 찾기</p>
          <!-- 아이디 찾았을 경우 -->
          <c:if test="${not empty masking_id}">
        	<h5 class="text-muted" style="text-align: center;">아이디를 찾았습니다.</h5>
       	  </c:if>
       	  <!-- 아이디 못찾았을 경우 -->
      	  <c:if test="${empty masking_id}">
        	<h5 class="text-muted" style="text-align: center;">아이디가 없습니다.<i class="bi bi-emoji-frown fs-3" style="padding-left: 5px;"></i></h5>
     	  </c:if>
      </div>
	<div>
  </div>
  	  <!-- 아이디 찾기 전체 div -->
      <div class="modal-body p-5 pt-0">
      	<!-- 회원가입한 아이디 **기능처리**-->
      	
      	<div class="modal-searchId bg-secondary border-1 mb-4" style="height: 60px;">
      		<!-- 아이디 찾았을 경우 -->
      		<c:if test="${not empty masking_id}">
	    		<p class="text-white" style="text-align: center; line-height: 60px;">회원가입하신 아이디는 <strong class="text-bold">${masking_id}</strong>입니다.</p>
	  		</c:if>
	  		<!-- 아이디 못찾았을 경우 -->
	  		<c:if test="${empty masking_id}">
         		<p class="text-white" style="text-align: center; line-height: 60px;">입력값이 맞는지 다시 확인해주세요!</p>
        	</c:if>
	  	</div>
	  	
	  	
		<!-- 로그인, 비밀번호찾기로 이동 -->	  	
        
        <!-- 아이디 찾았을 경우 -->
          <c:if test="${not empty masking_id}">
	          <div style="position: relative; width: 100%;">
		          <div style="float: left;">
		         	 <button class="mb-1 btn btn-lg rounded-4 btn-primary" type="button" style="padding:10px 90px;" onclick="location.href='/login'">로그인</button>
		           </div>
		          <div style="float: right;">
		          	<button class="mb-1 btn btn-lg rounded-4 btn-secondary" 
		          	    type="button" 
		          		style="padding:10px 60px;" 
		          		id="searchPWD">비밀번호찾기</button>
		          </div>
	          </div>
          </c:if>
          <!-- 아이디 못찾았을 경우 -->
          <c:if test="${empty masking_id}">
	           <div style="position: relative; width: 100%;">
		          <div style="float: left;">
		         	 <button class="mb-1 btn btn-lg rounded-4 btn-primary" type="button" style="padding:10px 90px;" onclick="location.href='/login'">로그인</button>
		           </div>
		          <div style="float: right;">
		         	 <button class="mb-1 btn btn-lg rounded-4 btn-secondary" type="submit" style="padding:10px 70px;" onclick="location.href='/searchId'">아이디찾기</button>
		          </div>
	          </div>
          </c:if>   
      </div>
    </div>
  </div>
</div>
<jsp:include page="footer.jsp"></jsp:include>	
</body>
</html>
