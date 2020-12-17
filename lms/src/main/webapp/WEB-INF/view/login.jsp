<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>login</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script>
		$(document).ready(function() {
			
			// 학생 로그인
			$('#studentLogin').click(function() {
				let loginInput = `
					<h1>학생로그인</h1>
					<form id="loginForm" method="post" action="${pageContext.request.contextPath}/login">
						<input id="accountLevel" type="text" name="accountLevel" value="1" hidden="hidden">
						<div>아이디</div>
							<input id="accountId" type="text" placeholder="아이디를 입력해주세요" name="accountId" value="youngi">
						<div>비밀번호</div>
							<input id="accountPw" type="password" placeholder="비밀번호를 입력해주세요" name="accountPw" value="1234">
						<button id="loginBtn" type="button">로그인</button>
					</form>
					<div id="idCheck"></div>
					<a href="${pageContext.request.contextPath}/student/signup">회원가입</a> `;
				$('#login').html(loginInput);
				
				$('#loginBtn').click(function(){
					// 아이디 입력 체크
					if ( $('#accountId').val() == "" ) {
						$('#accountId').focus();
						return;
					}

					// 비밀번호 입력 체크
					if ( $('#accountPw').val() == "" ) {
						$('#accountPw').focus();
						return;
					}
					// 비동기로 계정 상태 체크
					$.ajax({
						url : '${pageContext.request.contextPath}/login/stateCheck/'+$('#accountId').val()+'/'+$('#accountPw').val()+'/'+$('#accountLevel').val(),
						type : 'get',
						success : function(data) {
							// 승인 대기 상태
							if ( data == "wait" ) {
								let msg = `승인 대기 상태입니다. 승인 후 이용가능합니다.`;
								alert(msg)
								return;
							}
							// 탈퇴 상태
							if ( data == "secession" ) {
								alert("탈퇴한 계정입니다.")
							}
							// 정보가 없는 경우
							if ( data == "none") {
								$('#idCheck').html('가입하지 않은 아이디이거나, 잘못된 비밀번호입니다.')
							} 
							// 활성화 상태
							if ( data == "active" ) {
								$('#loginForm').submit();
							}
							
						}
					});
				});
			});
			
			// 강사 로그인
			$('#teacherLogin').click(function() {
				let loginInput = `
					<h1>강사로그인</h1>
					<form id="loginForm" method="post" action="${pageContext.request.contextPath}/login">
						<input id="accountLevel" type="text" name="accountLevel" value="2" hidden="hidden">
						<div>아이디</div>
							<input id="accountId" type="text" placeholder="아이디를 입력해주세요" name="accountId" value="sunghyun">
						<div>비밀번호</div>
							<input id="accountPw" type="password" placeholder="비밀번호를 입력해주세요" name="accountPw" value="1234">
						<button id="loginBtn" type="button">로그인</button>
					</form>
					<div id="idCheck"></div>
					<a href="${pageContext.request.contextPath}/teacher/signup">회원가입</a> `;
				$('#login').html(loginInput);
				
				$('#loginBtn').click(function(){
					// 아이디 입력 체크
					if ( $('#accountId').val() == "" ) {
						$('#accountId').focus();
						return;
					}

					// 비밀번호 입력 체크
					if ( $('#accountPw').val() == "" ) {
						$('#accountPw').focus();
						return;
					}
					// 비동기로 계정 상태 체크
					$.ajax({
						url : '${pageContext.request.contextPath}/login/stateCheck/'+$('#accountId').val()+'/'+$('#accountPw').val()+'/'+$('#accountLevel').val(),
						type : 'get',
						success : function(data) {
							// 승인 대기 상태
							if ( data == "wait" ) {
								let msg = `승인 대기 상태입니다. 승인 후 이용가능합니다.`;
								alert(msg)
								return;
							}
							// 탈퇴 상태
							if ( data == "secession" ) {
								alert("탈퇴한 계정입니다.")
							}
							// 정보가 없는 경우
							if ( data == "none") {
								$('#idCheck').html('가입하지 않은 아이디이거나, 잘못된 비밀번호입니다.')
							} 
							// 활성화 상태
							if ( data == "active" ) {
								$('#loginForm').submit();
							}
							
						}
					});
				});
			});

			// 운영자 로그인
			$('#managerLogin').click(function() {
				let loginInput = `
					<h1>운영자 로그인</h1>
					<form id="loginForm" method="post" action="${pageContext.request.contextPath}/login">
						<input id="accountLevel" type="text" name="accountLevel" value="3" hidden="hidden">
						<div>아이디</div>
							<input id="accountId" type="text" placeholder="아이디를 입력해주세요" name="accountId" value="manager1">
						<div>비밀번호</div>
							<input id="accountPw" type="password" placeholder="비밀번호를 입력해주세요" name="accountPw" value="1234">
						<button id="loginBtn" type="button">로그인</button>
					</form>
					<div id="idCheck"></div>
					<a href = "${pageContext.request.contextPath}/manager/signup">회원가입</a> `;
				$('#login').html(loginInput);

				$('#loginBtn').click(function(){
					// 아이디 입력 체크
					if ( $('#accountId').val() == "" ) {
						$('#accountId').focus();
						return;
					}

					// 비밀번호 입력 체크
					if ( $('#accountPw').val() == "" ) {
						$('#accountPw').focus();
						return;
					}
					// 비동기로 계정 상태 체크
					$.ajax({
						url : '${pageContext.request.contextPath}/login/stateCheck/'+$('#accountId').val()+'/'+$('#accountPw').val()+'/'+$('#accountLevel').val(),
						type : 'get',
						success : function(data) {
							// 승인 대기 상태
							if ( data == "wait" ) {
								let msg = `승인 대기 상태입니다. 승인 후 이용가능합니다.`;
								alert(msg)
								return;
							}
							// 탈퇴 상태
							if ( data == "secession" ) {
								alert("탈퇴한 계정입니다.")
							}
							// 정보가 없는 경우
							if ( data == "none") {
								$('#idCheck').html('가입하지 않은 아이디이거나, 잘못된 비밀번호입니다.')
							} 
							// 활성화 상태
							if ( data == "active" ) {
								$('#loginForm').submit();
							}
							
						}
					});
				});
			});

			// 관리자 로그인
			$('#adminLogin').click(function() {
				let loginInput = `
					<h1>관리자 로그인</h1>
					<form id="loginForm" method="post" action="${pageContext.request.contextPath}/login">
						<input id="accountLevel" type="text" name="accountLevel" value="4" hidden="hidden">
						<div>아이디</div>
						<input id="accountId" type="text" placeholder="아이디를 입력해주세요" name="accountId" value="admin">
						<div>비밀번호</div>
						<input id="accountPw" type="password" placeholder="비밀번호를 입력해주세요" name="accountPw" value="1234">
						<button id="loginBtn" type="button">로그인</button>
					</form>
					<div id="idCheck"></div> `;
				
				$('#login').html(loginInput);

				$('#loginBtn').click(function(){
					// 아이디 입력 체크
					if ( $('#accountId').val() == "" ) {
						$('#accountId').focus();
						return;
					}

					// 비밀번호 입력 체크
					if ( $('#accountPw').val() == "" ) {
						$('#accountPw').focus();
						return;
					}
					// 비동기로 계정 상태 체크
					$.ajax({
						url : '${pageContext.request.contextPath}/login/stateCheck/'+$('#accountId').val()+'/'+$('#accountPw').val()+'/'+$('#accountLevel').val(),
						type : 'get',
						success : function(data) {
							// 승인 대기 상태
							if ( data == "wait" ) {
								let msg = `승인 대기 상태입니다. 승인 후 이용가능합니다.`;
								alert(msg)
								return;
							}
							// 탈퇴 상태
							if ( data == "secession" ) {
								alert("탈퇴한 계정입니다.")
							}
							// 정보가 없는 경우
							if ( data == "none") {
								$('#idCheck').html('가입하지 않은 아이디이거나, 잘못된 비밀번호입니다.')
							} 
							// 활성화 상태
							if ( data == "active" ) {
								$('#loginForm').submit();
							}
						}
					});
				});
			});
		});
	</script>
</head>
<body>
<a href="${pageContext.request.contextPath}/studentLogin">학생 로그인</a>
<a href="${pageContext.request.contextPath}/teacherLogin">강사 로그인</a>
<a href="${pageContext.request.contextPath}/managerLogin">운영자 로그인</a>
<a href="${pageContext.request.contextPath}/adminLogin">관리자 로그인</a>
	<button id="studentLogin" type="button">학생 로그인</button>
	<button id="teacherLogin" type="button">강사 로그인</button>
	<button id="managerLogin" type="button">운영자 로그인</button>
	<button id="adminLogin" type="button">관리자 로그인</button>
	<div id="login"></div>
</body>
</html>