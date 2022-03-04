<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="insertSGC" method="post">
		<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
		<input type="hidden" name="sg_no" value="3">
		<input type="text" name="sg_comment">
		<input type="hidden" name="member_no" value="${m.member_no }">
		<input type="hidden" name="member_nickname" value="${m.member_nickname }">
		<input type="submit" value="등록">
		
	</form>
</body>
</html>