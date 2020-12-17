<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>managerSignup</title>
</head>
<body>
	<h1>운영자회원가입</h1>
	<form method="post" action="${pageContext.request.contextPath}/manager/signup">
		<input type="text" hidden="hidden" value="3" name="accountLevel">
		<input type="text" hidden="hidden" value="대기" name="accountState">
		<div>아이디</div>
			<input type="text" placeholder="아이디를 입력하세요" name="accountId">
			
		<div>비밀번호</div>
			<input type="password" placeholder="비밀번호를 입력하세요" name=accountPw id="managerPw1">
			<div><input type="password" placeholder="다시 비밀번호를 입력하세요" id="managerPw2"></div>	
			
		<div>이메일</div>
			<input type="text" placeholder="이메일을 입력하세요" name="managerEmail">
			
		<div>이름</div>
			<input type="text" placeholder="이름을 입력하세요" name="managerName">
			
		<div>핸드폰번호</div>
			<input type="text" placeholder="번호를 입력하세요" name="managerPhone">
			
		<div>성별</div>
			<input type="radio" name="managerGender" value="남">남
			<input type="radio" name="managerGender" value="여">여
			
		<div>생년월일</div>
			<input type="date" name="managerBirth">
		<div>주소</div>
			<input type="text" name="managerAddressMain" placeholder="임시 주소입니다.">
		<div>상세주소</div>
			<input type="text" placeholder="상세주소를 입력하세요" name="managerAddressSub">
		<div>	
		<button type="submit">회원가입</button>
		</div>
	</form>
</body>
</html>