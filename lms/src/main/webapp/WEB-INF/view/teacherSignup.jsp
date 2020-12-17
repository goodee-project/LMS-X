<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>teacherSignup</title>
</head>
<body>
	<h1>강사회원가입</h1>
	<form method="post" action="${pageContext.request.contextPath}/teacher/signup">
		<input type="text" hidden="hidden" value="2" name="accountLevel">
		<input type="text" hidden="hidden" value="대기" name="accountState">
		<div>아이디</div>
			<input type="text" placeholder="아이디를 입력하세요" name="accountId">
			
		<div>비밀번호</div>
			<input type="password" placeholder="비밀번호를 입력하세요" name=accountPw id="teacherPw1">
			<div><input type="password" placeholder="다시 비밀번호를 입력하세요" id="teacherPw2"></div>	
			
		<div>이메일</div>
			<input type="text" placeholder="이메일을 입력하세요" name="teacherEmail">
			
		<div>이름</div>
			<input type="text" placeholder="이름을 입력하세요" name="teacherName">
			
		<div>핸드폰번호</div>
			<input type="text" placeholder="번호를 입력하세요" name="teacherPhone">
			
		<div>성별</div>
			<input type="radio" name="teacherGender" value="남">남
			<input type="radio" name="teacherGender" value="여">여
			
		<div>생년월일</div>
			<input type="date" name="teacherBirth">
		<div>주소</div>
			<input type="text" name="teacherAddressMain" placeholder="임시 주소입니다.">
		<div>상세주소</div>
			<input type="text" placeholder="상세주소를 입력하세요" name="teacherAddressSub">
		<div>	
		<button type="submit">회원가입</button>
		</div>
	</form>
</body>
</html>