<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<title>studentSignup</title>
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
		
		<script>
			$(document).ready(function(){
				// 아이디 중복 검사
				let idCheck = "false";
				$('#idCheck').click(function() {
					if ($('#accountId').val() != "") {
						$.ajax({
							url : '${pageContext.request.contextPath}/signup/accountIdCheck/'+$('#accountId').val(),
							type : 'get',
							success : function(data) {
								if (data == "true") {
									$("#idCheckMs").html('<span class="text-success">사용 가능한 아이디입니다.</span>');
									idCheck = "true";
								} else {
									$("#idCheckMs").html('<span class="text-danger">사용 불가능한 아이디입니다.</span>');
								
									return;
								}
							}
						})
					}
				});
				
				// 이메일 중복검사
				let emailCheck ="false" ; // 이메일 체크
				$('#emailCheck').click(function(){
					
					if ( $('#studentEmail').val() != "" ) {
						$('#studentEmailCheck').html("");
						if (CheckEmail( $('#studentEmail').val()) == false) {
							$('#studentEmail').focus();
							$('#studentEmailCheck').html('<span class="text-danger">이메일 형식이 잘못 되었습니다.</span>');
							return;
						} else {
							
							$.ajax({
								url : '${pageContext.request.contextPath}/signup/emailCheck/'+$('#studentEmail').val(),
								type : 'get',
								success : function(data) {
									$('#studentEmailCheck').html('');
									if ( data == "true" ) {
										$('#studentEmailCheck').html('<span class="text-success">사용 가능한 이메일입니다.</span>');
										emailCheck = "ture";
										return;
										
									} else {
										$('#studentEmailCheck').html('<span class="text-danger">사용 불가능한 이메일입니다.</span>');
										
										return;
									}
									
								}
							})
						}
					}
				});
				
				// 주소 검색
				// 공백 체크
				function checkSpace(str) {
					if (str.search(/\s/) != -1) {
						// 공백이 있으면
						return true;  
					} else {
						// 공백이 없으면
						return false; 
					} 
				}
				
				function checkSpecial(str) {
					if (str.search(/-/) != -1) {
						return true;
					} else {
						return false;
					}
				}
				
				$('#check').click(function() {
					$('#addressCheck').html("");
					if ($('#street').val().length > 1) {
						$('#addressWait').html("(잠시만 기다려 주세요...)");
						let street = null;
						let building1 = null;
						let building2 = null;
						// 앞뒤 공백 제거
						let trimStreet = $('#street').val().trim(); 
						if (checkSpace(trimStreet) == true) {
							// 연속된 공백을 1개의 공백으로 설정
							let replaceStreet = trimStreet.replace(/ +/g, " ");
							
							// 값에 공백이 있으면 나누기
							let afterAddress = replaceStreet.split(" "); 
							street = afterAddress[0];
							let buildingTotal = afterAddress[1];
							
							// 변수 값에 '-' 가 있는지 체크
							if (heckSpecial(buildingTotal) == true) {
								// 모든 공백 제거
								let allReplaceBuilding = buildingTotal.replace(/(\s*)/g, "") 
								// 값에 - 가 있으면 나누기
								let afterBuilding = allReplaceBuilding.split("-"); 
								building1 = afterBuilding[0]; 
								building2 = afterBuilding[1];

								//building2가 공백이면 null
								if (building2 == "") {
									building2 = null;
								}
							
							} else {
								building1 = buildingTotal;
							}
							
							
						} else {	
							// 앞뒤 공백 제거
							let trimStreet = $('#street').val().trim(); 
							street = trimStreet;
						}
						$.ajax({
							url : '${pageContext.request.contextPath}/signup/address/' + street + '/' + building1 + '/' + building2,
							type :'get',
							success : function(data) {
								$('#selectAddress').html("");

								// 데이터가 없으면
								if (data.length == 0) {
									$('#selectAddress').html("등록된 주소가 없습니다.");
								}
								
								for (i = 0; i < data.length; i++) {
									// building2 데이터가 있으면
									if (data[i].building2 != 0) {
										$('#selectAddress').append('<div><button type="button" class="addressBtn form-control" value="' + '(' + data[i].zipCode + ')' + data[i].province + ' ' + data[i].city+' ' + data[i].town+' ' + data[i].street+' ' + data[i].building1+'-'+ data[i].building2+'">'
												+  '('+data[i].zipCode + ')' +  data[i].province + ' ' + data[i].city + ' ' + data[i].town + ' ' + data[i].street + ' ' + data[i].building1 + '-' + data[i].building2 +'</button></div>');
									}
									// building2 데이터가 없으면
									if (data[i].building2 == 0) {
										$('#selectAddress').append('<div><button type="button" class="addressBtn form-control" value="' + '(' + data[i].zipCode + ')' + data[i].province + ' ' + data[i].city + ' ' + data[i].town + ' ' + data[i].street + ' ' + data[i].building1 +'">'
												+ '('+data[i].zipCode + ')' + data[i].province + ' ' + data[i].city + ' ' + data[i].town + ' ' + data[i].street + ' ' + data[i].building1 + '</button></div>');
									}
									
								}
								$('#addressWait').html("");
								$('.addressBtn').click(function(){
									$('#addressView').html(`<span class="text-primary" style="margin: auto; width: 80px;">주소</span>
															<input id="studentAddressMain" class="form-control" style=" background-color: white;" type="text" name="studentAddressMain" readonly="readonly" >`);
									document.getElementById("studentAddressMain").value = $(this).val();

								});
							
							}	

						});

					}
				});
				
				// 이메일 형식 검사
				function CheckEmail(str) {
				   var regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	
				   if (regExp.test(str)) {
				       return true;
				   } else {
				       return false;
				   }
				}
				
				//비밀번호 형식 검사
				function isJobPassword(str) {
					// 8 ~ 18자 영문, 숫자 조합
					var regExp = /^(?=.*\d)(?=.*[a-zA-Z])[0-9a-zA-Z]{8,18}$/; 
					// 형식에 맞는 경우 true 리턴
					if (regExp.test(str)) {
						return true;
					} else {
						return false;
					}
				}
	
				// 회원가입 버튼을 눌렀을 경우
				$('#btn').click(function() {
					// 아이디검사
					if ($('#accountId').val() == "") {
						$('#accountId').focus();
						return;
					} else if ( idCheck == "false" ) {
						$('#accountId').focus();
						$('#idCheckMs').html('<span class="text-danger">아이디 중복 확인해주세요.</span>')
						return;
					}
	
					// 비밀번호검사
					if ($('#studentPw1').val().length < 7) {
						$('#studentPw1').focus();
						return;
					} else if ($('#studentPw2').val() == "") {
						$('#studentPw2').focus();
						return;
					} else if (isJobPassword($('#studentPw1').val()) == false) {
						$('#studentPw1').focus();
						$('#studentPwCheck').html('<span class="text-danger">비밀번호 형식이 맞지 않습니다.</span>');
						return;
						
					} else if ($('#studentPw1').val() != $('#studentPw2').val()) {
						$('#studentPw1').focus();
						$('#studentPwCheck').html('<span class="text-danger">비밀번호가 일치하지않습니다.</span>');
						return;
					} else {
						$('#studentPwCheck').html('');
					}
					
					// 이메일 검사
					if ($('#studentEmail').val() == "") {
						$('#studentEmail').focus();
						return;
					} else if (CheckEmail($('#studentEmail').val()) == false) {
						$('#studentEmail').focus();
						$('#studentEmailCheck').html('<span class="text-danger">이메일 형식이 잘못 되었습니다.</span>');
						return;
					} else if (emailCheck == "false") {
						$('#studentEmail').focus();
						$('#studentEmailCheck').html('<span class="text-danger">이메일 중복 확인해주세요</span>');
						return;
					} else {
						$('#studentEmailCheck').html('');
					}
	
					// 이름 검사
					if ($('#studentName').val() == "") {
						$('#studentName').focus();
						return;
					}
					// 핸드폰 형식 검사
					function telValidator(args) {
			   			let phoneCk = /^[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}/;
			   			if (phoneCk.test(args)) {
			       			 return true;
			   		 	}
			    		return false;
					}
					// 핸드폰 검사
					if ($('#studentPhone').val() == "") {
						$('#studentPhone').focus();
						return;
					} else if (telValidator($('#studentPhone').val()) == false) {
						$('#studentPhone').focus();
						$('#studentPhoneCheck').html('<span class="text-danger">전화번호 형식이 잘못 되었습니다.<span>');
						return;
					} else {
						$('#studentPhoneCheck').html('');
					}
					
					// 성별 검사
					if ($('.studentGender:checked').val() == undefined) {
						$('#studentGender').focus();
						$('#studentGenderCheck').html('<span class="text-danger">성별을 체크해주세요</span>');
						return;
					} else {
						$('#studentGenderCheck').html('');
					}
					
					// 생년월일 검사
					if ($('#studentBirth').val() == "") {
						$('#studentBirth').focus();
						$('#studentBirthCheck').html('<span class="text-danger">생년월일을 입력해주세요</span>')
						return;
					} else {
						$('#studentBirthCheck').html('')
					}
					
					// 주소 검사
					if ($('#studentAddressMain').val() == "") {
						$('#addressCheck').html('<span class="text-danger">주소를 검색해주세요</span>')
						return;
					} else {
						$('#addressCheck').html('');
					}
					
					// 상세주소 검사
					if ($('#studentAddressSub').val() == "") {
						$('#studentAddressSub').focus();
						return;
					}
					
					$('#studentForm').submit();
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
			        <!-- Navbar items -->
			        <ul class="navbar-nav ml-auto">
			            <li class="nav-item">
			              <a class="nav-link nav-link-icon" href="${pageContext.request.contextPath}/">
			                <i class="ni ni-key-25"></i>
			                <span class="nav-link-inner--text">Login</span>
			              </a>
			            </li>
			        </ul>
		        </div>
		    </nav>
			<!-- Header -->
			<div class="header bg-gradient-primary py-7 py-lg-8">
				<div class="container">
					<div class="header-body text-center mb-7">
						<div class="row justify-content-center">
							<div class="col-lg-5 col-md-6">
								<h1 class="text-white">Goodee LMS</h1>
								<p class="text-lead text-light">학생 회원가입</p>
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
					<div class="col-lg-7 col-md-7">
						<div class="card bg-secondary shadow border-0">
							<div class="card-header bg-transparent pb-5">
								<form id="studentForm" method="post" action="${pageContext.request.contextPath}/student/signup">
									<input type="text" hidden="hidden" name="accountLevel" value="1">
									<input type="text" hidden="hidden" name="accountState" value="대기">
									<!-- 아이디 -->
									<div class="btn-wrapper text-center mt-3">
										<div class="input-group input-group-alternative">
											<span class="text-primary" style="margin: auto; width: 80px;">아이디</span>
											<input class="form-control" type="text" id="accountId" name="accountId" placeholder="  아이디를 입력하세요">
											<div class="input-group-append">
												<button class="btn btn-primary" id="idCheck" type="button">중복 체크</button>
											</div>
										</div>
										<div id="idCheckMs"></div>
									</div>
									
									<!-- 비밀번호 -->
									<div class="btn-wrapper text-center mt-3">
										<div class="input-group input-group-alternative">
											<span class="text-primary" style="margin: auto; width: 80px;">비밀번호</span>
											<input type="password" class="form-control" name="accountPw" id="studentPw1" placeholder="  8~10자 영문, 숫자">
										</div>
									</div>
									
									<!-- 비밀번호 확인 -->
									<div class="btn-wrapper text-center mt-3">
										<div class="input-group input-group-alternative">
											<span class="text-primary" style="margin: auto; width: 80px;">비밀번호 확인</span>
											<input type="password" class="form-control" id="studentPw2" placeholder="  한번 더 비밀번호를 입력하세요">
										</div>
										<div id="studentPwCheck"></div>
									</div>
									
									<!-- 이메일 -->
									<div class="btn-wrapper text-center mt-3">
										<div class="input-group input-group-alternative">
											<span class="text-primary" style="margin: auto; width: 80px;">이메일</span>
											<input type="email" class="form-control" name="studentEmail" id="studentEmail" placeholder="  abc@abc.abc">
											<div class="input-group-append">
												<button type="button" class="btn btn-primary" id="emailCheck">중복 체크</button>
											</div>
										</div>
										<div id="studentEmailCheck"></div>
									</div>
									<!-- 이름, 성별 -->
									<div class="row" style="margin: auto;">
										<div class="btn-wrapper text-center mt-3 ">
											<div class="input-group input-group-alternative">
												<span class="text-primary" style="margin: auto; width: 80px;">이름</span>
												<input type="text" class="form-control" name="studentName" id="studentName" placeholder="  이름을 입력하세요">
											</div>
										</div>
										<div class="btn-wrapper text-center mt-3" style="margin: auto; " >
										
											<div class="input-group-text input-group-alternative " style="width: 220px; height: 45px; ">
												<span class="text-primary" style="margin: auto;"><input type="radio" class="studentGender" name="studentGender" value="남">&nbsp;남&nbsp;&nbsp;</span>
												<span class="text-primary" style="margin: auto;"><input type="radio" class="studentGender" name="studentGender" value="여">&nbsp;여</span>
											</div>
											<div id="studentGenderCheck"></div>
										</div>
									</div>
									<!-- 핸드폰 번호 -->
									<div class="btn-wrapper text-center mt-3">
										<div class="input-group input-group-alternative">
											<span class="text-primary" style="margin: auto; width: 80px;">핸드폰 <br>번호</span>
											<input type="text" class="form-control" name="studentPhone" id="studentPhone" placeholder="  000-0000-000">
										</div>
										<div id="studentPhoneCheck"></div>
									</div>
									<!-- 생년월일 -->
									<div class="btn-wrapper text-center mt-3">
										<div class="input-group input-group-alternative">
												<span class="text-primary" style="margin: auto; width: 80px;">생년월일</span>
											<input type="date" class="form-control" name="studentBirth" id="studentBirth">
										</div>
									</div>
									<!-- 주소 -->
									<div class="btn-wrapper text-center mt-3">
										<div id="addressView" class="input-group input-group-alternative" >
											<span class="text-primary" style="margin: auto; width: 80px;">주소</span>
											<input id="studentAddressMain" class="form-control" style=" background-color: white;" type="text" placeholder="  주소를 검색해주세요." name="studentAddressMain" readonly="readonly" >
										</div>
									</div>
									<!-- 상세 주소 -->
									<div class="btn-wrapper text-center mt-3">
										<div class="input-group input-group-alternative" >
											<span class="text-primary" style="margin: auto; width: 80px;">상세 주소</span>
											<input type="text" class="form-control" id="studentAddressSub" placeholder="  상세 주소를 입력하세요"	name="studentAddressSub">
										</div>
									</div>
									<div style="margin-top: 20px;"class = "text-center">
										<button type="button" class="btn btn-primary" id="btn">회원가입</button>
									</div>
								</form>
							</div>
							<div class="card-header bg-transparent pb-5">
								<div class="btn-wrapper text-center mt-3">
									<div class="input-group input-group-alternative" >
										<span class="text-primary" style="margin: auto; width: 80px;">주소 검색</span>
										<input type="text" class="form-control" name="street" id="street" placeholder="  도로명을 입력하세요.">
										<div class="input-group-append">
											<button type="button" class="btn btn-primary" id="check">검색</button>
										</div>
									</div>
									<span id="addressCheck"></span>
									<span id="addressWait"></span>
									<div class="input-group input-group-alternative" >
										<div id="studentAddressMain"></div>
										<div id="selectAddress" style="overflow: auto; width: 100%; max-height: 200px;"></div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<jsp:include page="/WEB-INF/view/include/footer.jsp"></jsp:include>
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