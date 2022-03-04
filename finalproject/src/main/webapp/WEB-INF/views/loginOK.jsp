<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript">
	Kakao.init("41aa90fae3f6af0081985acd2e51880e");
	function kakaoLogout(){
		Kakao.API.request({
			url:"/v1/user/unlink",
			success:function(){
				alert("카카오 로그아웃 되었습니다.");
				location.href="/login.html";
			}
		});
	}
</script>
</head>
<body>
<jsp:include page="header2.jsp"></jsp:include>

	<h2>서비스 문서입니다.</h2>
</body>
</html>