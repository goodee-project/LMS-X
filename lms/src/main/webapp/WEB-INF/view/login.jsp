<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
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
		
		<!-- 동기 -->
		<script>
			// 현재 페이지의 이름을 확인하는 함수
			function getPageName(){
			    let pageName = "";
			 
			    let tempPageName = window.location.href;
			    let strPageName = tempPageName.split("/");
			    pageName = strPageName[strPageName.length-1].split("?")[0];
			 
			    return pageName;
			}
			
			var thisPageName = getPageName();
			console.log(thisPageName);
		
			// url에서 parameter 추출
			function getParam(sname) {
			    var params = location.search.substr(location.search.indexOf("?") + 1);
			    var sval = "";
			    params = params.split("&");
			    
			    for (var i = 0; i < params.length; i++) {
			        temp = params[i].split("=");
			        if ([temp[0]] == sname) { sval = temp[1]; }
			    }
			    return sval;
			}
		</script>
		
		<!-- 비동기 -->
		<script>
			$(document).ready(function() {
				// 회원가입 완료시 알림창
				let param = getParam("member");
				if (param == "student" || param == "teacher") {
					$("#modal-manager").modal("show");
				} else if (param == "manager") {
					$("#modal-admin").modal("show");
				}
				
				// 학생 로그인
				$('#studentLogin').click(function() {
					let loginInput = `
						<div class="card-body px-lg-5 py-lg-5">
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
								<div class="text-danger" id="idCheck"></div>
								<div class="text-center">
									<button type="button" class="btn btn-primary my-4" id="loginBtn">로그인</button>
								</div>
							</form>
						</div> `;
						
					$('#login').html(loginInput);
					
					// 회원가입 및 아이디,비밀번호 찾기
					let signup = `
						<div class="row mt-3">
				            <div class="col-6">
				            	<a href="${pageContext.request.contextPath}/student/forgotIdAndPassword" class="text-light"><small>아이디/비밀번호 찾기</small></a>
				            </div>
				            <div class="col-6 text-right">
				            	<a href="${pageContext.request.contextPath}/student/signup" class="text-light"><small>회원가입</small></a>
				            </div>
		        		</div>
						`;
					$('#signup').html(signup);
					
					// enter하면 자동 넘어가기
					$('#accountId').on('keypress',function(e){
						if (e.keyCode == '13') {
							$('#accountPw').focus();
						}
	
					});
					$('#accountPw').on('keypress',function(e){
						if (e.keyCode == '13') {
							$('#loginBtn').click();
						}
					});
					
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
								if (data == "wait") {
									$("#modal-wait").modal("show");
									return;
								}
								
								// 탈퇴 상태
								if (data == "secession") {
									$("#modal-secession").modal("show");
									return;
								}
								
								// 정보가 없는 경우
								if (data == "none") {
									$("#modal-none").modal("show");
									return;
								} 
	
								// 휴면 상태
								if (data == "dormant") {
									$("#modal-dormant-manager").modal("show");
									return;
								}
								
								// 활성화 상태
								if (data == "active") {
									$('#loginForm').submit();
								}
							}
						});
					});
				});
				
				// 강사 로그인
				$('#teacherLogin').click(function() {
					let loginInput = `
						<div class="card-body px-lg-5 py-lg-5">
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
								<div class="text-danger" id="idCheck"></div>
								<div class="text-center">
									<button type="button" class="btn btn-primary my-4" id="loginBtn">로그인</button>
								</div>
							</form>
						</div> `;
						
					$('#login').html(loginInput);
					
					// 회원가입 및 아이디,비밀번호 찾기
					let signup = `
						<div class="row mt-3">
				            <div class="col-6">
				            	<a href="${pageContext.request.contextPath}/teacher/forgotIdAndPassword" class="text-light"><small>아이디/비밀번호 찾기</small></a>
				            </div>
				            <div class="col-6 text-right">
				            	<a href="${pageContext.request.contextPath}/teacher/signup" class="text-light"><small>회원가입</small></a>
				            </div>
		        		</div>
						`;
					$('#signup').html(signup);
	
					// enter하면 자동 넘어가기
					$('#accountId').on('keypress',function(e){
						if (e.keyCode == '13') {
							$('#accountPw').focus();
						}
	
					});
					$('#accountPw').on('keypress',function(e){
						if (e.keyCode == '13') {
							$('#loginBtn').click();
						}
					});
					
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
								if (data == "wait") {
									$("#modal-wait").modal("show");
									return;
								}
								
								// 탈퇴 상태
								if (data == "secession") {
									$("#modal-secession").modal("show");
									return;
								}
								
								// 정보가 없는 경우
								if (data == "none") {
									$("#modal-none").modal("show");
									return;
								} 
	
								// 휴면 상태
								if (data == "dormant-manager") {
									$("#modal-dormant").modal("show");
									return;
								}
								
								// 활성화 상태
								if (data == "active") {
									$('#loginForm').submit();
								}
							}
						});
					});
				});
	
				// 운영자 로그인
				$('#managerLogin').click(function() {
					let loginInput = `
						<div class="card-body px-lg-5 py-lg-5">
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
							<div class="text-danger" id="idCheck"></div>
							<div class="text-center">
								<button type="button" class="btn btn-primary my-4" id="loginBtn">로그인</button>
							</div>
						</form>
						</div> `;
						
					$('#login').html(loginInput);
					
					// 회원가입 및 아이디,비밀번호 찾기
					let signup = `
						<div class="row mt-3">
				            <div class="col-6">
				            	<a href="${pageContext.request.contextPath}/manager/forgotIdAndPassword" class="text-light"><small>아이디/비밀번호 찾기</small></a>
				            </div>
				            <div class="col-6 text-right">
				            	<a href="${pageContext.request.contextPath}/manager/signup" class="text-light"><small>회원가입</small></a>
				            </div>
		        		</div>
						`;
					$('#signup').html(signup);
	
					// enter하면 자동 넘어가기
					$('#accountId').on('keypress',function(e){
						if (e.keyCode == '13') {
							$('#accountPw').focus();
						}
	
					});
					$('#accountPw').on('keypress',function(e){
						if (e.keyCode == '13') {
							$('#loginBtn').click();
						}
					});
					
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
								if (data == "wait") {
									$("#modal-wait").modal("show");
									return;
								}
								
								// 탈퇴 상태
								if (data == "secession") {
									$("#modal-secession").modal("show");
									return;
								}
								
								// 정보가 없는 경우
								if (data == "none") {
									$("#modal-none").modal("show");
									return;
								} 
	
								// 휴면 상태
								if (data == "dormant") {
									$("#modal-dormant-admin").modal("show");
									return;
								}
								
								// 활성화 상태
								if (data == "active") {
									$('#loginForm').submit();
								}
							}
						});
					});
				});
			
				// 관리자 로그인
				$('#adminLogin').click(function() {
					let loginInput = `
						<div class="card-body px-lg-5 py-lg-5">
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
								<div class="text-danger" id="idCheck"></div>
								<div class="text-center">
									<button type="button" class="btn btn-primary my-4" id="loginBtn">로그인</button>
								</div>
							</form>
						</div> `;
					
					$('#login').html(loginInput);
					
					$('#signup').html('');
					
					// enter하면 자동 넘어가기
					$('#accountId').on('keypress',function(e){
						if (e.keyCode == '13') {
							$('#accountPw').focus();
						}
	
					});
					$('#accountPw').on('keypress',function(e){
						if (e.keyCode == '13') {
							$('#loginBtn').click();
						}
					});
					
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
								// 정보가 없는 경우
								if ( data == "none") {
									$("#modal-none").modal("show");
									return;
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
			<nav class="navbar navbar-top navbar-horizontal navbar-expand-md navbar-dark">
				<div class="container px-4">
					<a class="navbar-brand" href="${pageContext.request.contextPath}/">
						<img src="${pageContext.request.contextPath}/assets/img/brand/white.png" />
					</a>
					<button class="navbar-toggler" type="button" data-toggle="collapse"
						data-target="#navbar-collapse-main"
						aria-controls="navbarSupportedContent" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>
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
							<div class="modal fade" id="modal-manager" tabindex="-1"
								role="dialog" aria-labelledby="modal-default" aria-hidden="true">
								<div class="modal-dialog modal- modal-dialog-centered modal-"
									role="document">
									<div class="modal-content">
						
										<div class="modal-header">
											<h6 class="modal-title" id="modal-title-notification">확인</h6>
											<button type="button" class="close" data-dismiss="modal"
												aria-label="Close">
												<span aria-hidden="true">×</span>
											</button>
										</div>
						
										<div class="modal-body">
						
											<div class="py-3 text-center">
												<i class="ni ni-bell-55 ni-3x"></i>
												<h4 class="heading mt-4">회원가입 확인</h4>
												<p>회원가입이 완료되었습니다<br>운영자의 승인을 기다려주세요</p>
											</div>
						
										</div>
						
										<div class="modal-footer">
											<button type="button" class="btn btn-primary ml-auto" data-dismiss="modal">닫기</button>
										</div>
									</div>
								</div>
							</div>
							<div class="modal fade" id="modal-admin" tabindex="-1"
								role="dialog" aria-labelledby="modal-default" aria-hidden="true">
								<div class="modal-dialog modal- modal-dialog-centered modal-"
									role="document">
									<div class="modal-content">
						
										<div class="modal-header">
											<h6 class="modal-title" id="modal-title-notification">확인</h6>
											<button type="button" class="close" data-dismiss="modal"
												aria-label="Close">
												<span aria-hidden="true">×</span>
											</button>
										</div>
						
										<div class="modal-body">
						
											<div class="py-3 text-center">
												<i class="ni ni-bell-55 ni-3x"></i>
												<h4 class="heading mt-4">회원가입 확인</h4>
												<p>회원가입이 완료되었습니다<br>관리자의 승인을 기다려주세요</p>
											</div>
						
										</div>
						
										<div class="modal-footer">
											<button type="button" class="btn btn-primary ml-auto" data-dismiss="modal">닫기</button>
										</div>
									</div>
								</div>
							</div>
							<div class="modal fade" id="modal-wait" tabindex="-1"
								role="dialog" aria-labelledby="modal-notification" aria-hidden="true">
								<div class="modal-dialog modal-danger modal-dialog-centered modal-"
									role="document">
									<div class="modal-content bg-gradient-danger">
						
										<div class="modal-header">
											<h6 class="modal-title" id="modal-title-notification">경고</h6>
											<button type="button" class="close" data-dismiss="modal"
												aria-label="Close">
												<span aria-hidden="true">×</span>
											</button>
										</div>
						
										<div class="modal-body">
						
											<div class="py-3 text-center">
												<i class="ni ni-bell-55 ni-3x"></i>
												<h4 class="heading mt-4">로그인 불가</h4>
												<p>승인 대기 상태입니다<br>승인 후 이용가능합니다</p>
											</div>
						
										</div>
						
										<div class="modal-footer">
											<button type="button" class="btn btn-link text-white ml-auto" data-dismiss="modal">확인</button>
										</div>
									</div>
								</div>
							</div>
							<div class="modal fade" id="modal-secession" tabindex="-1"
								role="dialog" aria-labelledby="modal-notification" aria-hidden="true">
								<div class="modal-dialog modal-danger modal-dialog-centered modal-"
									role="document">
									<div class="modal-content bg-gradient-danger">
						
										<div class="modal-header">
											<h6 class="modal-title" id="modal-title-notification">경고</h6>
											<button type="button" class="close" data-dismiss="modal"
												aria-label="Close">
												<span aria-hidden="true">×</span>
											</button>
										</div>
						
										<div class="modal-body">
						
											<div class="py-3 text-center">
												<i class="ni ni-bell-55 ni-3x"></i>
												<h4 class="heading mt-4">로그인 불가</h4>
												<p>탈퇴한 회원입니다<br>해당 계정은 이용이 불가능합니다</p>
											</div>
						
										</div>
						
										<div class="modal-footer">
											<button type="button" class="btn btn-link text-white ml-auto" data-dismiss="modal">확인</button>
										</div>
									</div>
								</div>
							</div>
							<div class="modal fade" id="modal-none" tabindex="-1"
								role="dialog" aria-labelledby="modal-notification" aria-hidden="true">
								<div class="modal-dialog modal-danger modal-dialog-centered modal-"
									role="document">
									<div class="modal-content bg-gradient-danger">
						
										<div class="modal-header">
											<h6 class="modal-title" id="modal-title-notification">경고</h6>
											<button type="button" class="close" data-dismiss="modal"
												aria-label="Close">
												<span aria-hidden="true">×</span>
											</button>
										</div>
						
										<div class="modal-body">
						
											<div class="py-3 text-center">
												<i class="ni ni-bell-55 ni-3x"></i>
												<h4 class="heading mt-4">로그인 불가</h4>
												<p>가입하지 않은 아이디이거나, <br>잘못된 비밀번호입니다</p>
											</div>
						
										</div>
						
										<div class="modal-footer">
											<button type="button" class="btn btn-link text-white ml-auto" data-dismiss="modal">확인</button>
										</div>
									</div>
								</div>
							</div>
							<div class="modal fade" id="modal-dormant-manager" tabindex="-1"
								role="dialog" aria-labelledby="modal-notification" aria-hidden="true">
								<div class="modal-dialog modal-danger modal-dialog-centered modal-"
									role="document">
									<div class="modal-content bg-gradient-danger">
						
										<div class="modal-header">
											<h6 class="modal-title" id="modal-title-notification">경고</h6>
											<button type="button" class="close" data-dismiss="modal"
												aria-label="Close">
												<span aria-hidden="true">×</span>
											</button>
										</div>
						
										<div class="modal-body">
						
											<div class="py-3 text-center">
												<i class="ni ni-bell-55 ni-3x"></i>
												<h4 class="heading mt-4">로그인 불가</h4>
												<p>휴면계정입니다<br>운영자에게 문의해주세요</p>
											</div>
						
										</div>
						
										<div class="modal-footer">
											<button type="button" class="btn btn-link text-white ml-auto" data-dismiss="modal">확인</button>
										</div>
									</div>
								</div>
							</div>
							<div class="modal fade" id="modal-dormant-admin" tabindex="-1"
								role="dialog" aria-labelledby="modal-notification" aria-hidden="true">
								<div class="modal-dialog modal-danger modal-dialog-centered modal-"
									role="document">
									<div class="modal-content bg-gradient-danger">
						
										<div class="modal-header">
											<h6 class="modal-title" id="modal-title-notification">경고</h6>
											<button type="button" class="close" data-dismiss="modal"
												aria-label="Close">
												<span aria-hidden="true">×</span>
											</button>
										</div>
						
										<div class="modal-body">
						
											<div class="py-3 text-center">
												<i class="ni ni-bell-55 ni-3x"></i>
												<h4 class="heading mt-4">로그인 불가</h4>
												<p>휴면계정입니다<br>관리자에게 문의해주세요</p>
											</div>
						
										</div>
						
										<div class="modal-footer">
											<button type="button" class="btn btn-link text-white ml-auto" data-dismiss="modal">확인</button>
										</div>
									</div>
								</div>
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
									<div class="btn btn-neutral btn-icon" id="studentLogin"><span class="btn-inner--text">&nbsp;&nbsp;학생&nbsp;&nbsp;</span></div>
									<div class="btn btn-neutral btn-icon" id="teacherLogin"><span class="btn-inner--text">&nbsp;&nbsp;강사&nbsp;&nbsp;</span></div>
								</div>
								<div class="btn-wrapper text-center mt-3">
									<div class="btn btn-neutral btn-icon" id="managerLogin"><span class="btn-inner--text">운영자</span></div>
									<div class="btn btn-neutral btn-icon" id="adminLogin"><span class="btn-inner--text">관리자</span></div>
								</div>
							</div>
							<div id="login">
							
							</div>
						</div>
						<div id="signup"></div>
					</div>
				</div>
			</div>
			<jsp:include page="/WEB-INF/view/include/footer.jsp"></jsp:include>
		</div>
		<!--   Core   -->
		<script src="${pageContext.request.contextPath}/assets/js/plugins/jquery/dist/jquery.min.js"></script>
		<script	src="${pageContext.request.contextPath}/assets/js/plugins/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
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