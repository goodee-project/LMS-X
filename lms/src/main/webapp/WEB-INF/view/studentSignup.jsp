<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>studentSignup</title>
		
		<!-- Bootstrap Framework 사용 -->
		
		<!-- Latest compiled and minified CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
		
		<!-- jQuery library -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		
		<!-- Popper JS -->
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
		
		<!-- Latest compiled JavaScript -->
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
		
		<!-- Bootstrap 4 Icons -->
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
		
		<style>
			.table td {
				text-align: center;
				vertical-align: middle;
			}
		</style>
		
		<script>
			$(document).ready(function(){
				// 아이디 중복 검사
				let idCheck = "false";
				$('#idCheck').click(function() {
					if ($('#accountId').val() != "") {
						$.ajax({
							url : "${pageContext.request.contextPath}/signup/accountIdCheck/"+$('#accountId').val(),
							type : 'get',
							success : function(data) {
								if (data == "true") {
									$("#idCheckMs").html("사용 가능한 아이디입니다.");
									idCheck = "true";
								} else {
									$("#idCheckMs").html("사용 불가능한 아이디입니다.");
								
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
							$('#studentEmailCheck').html("이메일 형식이 잘못 되었습니다.");
							return;
						} else {
							
							$.ajax({
								url : '${pageContext.request.contextPath}/signup/emailCheck/'+$('#studentEmail').val(),
								type : 'get',
								success : function(data) {
									$('#studentEmailCheck').html("");
									if ( data == "true" ) {
										$('#studentEmailCheck').html("사용 가능한 이메일입니다.");
										emailCheck = "ture";
										return;
										
									} else {
										$('#studentEmailCheck').html("사용 불가능한 이메일입니다.");
										
										return;
									}
									
								}
							})
						}
					}
				});
				
				let address;
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
					if ( $('#street').val().length > 1 ) {
						$('#addressWait').html("(잠시만 기다려 주세요...)");
						let street = null;
						let building1 = null;
						let building2 = null;
						// 앞뒤 공백 제거
						let trimStreet = $('#street').val().trim(); 
						if ( checkSpace(trimStreet) == true ) {
							// 연속된 공백을 1개의 공백으로 설정
							let replaceStreet = trimStreet.replace(/ +/g, " ");
							
							// 값에 공백이 있으면 나누기
							let afterAddress = replaceStreet.split(" "); 
							street = afterAddress[0];
							let buildingTotal = afterAddress[1];
							
							// 변수 값에 '-' 가 있는지 체크
							if ( checkSpecial(buildingTotal) == true ) {
								// 모든 공백 제거
								let allReplaceBuilding = buildingTotal.replace(/(\s*)/g, "") 
								// 값에 - 가 있으면 나누기
								let afterBuilding = allReplaceBuilding.split("-"); 
								building1 = afterBuilding[0]; 
								building2 = afterBuilding[1];

								//building2가 공백이면 null
								if ( building2 == "" ) {
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
										$('#selectAddress').append('<div><input type="radio" class="address" name="studentAddressMain" value="' + data[i].province + ' ' + data[i].city+' ' + data[i].town+' ' + data[i].street+' ' + data[i].building1+'-'+ data[i].building2+'(' + data[i].zipCode + ')">'
												+ data[i].province + ' ' + data[i].city + ' ' + data[i].town + ' ' + data[i].street + ' ' + data[i].building1 + '-' + data[i].building2 + '('+data[i].zipCode + ')' + '</div>');
									}
									// building2 데이터가 없으면
									if (data[i].building2 == 0) {
										$('#selectAddress').append('<div><input type="radio" class="address" name="studentAddressMain" value="' + data[i].province + ' ' + data[i].city + ' ' + data[i].town + ' ' + data[i].street + ' ' + data[i].building1 + '(' + data[i].zipCode + ')">'
												+ data[i].province + ' ' + data[i].city + ' ' + data[i].town + ' ' + data[i].street + ' ' + data[i].building1 + '('+data[i].zipCode + ')' + '</div>');
									}
								}
								$('#addressWait').html("");
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
					// 8 ~ 10자 영문, 숫자 조합
					var regExp = /^(?=.*\d)(?=.*[a-zA-Z])[0-9a-zA-Z]{8,10}$/; 
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
						$('#idCheckMs').html("아이디 중복 확인해주세요.")
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
						$('#studentPwCheck').html("비밀번호 형식이 맞지 않습니다.");
						return;
						
					} else if ($('#studentPw1').val() != $('#studentPw2').val()) {
						$('#studentPw1').focus();
						$('#studentPwCheck').html("비밀번호가 일치하지않습니다.");
						return;
					} else {
						$('#studentPwCheck').html("");
					}
	
	
					
					// 이메일 검사
					if ($('#studentEmail').val() == "") {
						$('#studentEmail').focus();
						return;
					} else if (CheckEmail($('#studentEmail').val()) == false) {
						$('#studentEmail').focus();
						$('#studentEmailCheck').html("이메일 형식이 잘못 되었습니다.");
						return;
					} else if (emailCheck == "false") {
						$('#studentEmail').focus();
						$('#studentEmailCheck').html("이메일 중복 확인해주세요");
						return;
					} else {
						$('#studentEmailCheck').html("");
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
						$('#studentPhoneCheck').html("전화번호 형식이 잘못 되었습니다.");
						return;
					} else {
						$('#studentPhoneCheck').html("");
					}
					
					// 성별 검사
					if ($('.studentGender:checked').val() == undefined) {
						$('#studentGender').focus();
						$('#studentGenderCheck').html("성별을 체크해주세요");
						return;
					} else {
						$('#studentGenderCheck').html("");
					}
					
					// 생년월일 검사
					if ($('#studentBirth').val() == "") {
						$('#studentBirth').focus();
						$('#studentBirthCheck').html("생년월일을 입력해주세요")
						return;
					} else {
						$('#studentBirthCheck').html("")
					}
					
					// 주소 검사
					if ($('.address:checked').val() == undefined) {
						$('#addressCheck').html("주소를 검색해주세요")
						return;
					} else {
						$('#addressCheck').html("");
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
	<body>
		<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
			<div class="container">
				<ul class="navbar-nav mr-auto">
					<!-- 강사 Navbar Brand -->
					<li class="nav-item">
						<a class="navbar-brand" href="${pageContext.request.contextPath}/auth/teacher/index/1">Goodee LMS</a>
					</li>
				</ul>
				
				<ul class="navbar-nav mr-right">
					<!-- 아이디 출력 및 로그아웃 버튼 -->
					<li class="nav-item">
						<button type="button" class="btn btn-success btn-sm" onclick="location.href='${pageContext.request.contextPath}/'">로그인</button>
				    </li>
				</ul>
			</div>
		</nav>
		
		<!-- 상단 인터페이스 -->
		<div class="jumbotron jumbotron-fluid">
			<div class="container">
				<h1>학생 회원가입</h1>
				<p>학생들이 회원가입을 하는 메뉴입니다.</p>
			</div>
		</div>
		
		<!-- 본문 -->
		<div class="container">
			<form id="studentForm" method="post" action="${pageContext.request.contextPath}/student/signup">
				<input type="text" hidden="hidden" name="accountLevel" value="1">
				<input type="text" hidden="hidden" name="accountState" value="대기">
				
				<table class="table">
					<tr>
						<td width="20%">아이디</td>
						<td width="80%">
							<div class="input-group">
								<input class="form-control" type="text" id="accountId" name="accountId" placeholder="아이디를 입력하세요">
								<div class="input-group-append">
									<button class="btn btn-primary" id="idCheck" type="button">중복 체크</button>
								</div>
							</div>
							<span id="idCheckMs"></span>
						</td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td>
							<div class="input password">
								<input type="password" class="form-control" name="accountPw" id="studentPw1" placeholder="8~10자 영문, 숫자">
							</div>
						</td>
					</tr>
					<tr>
						<td>비밀번호 확인</td>
						<td>
							<div class="input password">
								<input type="password" class="form-control" id="studentPw2" placeholder="한번 더 비밀번호를 입력하세요">
							</div>
							<div id="studentPwCheck"></div>
						</td>
					</tr>
					<tr>
						<td>이메일</td>
						<td>
							<div class="input-group">
								<input type="email" class="form-control" name="studentEmail" id="studentEmail" placeholder="abc@abc.abc">
								<div class="input-group-append">
									<button type="button" class="btn btn-primary" id="emailCheck">중복 체크</button>
								</div>
							</div>
							<div id="studentEmailCheck"></div>
						</td>
					</tr>
					<tr>
						<td>이름</td>
						<td>
							<div>
								<input type="text" class="form-control" name="studentName" id="studentName" placeholder="이름을 입력하세요">
							</div>
						</td>
					</tr>
					<tr>
						<td>휴대전화 번호</td>
						<td>
							<div>
								<input type="text" class="form-control" name="studentPhone" id="studentPhone" placeholder="000-0000-000">
							</div>
							<div id="studentPhoneCheck"></div>
						</td>
					</tr>
					<tr>
						<td>성별</td>
						<td>
							<div>
								<input type="radio" class="studentGender" name="studentGender" value="남">&nbsp;남&nbsp;&nbsp;
								<input type="radio" class="studentGender" name="studentGender" value="여">&nbsp;여
								<span id="studentGenderCheck"></span>
							</div>
						</td>
					</tr>
					<tr>
						<td>생년월일</td>
						<td>
							<div>
								<input type="date" class="form-control" name="studentBirth" id="studentBirth">
							</div>
							<div id="studentBirthCheck"></div>
						</td>
					</tr>
					<tr>
						<td>주소</td>
						<td>
							<span id="addressWait"></span>
						
							<div class="input-group">
								<input type="text" class="form-control" name="street" id="street" placeholder="도로명을 입력하세요.">
								<div class="input-group-append">
									<button type="button" class="btn btn-primary" id="check">검색</button>
								</div>
							</div>
							
							<span id="addressCheck"></span>
							<div id="studentAddressMain"></div>
							<div id="selectAddress" style="overflow: auto; width: 100%; max-height: 200px;"></div>
						</td>
					</tr>
					<tr>
						<td>상세 주소</td>
						<td>
							<div>
								<input type="text" class="form-control" id="studentAddressSub" placeholder="상세 주소를 입력하세요"	name="studentAddressSub">
							</div>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<button type="button" class="btn btn-success" id="btn">회원가입</button>
							&nbsp;
							<button type="button" class="btn btn-danger" onclick="location.href='${pageContext.request.contextPath}/'">취소</button>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</body>
</html>