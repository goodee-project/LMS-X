<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adminLogin</title>
</head>
<body>
	<a href="${pageContext.request.contextPath}/studentLogin">학생 로그인</a>
	<a href="${pageContext.request.contextPath}/teacherLogin">강사 로그인</a>
	<a href="${pageContext.request.contextPath}/managerLogin">운영자 로그인</a>
	<a href="${pageContext.request.contextPath}/adminLogin">관리자 로그인</a>

	<h1>관리자 로그인</h1>
	<form method="post" action="${pageContext.request.contextPath}/login">
		<input type="text" name="accountLevel" value="4" hidden="hidden">
		<div>아이디</div>
		<input type="text" placeholder="아이디를 입력해주세요" name="accountId" value="admin">
		<div>비밀번호</div>
		<input type="password" placeholder="비밀번호를 입력해주세요" name="accountPw" value="1234">
		<button type="submit">로그인</button>
	</form>
</body>
</html>