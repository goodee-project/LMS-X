<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>updateMypage</title>
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
	<script>
		$(document).ready(function(){
			// 이메일 중복검사
			let emailCheck ="false" ; // 이메일 체크
			$('#emailCheck').click(function(){
				
				if ( $('#managerEmail').val() != "" ) {
					$('#managerEmailCheck').html("");
					if (CheckEmail( $('#managerEmail').val()) == false) {
						$('#managerEmail').focus();
						$('#managerEmailCheck').html("이메일 형식이 잘못 되었습니다.");
						return;
					} else {
						if ($('#managerEmail').val() != $('#originalManagerEmail').val()) {
							$.ajax({
								url : '${pageContext.request.contextPath}/signup/emailCheck/'+$('#managerEmail').val(),
								type : 'get',
								success : function(data) {
									$('#managerEmailCheck').html("");
									if ( data == "true" ) {
										$('#managerEmailCheck').html("사용 가능한 이메일입니다.");
										emailCheck = "ture";
										return;
										
									} else {
										$('#managerEmailCheck').html("사용 불가능한 이메일입니다.");
										
										return;
									}
									
								}
							});
						}else{
							$('#managerEmailCheck').html("동일한 이메일 입니다. 사용 가능 이메일입니다.");
							emailCheck = "ture";
						}
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
									$('#selectAddress').append('<div><button type="button" class="addressBtn form-control" value="' + data[i].province + ' ' + data[i].city+' ' + data[i].town+' ' + data[i].street+' ' + data[i].building1+'-'+ data[i].building2+'(' + data[i].zipCode + ')">'
											+ data[i].province + ' ' + data[i].city + ' ' + data[i].town + ' ' + data[i].street + ' ' + data[i].building1 + '-' + data[i].building2 + '('+data[i].zipCode + ')' + '</button></div>');
								}
								// building2 데이터가 없으면
								if (data[i].building2 == 0) {
									$('#selectAddress').append('<div><button type="button" class="addressBtn form-control" value="' + data[i].province + ' ' + data[i].city + ' ' + data[i].town + ' ' + data[i].street + ' ' + data[i].building1 + '(' + data[i].zipCode + ')">'
											+ data[i].province + ' ' + data[i].city + ' ' + data[i].town + ' ' + data[i].street + ' ' + data[i].building1 + '('+data[i].zipCode + ')' + '</button></div>');
								}
								
							}
							$('#addressWait').html("");
							$('.addressBtn').click(function(){
								$('#addressView').html('<input id="managerAddressMain" class="form-control" style="margin-bottom:5px;" type="text" name="managerAddressMain" disabled="disabled" > ')
								document.getElementById("managerAddressMain").value = $(this).val();

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
			$('#btn').click(function() {
				
				// 이메일 검사
				if ($('#managerEmail').val() == "") {
					$('#managerEmail').focus();
					return;
				} else if (CheckEmail($('#managerEmail').val()) == false) {
					$('#managerEmail').focus();
					$('#managerEmailCheck').html("이메일 형식이 잘못 되었습니다.");
					return;
				} else if (emailCheck == "false") {
					$('#managerEmail').focus();
					$('#managerEmailCheck').html("이메일 중복 확인해주세요");
					return;
				} else {
					$('#managerEmailCheck').html("");
				}

				// 이름 검사
				if ($('#managerName').val() == "") {
					$('#managerName').focus();
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
				if ($('#managerPhone').val() == "") {
					$('#managerPhone').focus();
					return;
				} else if (telValidator($('#managerPhone').val()) == false) {
					$('#managerPhone').focus();
					$('#managerPhoneCheck').html("전화번호 형식이 잘못 되었습니다.");
					return;
				} else {
					$('#managerPhoneCheck').html("");
				}
				
				// 성별 검사
				if ($('.managerGender:checked').val() == undefined) {
					$('#managerGender').focus();
					$('#managerGenderCheck').html("성별을 체크해주세요");
					return;
				} else {
					$('#managerGenderCheck').html("");
				}
				
				// 생년월일 검사
				if ($('#managerBirth').val() == "") {
					$('#managerBirth').focus();
					$('#managerBirthCheck').html("생년월일을 입력해주세요")
					return;
				} else {
					$('#managerBirthCheck').html("")
				}
				
				// 주소 검사
				if ($('#managerAddressMain').val() == "") {
					$('#addressCheck').html("주소를 검색해주세요")
					return;
				} else {
					$('#addressCheck').html("");
				}
				
				// 상세주소 검사
				if ($('#managerAddressSub').val() == "") {
					$('#managerAddressSub').focus();
					return;
				}
				
				$('#managerForm').submit();
			});
		});
	</script>
</head>
<body>

	<jsp:include page="/WEB-INF/view/auth/manager/include/menu.jsp"/>
	
	<form id="managerForm" method="post" action="${pageContext.request.contextPath}/auth/manager/mypage/updateMypage">
		<button type="button" class="btn btn-success" id="btn">수정</button>
		&nbsp;
		<button type="button" class="btn btn-danger" onclick="location.href='${pageContext.request.contextPath}/auth/manager/mypage/mypageOne'">취소</button>
		<table class="table table-bordered">
			<tr>
				<td>아이디</td>
				<td><input type="text" name="managerId" value="${manager.managerId}"hidden="hidden">${manager.managerId}</td>
				<td>이름</td>
				<td>
				<input type="text" class="form-control" name="managerName" id="managerName" placeholder="이름을 입력하세요" value="${manager.managerName}">
				
				<td>성별</td>
				<td>
					<c:if test="${manager.managerGender == '남'}">
						<input type="radio" class="managerGender" name="managerGender" value="남" checked="checked" >&nbsp;남&nbsp;&nbsp;
						<input type="radio" class="managerGender" name="managerGender" value="여">&nbsp;여
					</c:if>
					<c:if test="${manager.managerGender == '여'}">
						<input type="radio" class="managerGender" name="managerGender" value="남">&nbsp;남&nbsp;&nbsp;
						<input type="radio" class="managerGender" name="managerGender" value="여" checked="checked" >&nbsp;여
					</c:if>
					<span id="managerGenderCheck"></span>
				</td>
				<td>직급</td>
				<td>${manager.managerPosition}</td>
				<td rowspan="2" colspan="2">이미지...</td>
			</tr>
			
			<tr>
				<td>전화번호</td>
				<td >
					<input type="text" class="form-control" name="managerPhone" id="managerPhone" placeholder="000-0000-000" value="${manager.managerPhone}">
					<div id="managerPhoneCheck"></div>
				</td>
				<td>이메일</td>
				<td colspan="3">
					<div class="input-group">
						<input type="email" value="${manager.managerEmail}" id="originalManagerEmail" hidden="hidden">
						<input type="email" class="form-control" name="managerEmail" id="managerEmail" value="${manager.managerEmail}" placeholder="abc@abc.abc">
						<div class="input-group-append">
							<button type="button" class="btn btn-primary" id="emailCheck">중복 체크</button>
						</div>
					</div>
					<div id="managerEmailCheck"></div>
				</td>
				<td>생일</td>
				<td >
					<div>
						<input type="date" class="form-control" name="managerBirth" id="managerBirth" value="${manager.managerBirth}">
					</div>
					<div id="managerBirthCheck"></div>
				</td>
			</tr>
			<tr>
				<td>주소</td>
				<td colspan="8">
					<div id="addressView">
						<input id="managerAddressMain" class="form-control" style="margin-bottom:5px;" type="text" name="managerAddressMain" value="${manager.managerAddressMain}" readonly="readonly" >
					</div>
						<span id="addressWait"></span>
						
						<div class="input-group">
							<input type="text" class="form-control" name="street" id="street" placeholder="도로명을 입력하세요.">
							<div class="input-group-append">
								<button type="button" class="btn btn-primary" id="check">검색</button>
							</div>
						</div>
						
						<span id="addressCheck"></span>
						<div id="selectAddress" style="overflow: auto; width: 100%; max-height: 200px;"></div>
				
				 </td>
			</tr>
			<tr>
				<td>상세주소</td>
				<td colspan="8"><input type="text" class="form-control" id="managerAddressSub" placeholder="상세 주소를 입력하세요" value="${manager.managerAddressSub}" name="managerAddressSub" ></td>
			</tr>
			
			<tr>
				<td>경력</td>
				<td colspan="9">
				<c:forEach var="c" items="${manager.careerList}" >
					<div>
						<span>${c.careerContent}</span>
						<span>( ${c.careerStartdate} ~ ${c.careerEnddate} )</span>
					</div>
				</c:forEach>
				</td>
			</tr>
			<tr>
				<td>자격증</td>
				<td colspan="9">
					<c:forEach var="l" items="${manager.licenseList}" >
						<div>
							<span>${l.licenseNumber}</span>
							<span>${l.licenseName}</span>
							<span>${l.licenseAgency}</span>
							<span>${l.licenseGetdate}</span>
						</div>
					</c:forEach>
				</td>
			</tr>	
		</table>
	</form>
</body>
</html>