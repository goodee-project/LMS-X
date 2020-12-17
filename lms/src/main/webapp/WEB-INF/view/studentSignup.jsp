<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>studentSignup</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script>
		$(document).ready(function(){
			// 아이디 중복 검사
			let idCheck ;
			$('#idCheck').click(function() {
				if ( $('#accountId').val() != "" ) {
					$.ajax({
						url : "${pageContext.request.contextPath}/signup/accountIdCheck/"+$('#accountId').val(),
						type : 'get',
						success : function(data) {
							if ( data == "true" ) {
								$("#idCheckMs").html("사용 가능한 아이디입니다.");
							} else {
								$("#idCheckMs").html("사용 불가능한 아이디입니다.");
								idCheck = "false";
								return;
							}
						}
					})
				}
			})
			// 이메일 중복검사
			let emailCheck ; // 이메일 체크
			$('#emailCheck').click(function(){
				if ( $('#studentEmail').val() != "" ) {
					if ( CheckEmail( $('#studentEmail').val() ) == false ) {
						$('#studentEmail').focus();
						$('#studentEmailCheck').html('이메일 형식이 잘못 되었습니다.');
						return;
					} else {
						$('#studentEmailCheck').html('');
						$.ajax({
							url : "${pageContext.request.contextPath}/signup/emailCheck/"+$('#studentEmail').val(),
							type : 'get',
							success : function(data) {
								if ( data == "true" ) {
									$("#emailCheckMs").html("사용 가능한 이메일입니다.");
									
								} else {
									$("#emailCheckMs").html("사용 불가능한 이메일입니다.");
									emailCheck = "false";
									return;
								}
							}
						})
					}
				}
			})
			let address;
			// 주소 검색
			if ( $('#street').val().length <1 ) {
				// 공백 체크
				function checkSpace(str) {
					if ( str.search(/\s/) != -1 ) {
						// 공백이 있으면
						return true;  
					} else {
						// 공백이 없으면
						return false; 
					} 
				}
				function checkSpecial(str) {
					if ( str.search(/-/)!= -1 ) {
						return true;
					} else {
						return false;
					}
				}
				
				$('#check').click(function() {
					if ( $('#street').val() != "" ) {
						$('#addressWait').html("(잠시만 기달려주세요)");
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
							url : "${pageContext.request.contextPath}/signup/address/"+street+"/"+building1+"/"+building2,
							type :'get',
							success : function(data) {
								$("#selectAddress").html("");
								
								for ( i=0; i<data.length; i++ ) {
									// building2데이터가 있으면
									if ( data[i].building2 != 0 ) {
										$("#selectAddress").append("<div><input type='radio' class='address' name='studentAddressMain' value='"+data[i].province+" "+data[i].city+" "+data[i].town+" "+data[i].street+" "+data[i].building1+"-"+data[i].building2+"("+data[i].zipCode+")"+"'>"
												+data[i].province+" "+data[i].city+" "+data[i].town+" "+data[i].street+" "+data[i].building1+"-"+data[i].building2+"("+data[i].zipCode+")"+"</div>");
									}
									// building2데이터가 없으면
									if ( data[i].building2 == 0 ) {
										$("#selectAddress").append("<div><input type='radio' class='address' name='studentAddressMain' value='"+data[i].province+" "+data[i].city+" "+data[i].town+" "+data[i].street+" "+data[i].building1+"("+data[i].zipCode+")"+"'>"
												+data[i].province+" "+data[i].city+" "+data[i].town+" "+data[i].street+" "+data[i].building1+"("+data[i].zipCode+")"+"</div>");
									}
								}
								$('#addressWait').html("");
							}	

						});

					}
				})
			}
			// 이메일 형식 검사
			function CheckEmail(str) {
			   var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			   if ( regExp.test(str) ) {
			       return true;
			   }else{
			       return false;
			   }
			}

			// 회원가입 버튼을 눌렀을 경우
			$('#btn').click(function() {
				// 아이디검사
				if ( $('#accountId').val() == "" ) {
					$('#accountId').focus();
					return;
				}else if ( idCheck == "false" ) {
					$('#accountId').focus();
					return;
				}

				// 비밀번호검사
				if ( $('#studentPw1').val().length < 7 ) {
					$('#studentPw1').focus();
					return;
				} else if ( $('#studentPw2').val() == "" ) {
					$('#studentPw2').focus();
					return;
				} else if ( $('#studentPw1').val() != $('#studentPw2').val() ) {
					$('#studentPw1').focus();
					$('#studentPwCheck').html('비밀번호가 일치하지않습니다.');
					return;
				} else {
					$('#studentPwCheck').html('');
				}


				
				// 이메일 검사
				if ( $('#studentEmail').val() == "" ) {
					$('#studentEmail').focus();
					return;
				} else if ( CheckEmail($('#studentEmail').val()) == false ) {
					$('#studentEmail').focus();
					$('#studentEmailCheck').html('이메일 형식이 잘못 되었습니다.');
					return;
				}else if ( emailCheck == "false" ) {
					$('#studentEmail').focus();
					return;
				}else {
					$('#studentEmailCheck').html('');
				}

				// 이름 검사
				if ( $('#studentName').val() == "" ) {
					$('#studentName').focus();
					return;
				}
				// 핸드폰 형식 검사
				function telValidator(args) {
		   			let phoneCk = /^[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}/;
		   			if ( phoneCk.test(args) ) {
		       			 return true;
		   		 	}
		    		return false;
				}
				// 핸드폰 검사
				if ( $('#studentPhone').val() == "" ) {
					$('#studentPhone').focus();
					return;
				}else if ( telValidator($('#studentPhone').val()) == false ) {
					$('#studentPhone').focus();
					$('#studentPhoneCheck').html('전화번호 형식이 잘못 되었습니다.');
					return;
				} else {
					$('#studentPhoneCheck').html('');
				}
				
				// 성별 검사
				if ( $('.studentGender:checked').val() == undefined ) {
					$('#studentGender').focus();
					$('#studentGenderCheck').html('성별을 체크해주세요');
					return;
				}else {
					$('#studentGenderCheck').html('');
				}
				
				// 생년월일 검사
				if ( $('#studentBirth').val() == "" ) {
					$('#studentBirth').focus();
					$('#studentBirthCheck').html('생년월일을 입력해주세요')
					return;
				} else {
					$('#studentBirthCheck').html('')
				}
				
				// 주소 검사
				if ( $('.address:checked').val() == undefined ) {
					$('#addressCheck').html("주소를 검색해주세요")
					return;
				} else {
					$('#addressCheck').html("");
				}
				
				// 상세주소 검사
				if ( $('#studentAddressSub').val() == "" ) {
					$('#studentAddressSub').focus();
					return;
				}
				
				$('#studentForm').submit();
			});
		});	
	</script>
