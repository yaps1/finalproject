<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="header2.jsp"></jsp:include>
	<br>
	<br>
	<br>
	<h1 style="text-align : center;"><strong>관리자</strong></h1>
	<br>
	<br>
	<div style="text-align : center;">
		<a href="chart"><img src="/images/차트.png" height="300" width="300"></a>
		<a href="managerListMember"><img src="/images/회원관리.png" height="300" width="300"></a>
		<a href="managerNotice"><img src="/images/공지사항관리.png" height="300" width="300"></a>
		<a href="listQna"><img src="/images/문의사항관리.png" height="300" width="300"></a>
	</div>
	<br>
	<br>
	<br>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>