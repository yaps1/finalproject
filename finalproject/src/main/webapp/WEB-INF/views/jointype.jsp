<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script type="text/javascript" src="http://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript">
Kakao.init("41aa90fae3f6af0081985acd2e51880e");
function KakaoLogin(){
	Kakao.Auth.loginForm({
		scope:"profile_nickname,account_email,gender,birthday",
		success:function(authObj){
			console.log(authObj);
			Kakao.API.request({
				url:"/v2/user/me",
				success:function(res){
					console.log(res);
					let nickname = res.kakao_account.profile.nickname;
					let email = res.kakao_account.email;
					let gender = res.kakao_account.gender;
					let birthday = res.kakao_account.birthday;
					console.log(nickname,email,gender,birthday);
					//location.href="/KakaoLoginOK/"+nickname;
					location.href="/KakaoLoginOK/"+email;
					// window.location.assign("loginOK")
					
				}
			});
		}
	});
//카카오 로그아웃 기능은 아직 구현 못함 
}
</script>
</head>
<body>
<jsp:include page="header2.jsp"></jsp:include>
<div class="container d-flex justify-content-center align-middle" style="width: 1200px;  height: 900px; padding: 0;">
	<div style="padding-top: 220px;">
	<form class="p-5" style="border: solid 1px; display: inline-block; ">
         
          <div class="form-floating mb-3" style="width:500px; float: left; padding-right: 48px; border-right: solid 1px;">
          	<div class="mb-5">
             <h2 class="fs-3 fw-bold pt-3 mb-3 text-secondary">4989 계정으로 회원가입</h2>
             <button class="w-100 btn btn-lg btn-secondary" type="button" onclick="location.href='/join';" style="height: 70px;">4989 회원가입</button>
             </div>
            <div class="mb-3">
             <h2 class="fs-4 fw-bold mb-3 text-secondary">4989 회원이세요?</h2>
	         <button class="w-100 btn btn-lg btn-primary" type="button" onclick="location.href='/login';" style="height: 70px;">로그인</button>
          	</div>
          </div>
          
          <div class="form-floating mb-3" style="width:500px; float: left; padding-left: 48px;">
            <div class="3">
            <h2 class="fs-3 fw-bold pt-3 mb-3 text-secondary">SNS 계정으로 회원가입</h2>
	        <a href="javascript:KakaoLogin();"><img src="../images/kakao_join.png" style="width: 451.73px; height: 70px;"/></a>
			</div>
			<div class="pt-3">
			<span class="text-secondary">SNS계정을 연동하여 쉽고 빠르고 안전하게 </span> <br>
			<span class="text-secondary">회원가입을 할 수 있습니다.</span>
          	</div>
          </div>
       
        </form>
         </div>
</div>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>