</head>
<body>
	<h1>학생회원가입</h1>
	<form id="studentForm" method="post" action="${pageContext.request.contextPath}/student/signup">
		<input type="text" hidden="hidden" value="1" name="accountLevel">
		<input type="text" hidden="hidden" value="대기" name="accountState">
		<div>아이디</div>
		<div>
			<input id="accountId" type="text" placeholder="아이디를 입력하세요"	name="accountId">
			<button id="idCheck" type="button">중복체크</button>
		</div>
		<span id="idCheckMs"></span>

		<div>비밀번호</div>
		<div class="input password">
			<input id="studentPw1" type="password" placeholder="7자리 이상 입력해주세요" name=accountPw>
		</div>
		<div class="input password">
			<input id="studentPw2" type="password" placeholder="다시 비밀번호를 입력하세요">
		</div>
		<div id="studentPwCheck"></div>

		<div>이메일</div>
		<div>
			<input id="studentEmail" type="email" placeholder="abc@abc.abc"	name="studentEmail">
			<button id="emailCheck" type="button">중복체크</button>
		</div>
		<div id="studentEmailCheck"></div>
		<span id="emailCheckMs"></span>

		<div>이름</div>
		<div>
			<input id="studentName" type="text" placeholder="이름을 입력하세요"	name="studentName">
		</div>

		<div>핸드폰번호</div>
		<div>
			<input id="studentPhone" type="text" placeholder="000-0000-000"	name="studentPhone">
		</div>
		<div id="studentPhoneCheck"></div>
		
		<div>성별</div>
		<div>
			<input class="studentGender" type="radio" name="studentGender" value="남">남
			<input class="studentGender" type="radio" name="studentGender" value="여">여
			<span id="studentGenderCheck"></span>
		</div>
		
		<div>생년월일</div>
		<div>
			<input id="studentBirth" type="date" name="studentBirth">
		</div>
		<div id="studentBirthCheck"></div>
		<div>주소  <span id="addressWait"></span> </div>
		
		<div>
			<input id="street" type="text" name="street" placeholder="도로명을 입력하세요.">
			<button id="check" type="button">검색</button>
			<span id="addressCheck"></span>
			<div id="studentAddressMain"></div>
			<div id="selectAddress" style="overflow:auto; width:500px; max-height:200px;"></div>
		</div>

		<div>상세주소</div>
		<div>
			<input id="studentAddressSub" type="text" placeholder="상세주소를 입력하세요"	name="studentAddressSub">
		</div>
	
		<div>
			<button id="btn" type="button">회원가입</button>
			<a href="${pageContext.request.contextPath}/">취소</a>
		</div>
	</form>
</body>
</html>