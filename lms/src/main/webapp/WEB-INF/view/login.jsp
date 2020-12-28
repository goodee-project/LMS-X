<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="utf-8" />
		<meta name="viewport"
			content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<title>login</title>
		<!-- Favicon -->
		<link href="${pageContext.request.contextPath}/assets/img/brand/favicon.png" rel="icon" type="image/png">
		<!-- Fonts -->
		<link
			href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700"
			rel="stylesheet">
		<!-- Icons -->
		<link href="${pageContext.request.contextPath}/assets/js/plugins/nucleo/css/nucleo.css" rel="stylesheet" />
		<link
			href="${pageContext.request.contextPath}/assets/js/plugins/@fortawesome/fontawesome-free/css/all.min.css"
			rel="stylesheet" />
		<!-- CSS Files -->
		<link href="${pageContext.request.contextPath}/assets/css/argon-dashboard.css?v=1.1.2" rel="stylesheet" />
		<!-- jQuery / Ajax Google CDN -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<!-- 비동기 -->
		<script>
			$(document).ready(function() {
					
				// 학생 로그인
				$('#studentLogin').click(function() {
					let loginInput = `
						<form id="loginForm" method="post" action="${pageContext.request.contextPath}/login">
							<div class="text-center text-muted mb-4">
								<h3>학생 로그인</h3>
							</div>
							<input id="accountLevel" type="text" name="accountLevel" value="1" hidden="hidden">
							<div class="form-group mb-3">
								<div class="input-group input-group-alternative">
									<div class="input-group-prepend">
										<span class="input-group-text"><i
											class="ni ni-email-83"></i></span>
									</div>
									<input type="text" class="form-control" name="accountId" id="accountId" placeholder="아이디" value="youngi">
								</div>
							</div>
							<div class="form-group">
								<div class="input-group input-group-alternative">
									<div class="input-group-prepend">
										<span class="input-group-text"><i
											class="ni ni-lock-circle-open"></i></span>
									</div>
									<input type="password" class="form-control" name="accountPw" id="accountPw" placeholder="비밀번호" value="1234">
								</div>
							</div>
							<div class="text-center">
								<button type="button" class="btn btn-primary my-4" id="loginBtn">로그인</button>
							</div>
						</form>
						<div id="idCheck"></div>`;
						
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
									let msg = `승인 대기 상태입니다. \n승인 후 이용가능합니다.`;
									alert(msg)
									return;
								}
								// 탈퇴 상태
								if ( data == "secession" ) {
									alert("탈퇴한 계정입니다.")
								}
								// 정보가 없는 경우
								if ( data == "none") {
									$('#idCheck').html('가입하지 않은 아이디이거나, <br>잘못된 비밀번호입니다.')
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
						<form id="loginForm" method="post" action="${pageContext.request.contextPath}/login">
							<div class="text-center text-muted mb-4">
								<h3>강사 로그인</h3>
							</div>
							<input id="accountLevel" type="text" name="accountLevel" value="2" hidden="hidden">
							<div class="form-group mb-3">
								<div class="input-group input-group-alternative">
									<div class="input-group-prepend">
										<span class="input-group-text"><i
											class="ni ni-email-83"></i></span>
									</div>
									<input type="text" class="form-control" name="accountId" id="accountId" placeholder="아이디" value="sunghyun">
								</div>
							</div>
							<div class="form-group">
								<div class="input-group input-group-alternative">
									<div class="input-group-prepend">
										<span class="input-group-text"><i
											class="ni ni-lock-circle-open"></i></span>
									</div>
									<input type="password" class="form-control" name="accountPw" id="accountPw" placeholder="비밀번호" value="1234">
								</div>
							</div>
							<div class="text-center">
								<button type="button" class="btn btn-primary my-4" id="loginBtn">로그인</button>
							</div>
						</form>
						<div id="idCheck"></div>`;
						
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
									let msg = `승인 대기 상태입니다. \n승인 후 이용가능합니다.`;
									alert(msg)
									return;
								}
								// 탈퇴 상태
								if ( data == "secession" ) {
									alert("탈퇴한 계정입니다.")
								}
								// 정보가 없는 경우
								if ( data == "none") {
									$('#idCheck').html('가입하지 않은 아이디이거나, <br>잘못된 비밀번호입니다.')
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
						<form id="loginForm" method="post" action="${pageContext.request.contextPath}/login">
							<div class="text-center text-muted mb-4">
								<h3>운영자 로그인</h3>
							</div>
							<input id="accountLevel" type="text" name="accountLevel" value="3" hidden="hidden">
							<div class="form-group mb-3">
								<div class="input-group input-group-alternative">
									<div class="input-group-prepend">
										<span class="input-group-text"><i
											class="ni ni-email-83"></i></span>
									</div>
									<input type="text" class="form-control" name="accountId" id="accountId" placeholder="아이디" value="manager1">
								</div>
							</div>
							<div class="form-group">
								<div class="input-group input-group-alternative">
									<div class="input-group-prepend">
										<span class="input-group-text"><i
											class="ni ni-lock-circle-open"></i></span>
									</div>
									<input type="password" class="form-control" name="accountPw" id="accountPw" placeholder="비밀번호" value="1234">
								</div>
							</div>
							<div class="text-center">
								<button type="button" class="btn btn-primary my-4" id="loginBtn">로그인</button>
							</div>
						</form>
						<div id="idCheck"></div>`;
						
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
									let msg = `승인 대기 상태입니다. \n승인 후 이용가능합니다.`;
									alert(msg)
									return;
								}
								// 탈퇴 상태
								if ( data == "secession" ) {
									alert("탈퇴한 계정입니다.")
								}
								// 정보가 없는 경우
								if ( data == "none") {
									$('#idCheck').html('가입하지 않은 아이디이거나, <br>잘못된 비밀번호입니다.')
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
						<form id="loginForm" method="post" action="${pageContext.request.contextPath}/login">
							<div class="text-center text-muted mb-4">
								<h3>관리자 로그인</h3>
							</div>
							<input id="accountLevel" type="text" name="accountLevel" value="4" hidden="hidden">
							<div class="form-group mb-3">
								<div class="input-group input-group-alternative">
									<div class="input-group-prepend">
										<span class="input-group-text"><i
											class="ni ni-email-83"></i></span>
									</div>
									<input type="text" class="form-control" name="accountId" id="accountId" placeholder="아이디" value="admin">
								</div>
							</div>
							<div class="form-group">
								<div class="input-group input-group-alternative">
									<div class="input-group-prepend">
										<span class="input-group-text"><i
											class="ni ni-lock-circle-open"></i></span>
									</div>
									<input type="password" class="form-control" name="accountPw" id="accountPw" placeholder="비밀번호" value="1234">
								</div>
							</div>
							<div class="text-center">
								<button type="button" class="btn btn-primary my-4" id="loginBtn">로그인</button>
							</div>
						</form>
						<div id="idCheck"></div>`;
					
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
									let msg = `승인 대기 상태입니다. \n승인 후 이용가능합니다.`;
									alert(msg)
									return;
								}
								// 탈퇴 상태
								if ( data == "secession" ) {
									alert("탈퇴한 계정입니다.")
								}
								// 정보가 없는 경우
								if ( data == "none") {
									$('#idCheck').html('가입하지 않은 아이디이거나, <br>잘못된 비밀번호입니다.')
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
	
	<body class="bg-default">
		<div class="main-content">
			<!-- Navbar -->
			<nav
				class="navbar navbar-top navbar-horizontal navbar-expand-md navbar-dark">
				<div class="container px-4">
					<a class="navbar-brand" href="${pageContext.request.contextPath}/index.html"> <img
						src="${pageContext.request.contextPath}/assets/img/brand/white.png" />
					</a>
					<button class="navbar-toggler" type="button" data-toggle="collapse"
						data-target="#navbar-collapse-main"
						aria-controls="navbarSupportedContent" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>
					<div class="collapse navbar-collapse" id="navbar-collapse-main">
						<!-- Collapse header -->
						<div class="navbar-collapse-header d-md-none">
							<div class="row">
								<div class="col-6 collapse-brand">
									<a href="${pageContext.request.contextPath}/index.html"> <img
										src="${pageContext.request.contextPath}/assets/img/brand/blue.png">
									</a>
								</div>
								<div class="col-6 collapse-close">
									<button type="button" class="navbar-toggler"
										data-toggle="collapse" data-target="#navbar-collapse-main"
										aria-controls="sidenav-main" aria-expanded="false"
										aria-label="Toggle sidenav">
										<span></span> <span></span>
									</button>
								</div>
							</div>
						</div>
						<!-- Navbar items -->
						<ul class="navbar-nav ml-auto">
							<li class="nav-item"><a class="nav-link nav-link-icon"
								href="${pageContext.request.contextPath}/examples/register.html"> <i class="ni ni-circle-08"></i>
									<span class="nav-link-inner--text">회원가입</span>
							</a></li>
						</ul>
					</div>
				</div>
			</nav>
			<!-- Header -->
			<div class="header bg-gradient-primary py-7 py-lg-8">
				<div class="container">
					<div class="header-body text-center mb-7">
						<div class="row justify-content-center">
							<div class="col-lg-5 col-md-6">
								<h1 class="text-white">Goodee LMS</h1>
								<p class="text-lead text-light">로그인</p>
							</div>
						</div>
					</div>
				</div>
				<div class="separator separator-bottom separator-skew zindex-100">
					<svg x="0" y="0" viewBox="0 0 2560 100" preserveAspectRatio="none"
						version="1.1" xmlns="http://www.w3.org/2000/svg">
	          <polygon class="fill-default" points="2560 0 2560 100 0 100"></polygon>
	        </svg>
				</div>
			</div>
			<!-- Page content -->
			<div class="container mt--8 pb-5">
				<div class="row justify-content-center">
					<div class="col-lg-5 col-md-7">
						<div class="card bg-secondary shadow border-0">
							<div class="card-header bg-transparent pb-5">
								<div class="btn-wrapper text-center mt-3">
									<div class="btn btn-neutral btn-icon" id="studentLogin"><span class="btn-inner--text">학생</span></div>
									<div class="btn btn-neutral btn-icon" id="teacherLogin"><span class="btn-inner--text">강사</span></div>
								</div>
								<div class="btn-wrapper text-center mt-3">
									<div class="btn btn-neutral btn-icon" id="managerLogin"><span class="btn-inner--text">운영자</span></div>
									<div class="btn btn-neutral btn-icon" id="adminLogin"><span class="btn-inner--text">관리자</span></div>
								</div>
							</div>
							<div class="card-body px-lg-5 py-lg-5" id="login">
								<div class="text-center">(계정을 선택해주세요)</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<footer class="py-5">
				<div class="container">
					<div class="row align-items-center justify-content-xl-between">
						<div class="col-xl-6">
							<div class="copyright text-center text-xl-left text-muted">
								© 2020-2021 <a href="https://www.creative-tim.com"
									class="font-weight-bold ml-1" target="_blank">Goodee Avengers</a>
							</div>
						</div>
						<div class="col-xl-6">
							<ul
								class="nav nav-footer justify-content-center justify-content-xl-end">
								<li class="nav-item"><a href="https://www.creative-tim.com"
									class="nav-link" target="_blank">장지운</a></li>
								<li class="nav-item"><a
									href="https://www.creative-tim.com/presentation"
									class="nav-link" target="_blank">김덕인</a></li>
								<li class="nav-item"><a href="http://blog.creative-tim.com"
									class="nav-link" target="_blank">한재용</a></li>
								<li class="nav-item"><a
									href="https://github.com/creativetimofficial/argon-dashboard/blob/master/LICENSE.md"
									class="nav-link" target="_blank">조성현</a></li>
								<li class="nav-item"><a
									href="https://github.com/creativetimofficial/argon-dashboard/blob/master/LICENSE.md"
									class="nav-link" target="_blank">김주성</a></li>
								<li class="nav-item"><a
									href="https://github.com/creativetimofficial/argon-dashboard/blob/master/LICENSE.md"
									class="nav-link" target="_blank">최형철</a></li>
							</ul>
						</div>
					</div>
				</div>
			</footer>
		</div>
		<!--   Core   -->
		<script src="${pageContext.request.contextPath}/assets/js/plugins/jquery/dist/jquery.min.js"></script>
		<script
			src="${pageContext.request.contextPath}/assets/js/plugins/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
		<!--   Optional JS   -->
		<!--   Argon JS   -->
		<script src="${pageContext.request.contextPath}/assets/js/argon-dashboard.min.js?v=1.1.2"></script>
		<script src="https://cdn.trackjs.com/agent/v3/latest/t.js"></script>
		<script>
	    window.TrackJS &&
	      TrackJS.install({
	        token: "ee6fab19c5a04ac1a32a645abde4613a",
	        application: "argon-dashboard-free"
	      });
	  </script>
	</body>
</html>