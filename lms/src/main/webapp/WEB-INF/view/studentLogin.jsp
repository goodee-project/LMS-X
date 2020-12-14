<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
			<h1>로그인</h1>
	<form method="post" action="${pageContext.request.contextPath}/login">
		<input type="text" name="accountLevel" value="1" hidden="hidden" >
		<div>아이디</div>
		<input type="text" placeholder="아이디를 입력해주세요" name="accountId">
		<div>비밀번호</div>
		<input type="password" placeholder="비밀번호를 입력해주세요" name="accountPw">
		<button type="submit">로그인</button>
	</form>
</body>
</html>