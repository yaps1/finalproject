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
<script type="text/javascript" src="http://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript">
$(function(){
	if($("#username").val()!=""){
		console.log("바로로그인 처리합니다.");
		$("#login_form").submit();
	}
})

Kakao.init("41aa90fae3f6af0081985acd2e51880e");
function KakaoLogin(){
	Kakao.Auth.loginForm({
		scope:"profile_nickname,account_email,gender,birthday",
		success:function(authObj){
			console.log(authObj);
			Kakao.API.request({
				url:"/v2/user/me",
				success:function(res){					
					console.log("로그인 성공");
					console.log(res);
					let nickname = res.kakao_account.profile.nickname;
					let email = res.kakao_account.email;
					let gender = res.kakao_account.gender;
					let birthday = res.kakao_account.birthday;
					//console.log(nickname,email,gender,birthday);
					let member_gender;
					if(gender=="female"){
						member_gender = "여";
						//console.log(member_gender);
					}else if(gender == "male"){
						member_gender = "남";
					}
					
					let data = {
							member_nickname:nickname,
							member_id : email,
							member_gender : member_gender,
							member_birth : birthday
					}
					//카카오 로그인 DB저장
					$.ajax({
						url:"KakaoLoginOK",
						data:data,
						success:function(r){
							console.log("로그인됌");
							location.href="login";
						}
					})//카카오 로그인 ajax끝

				}
			});
		}
	});

}//카카오 로그인 함수 끝

</script>
</head>
<body style="height: 1000px; padding: 200px;">

<div class="position-static d-block py-5">
  <div class="modal-dialog">
    <div class="modal-content rounded-5 shadow">
     
      <!-- 로그인 표시 -->
      <div class="modal-header p-5 border-bottom-0" style="margin: 0 auto;">
        <img src="../images/4989_logo.png" width="120px" height="55px;">
        <p class="display-5 fw-bold mb-0 mx-1 text-secondary">로그인</p>
      </div>
      
	<!-- 전체 폼 -->
      <div class="modal-body p-5 pt-0">
      <form  id="login_form"   class="login_form" action="login" method="post">
        <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
        <!-- 아이디, 비밀번호 입력-->
          <div class="form-floating mb-3">
            <input id="username" type="email" class="form-control rounded-4" id="floatingInput" value="${username }"  name="username" placeholder="name@example.com">
            
           <label for="floatingInput"><i class="bi bi-person-fill" style="margin-right: 10px;"></i>Email ID</label>
          </div>
          <div class="form-floating mb-3">
            <input type="password"  value="${password }" class="form-control rounded-4" id="floatingPassword" name="password" placeholder="Password" autocomplete="off" >
            <label for="floatingPassword"><i class="bi bi-lock-fill" style="margin-right: 10px;"></i>Password</label>
          </div>
        <!-- 아이디저장, 아이디 찾기, 비밀번호 찾기 -->  
 		<div class="mb-2" style="position: relative;">
	 		<div style="float: left;">
	 		  <input type="checkbox" name="remember_me" id="remember_me" style="padding: 0">
	         <label for="remember_me" class=""col-sm-2 control-label"">아이디 저장</label>
	 		 </div>
	 		 <div class="form-find" style="float: right;">
	 		  <a data-toggle="modal" href="searchId" id="searchId" style="text-decoration:none;color:inherit;">아이디 찾기</a>｜<a href="searchPwd" style="text-decoration:none;color:inherit;">비밀번호 찾기</a>
	         </div>
         </div>
        <!-- 로그인 -->
          <button class="w-100 mb-2 btn btn-lg rounded-4 btn-primary fw-bold" type="submit" style="margin-top: 10px;">로그인</button>
       	<!-- 회원가입창으로 이동-->
	          <div class="form-floating mb-3" style="position: relative; margin-top: 5px;">
	           <h2 class="fs-5 fw-bold mb-3 text-secondary" style="float: left; margin-left: 20px;">아직 4989의 회원이 아닌가요?</h2>
	           <a href="join" style="float: right; font-size: 18px; margin-right: 10px;">회원가입</a>
	          </div>
        <!-- 카카오로그인으로 이동 -->
	        <div class="kakao_login">
		       <a href="javascript:KakaoLogin();"><img src="../images/kakao_join.png" style="width: 405px;"/></a>
		    </div>
		 
        </form>
      </div>
    </div>
  </div>
</div>
</body>
</html>