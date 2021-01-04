<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>updateMypage</title>
	<!-- Favicon -->
	<link href="${pageContext.request.contextPath}/assets/img/brand/favicon.png" rel="icon" type="image/png">
	<!-- Fonts -->
	<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700"	rel="stylesheet">
	<!-- Icons -->
	<link href="${pageContext.request.contextPath}/assets/js/plugins/nucleo/css/nucleo.css"	rel="stylesheet" />
	<link href="${pageContext.request.contextPath}/assets/js/plugins/@fortawesome/fontawesome-free/css/all.min.css"	rel="stylesheet" />
	<!-- CSS Files -->
	<link href="${pageContext.request.contextPath}/assets/css/argon-dashboard.css?v=1.1.2" rel="stylesheet" />
	<!-- jQuery / Ajax Google CDN -->
	<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script>
		$(document).ready(function(){
			// 이메일 중복검사
			let emailCheck ="false" ; // 이메일 체크
			$('#emailCheck').click(function(){
				
				if ( $('#managerEmail').val().replace(/(\s*)/g, "") != "" ) {
					$('#managerEmailCheck').html("");
					if (CheckEmail( $('#managerEmail').val()) == false) {
						$('#managerEmail').focus();
						$('#managerEmailCheck').html('<span class="text-danger">이메일 형식이 잘못 되었습니다.</span>');
						return;
					} else {
						if ($('#managerEmail').val() != $('#originalManagerEmail').val()) {
							$.ajax({
								url : '${pageContext.request.contextPath}/signup/emailCheck/'+$('#managerEmail').val(),
								type : 'get',
								success : function(data) {
									$('#managerEmailCheck').html("");
									if ( data == "true" ) {
										$('#managerEmailCheck').html('<span class="text-success">사용 가능한 이메일입니다.</span>');
										emailCheck = "ture";
										return;
										
									} else {
										$('#managerEmailCheck').html('<span class="text-danger">사용 불가능한 이메일입니다.</span>');
										
										return;
									}
									
								}
							});
						} else {
							$('#managerEmailCheck').html('<span class="text-success">동일한 이메일 입니다. 사용 가능 이메일입니다.</span>');
							emailCheck = "ture";
						}
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
			
			// 파일 선택해서 들어온 값을 inputImage 변수에 넣어주기 
			let imageCheck = null;
			var inputImage = document.querySelector("#managerImage");
			
			// 이미지 확인해서 imageCheck에 값 넣어주기 
			inputImage.addEventListener("change", function(evt){
			  var image = evt.target.files[0];
			
			  imageCheck = ifImage(image);
			})
			// 이미지 파일 확인 이미지가 맞으면 true 아니면 false
			function ifImage(file){
			  var validity = (["image/png", "image/jpg", "image/jpeg"].indexOf(file.type) > -1);
			
			  return validity;
			}
			
			$('#check').click(function() {
				$('#addressCheck').html("");
				if ( $('#street').val().replace(/(\s*)/g, "").length > 1 ) {
					$('#addressWait').html('(잠시만 기다려 주세요...)');
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
							$('#selectAddress').html('');

							// 데이터가 없으면
							if (data.length == 0) {
								$('#selectAddress').html('<span class="text-danger">등록된 주소가 없습니다.</span>');
							}
							
							for (i = 0; i < data.length; i++) {
								// building2 데이터가 있으면
								if (data[i].building2 != 0) {
									$('#selectAddress').append('<div><button type="button" class="addressBtn form-control form-control-alternative" value="' + '(' + data[i].zipCode + ')' + data[i].province + ' ' + data[i].city+' ' + data[i].town+' ' + data[i].street+' ' + data[i].building1+'-'+ data[i].building2+'">'
											+  '('+data[i].zipCode + ')' +  data[i].province + ' ' + data[i].city + ' ' + data[i].town + ' ' + data[i].street + ' ' + data[i].building1 + '-' + data[i].building2 +'</button></div>');
								}
								// building2 데이터가 없으면
								if (data[i].building2 == 0) {
									$('#selectAddress').append('<div><button type="button" class="addressBtn form-control form-control-alternative" value="' + '(' + data[i].zipCode + ')' + data[i].province + ' ' + data[i].city + ' ' + data[i].town + ' ' + data[i].street + ' ' + data[i].building1 +'">'
											+ '('+data[i].zipCode + ')' + data[i].province + ' ' + data[i].city + ' ' + data[i].town + ' ' + data[i].street + ' ' + data[i].building1 + '</button></div>');
								}
								
							}
							$('#addressWait').html('');
							$('.addressBtn').click(function(){
								$('#addressView').html('<input id="managerAddressMain" class="form-control form-control-alternative" style="margin-bottom:5px; background-color: white;" type="text" name="managerAddressMain" readonly="readonly" > ')
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

			// 전화번호 - 자동 추가
			var autoHypenPhone = function(str){
			      str = str.replace(/[^0-9]/g, '');
			      var tmp = '';
			      if( str.length < 4){
			          return str;
			      }else if(str.length < 7){
			          tmp += str.substr(0, 3);
			          tmp += '-';
			          tmp += str.substr(3);
			          return tmp;
			      }else if(str.length < 11){
			          tmp += str.substr(0, 3);
			          tmp += '-';
			          tmp += str.substr(3, 3);
			          tmp += '-';
			          tmp += str.substr(6);
			          return tmp;
			      }else{              
			          tmp += str.substr(0, 3);
			          tmp += '-';
			          tmp += str.substr(3, 4);
			          tmp += '-';
			          tmp += str.substr(7);
			          return tmp;
			      }
			  
			      return str;
			}
			var phoneNum = document.getElementById('managerPhone');

			phoneNum.onkeyup = function(){
				this.value = autoHypenPhone( this.value ) ;  
			} 
			
			$('#btn').click(function() {
				
				// 이메일 검사
				if ($('#managerEmail').val().replace(/(\s*)/g, "") == "") {
					$('#managerEmail').focus();
					return;
				} else if (CheckEmail($('#managerEmail').val()) == false) {
					$('#managerEmail').focus();
					$('#managerEmailCheck').html('<span class="text-danger">이메일 형식이 잘못 되었습니다.</span>');
					return;
				} else if (emailCheck == "false") {
					$('#managerEmail').focus();
					$('#managerEmailCheck').html('<span class="text-danger">이메일 중복 확인해주세요.</span>');
					return;
				} else {
					$('#managerEmailCheck').html('');
				}

				// 이름 검사
				if ($('#managerName').val().replace(/(\s*)/g, "") == "") {
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
				if ($('#managerPhone').val().replace(/(\s*)/g, "") == "") {
					$('#managerPhone').focus();
					return;
				} else if (telValidator($('#managerPhone').val()) == false) {
					$('#managerPhone').focus();
					$('#managerPhoneCheck').html('<span class="text-danger">전화번호 형식이 잘못 되었습니다.</span>');
					return;
				} else {
					$('#managerPhoneCheck').html('');
				}
				
				// 성별 검사
				if ($('.managerGender:checked').val() == undefined) {
					$('#managerGender').focus();
					$('#managerGenderCheck').html('<span class="text-danger">성별을 체크해주세요</span>');
					return;
				} else {
					$('#managerGenderCheck').html('');
				}
				
				// 생년월일 검사
				if ($('#managerBirth').val().replace(/(\s*)/g, "") == "") {
					$('#managerBirth').focus();
					$('#managerBirthCheck').html('<span class="text-danger">생년월일을 입력해주세요</span>')
					return;
				} else {
					$('#managerBirthCheck').html("")
				}
				
				// 사진 검사
				if ( $('#managerImage').val().replace(/(\s*)/g, "") != "") {
					if (imageCheck == false) {
						$('#managerImageCheck').html('<span class="text-danger">이미지 파일만 올릴 수 있습니다.</span>');
						return;
					} else {
						$('#managerImageCheck').html('');
					}
				} else {
					$('#managerImageCheck').html('');
				}
				
				// 주소 검사
				if ($('#managerAddressMain').val().replace(/(\s*)/g, "") == "") {
					$('#addressCheck').html('<span class="text-danger">주소를 검색해주세요</span>')
					return;
				} else {
					$('#addressCheck').html("");
				}
				
				// 상세주소 검사
				if ($('#managerAddressSub').val().replace(/(\s*)/g, "") == "") {
					$('#managerAddressSub').focus();
					return;
				}
				
				$('#managerForm').submit();
			});
			
		});
		
	</script>
</head>
<body>
	<!-- 내비게이션 메인 메뉴 -->
	<jsp:include page="/WEB-INF/view/auth/manager/include/menu.jsp"/>
	<div class="main-content">
		<div class="container-fluid">
			<jsp:include page="/WEB-INF/view/auth/manager/include/topMenu.jsp" />
		</div>
		<!-- Header -->
		<div class="header bg-gradient-primary pb-8 pt-5 pt-md-8"></div>
		<!-- Page content -->
		<div class="container-fluid mt--7">
			<div class="row">
				<div class="col-xl-4 order-xl-2 mb-5 mb-xl-0">
					<div class="card card-profile shadow">
						<div class="row justify-content-center">
							<div class="col-lg-3 order-lg-2">
								<div class="card-profile-image">
									<img id="img" style="width: 200px; height: 200px;" src="${pageContext.request.contextPath}/resource/mypageImage/${sessionScope.loginImage}">
								</div>
							</div>
						</div>
						<div class="card-body pt-0 pt-md-4" style="margin-top: 50px;">
							<div class="row">
								<div class="col">
									<div class="card-profile-stats justify-content-center mt-md-5 ">
									</div>
								</div>
							</div>
							<div class="text-center">
								<h3>
									${manager.managerName}<span class="font-weight-light">,	${manager.managerGender}</span>
								</h3>
								<div class="h5 font-weight-300">
									<i class="ni location_pin mr-2"></i>${manager.managerEmail}
								</div>
								<div class="h5 font-weight-300">
									<i class="ni location_pin mr-2"></i>${manager.managerPhone}
								</div>
								<div class="h5 mt-4">
									<i class="ni business_briefcase-24 mr-2"></i>${manager.managerAddressMain}
								</div>
								<div>
									<i class="ni education_hat mr-2"></i>${manager.managerAddressSub}
								</div>
								<hr class="my-4" />
							</div>
						</div>
					</div>
				</div>
				<div class="col-xl-8 order-xl-1">
					<div class="card bg-secondary shadow">
						<div class="card-header bg-white border-0">
							<div class="row align-items-center">
								<div class="col-8">
									<h3 class="mb-0">마이페이지</h3>
								</div>
							</div>
						</div>
						<div class="card-body">
							<div class="row align-items-center mb-4">
								<br>
								<div class="col-8">
									<h6 class="heading-small text-muted">개인정보</h6>
								</div>
								<div class="col-4 text-right">
									<button type="button" style="float: right" class="btn btn-sm btn-primary" id="btn">수정</button>
								</div>
							</div>
							<form id="managerForm" method="post" enctype="multipart/form-data"  action="${pageContext.request.contextPath}/auth/manager/mypage/updateMypage">
								<div class="pl-lg-4">
									<div class="row">
										<div class="col-lg-6">
											<div class="form-group">
												<label class="form-control-label">아이디</label>
												<input type="text" name="managerId" class="form-control form-control-alternative" style="background-color: white;" value="${manager.managerId}" readonly="readonly">
											</div>
										</div>
										<div class="col-lg-6">
											<div class="form-group">
												<label class="form-control-label">생년월일</label>
												<input type="date" class="form-control form-control-alternative" name="managerBirth" id="managerBirth" value="${manager.managerBirth}">
											</div>
											<div id="managerBirthCheck"></div>
										</div>
									</div>
									<div class="row">
										<div class="col-lg-6">
											<div class="form-group">
												<label class="form-control-label">이름</label>
												<input type="text" class="form-control form-control-alternative" name="managerName" id="managerName" placeholder="이름을 입력하세요" value="${manager.managerName}">
											</div>
										</div>
										<div class="col-lg-6">
											<div class="form-group">
												<label class="form-control-label">성별</label>
												<c:if test="${manager.managerGender == '남'}">
													<div class="row" style=" margin-top: 10px; margin-left: 50px;">
														<div class="col-lg-3">
															<input type="radio" class="managerGender  form-control-alternative" name="managerGender" value="남" checked="checked" ><label class="form-control-label">&nbsp;남</label>
														</div>
														<div class="col-lg-3">
															<input type="radio" class="managerGender  form-control-alternative" name="managerGender" value="여"><label class="form-control-label">&nbsp;여</label>
														</div>
													</div>
												</c:if>
												<c:if test="${manager.managerGender == '여'}">
													<div class="row" style=" margin: auto; ">
														<div class="col-lg-3">
															<input type="radio" class="managerGender  form-control-alternative" name="managerGender" value="남"><label class="form-control-label">&nbsp;남</label>
														</div>
														<div class="col-lg-3">
															<input type="radio" class="managerGender  form-control-alternative" name="managerGender" value="여" checked="checked"><label class="form-control-label">&nbsp;여</label>
														</div>
													</div>
												</c:if>
												<span id="managerGenderCheck"></span>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-lg-6">
											<div class="form-group">
												<label class="form-control-label" >전화번호</label>
												<input type="text" class="form-control form-control-alternative" name="managerPhone" id="managerPhone" placeholder="000-0000-000" value="${manager.managerPhone}">
												<div id="managerPhoneCheck"></div>
											</div>
										</div>
											<div class="col-lg-6">
											<div class="form-group">
												<label class="form-control-label" >직급</label>
												<input type="text" class="form-control form-control-alternative" style="background-color: white;"  value="${manager.managerPosition}" readonly="readonly">
												<div id="managerPhoneCheck"></div>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-lg-12">
											<div class="form-group">
												<label class="form-control-label">이메일</label>
													<input type="email" class="form-control form-control-alternative" value="${manager.managerEmail}" id="originalManagerEmail" hidden="hidden">
												<div class="input-group">
													<input type="email" class="form-control form-control-alternative" name="managerEmail" id="managerEmail" value="${manager.managerEmail}" placeholder="  abc@abc.abc">
													<div class="input-group-append">
														<button type="button" class="btn btn-primary" id="emailCheck">중복 체크</button>
													</div>
												</div>
												<div id="managerEmailCheck"></div>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-lg-12">
											<div class="form-group">
												<label class="form-control-label">사진</label>
												<div class="input-group">
													<input type="file" class="form-control form-control-alternative" id="managerImage" name="managerImage" accept="image/png, image/jpeg" >
													<div id="managerImageCheck"></div>
												</div>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-lg-6">
											<div class="form-group">
												<label class="form-control-label">주소</label>
												<div id="addressView">
													<input id="managerAddressMain" class="form-control form-control-alternative" style="margin-bottom:5px; background-color: white;" type="text" name="managerAddressMain"  value="${manager.managerAddressMain}" readonly="readonly" >
												</div>
											</div>
										</div>
											<div class="col-lg-6">
											<div class="form-group">
												<label class="form-control-label">상세 주소</label>
												<input type="text" class="form-control form-control-alternative" id="managerAddressSub" placeholder="상세 주소를 입력하세요" value="${manager.managerAddressSub}" name="managerAddressSub" >
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-lg-12">
											<div class="form-group">
												<label class="form-control-label">주소 검색</label>
												<div class="input-group">
													<input type="text" class="form-control form-control-alternative" name="street" id="street" placeholder="도로명을 입력하세요.">
													<div class="input-group-append">
														<button type="button" class="btn btn-primary" id="check">검색</button>
													</div>
												</div>
												<span id="addressCheck"></span>
												<span id="addressWait"></span>
												<div id="selectAddress" style="overflow: auto; width: 100%; max-height: 200px;"></div>
											</div>
										</div>
									</div>
								</div>
							</form>
							<hr class="my-4" />
							<div class="row align-items-center mb-4">
								<br>
								<div class="col-8">
									<h6 class="heading-small text-muted">부가정보</h6>
								</div>
								<div class="col-4 text-right">
									<button type="button" class="btn btn-sm btn-primary" onclick="location.href='${pageContext.request.contextPath}/auth/manager/mypage/updateMypageCareerAndLicense'">부가정보 수정</button>
								</div>
							</div>
							<div class="pl-lg-4">
								<div class="form-group">
									<label class="form-control-label">경력</label>
									<c:if test="${manager.careerList[0].careerContent != null}">
										<c:forEach var="c" items="${manager.careerList}">
											<div class="row">
												<div class="col-lg-8">
													<div class="form-group ">
														<input type="text" class="form-control form-control-alternative" style="background-color: white;" value="${c.careerContent}" disabled="disabled">
													</div>
												</div>
												<div class="col-lg-4">
													<div class="form-group ">
														<input type="text" class="form-control form-control-alternative" style="background-color: white;" value="( ${c.careerStartdate} ~ ${c.careerEnddate} )"	disabled="disabled">
													</div>
												</div>
											</div>
										</c:forEach>
									</c:if>
									<c:if test="${manager.careerList[0].careerContent == null}">
										<div class="row">
											<div class="col-lg-3">
												<h5>(경력이 없습니다)</h5>
											</div>
										</div>
									</c:if>
								</div>
							</div>
							<div class="pl-lg-4">
								<div class="form-group">
									<label class="form-control-label">자격증</label>
									<c:if test="${manager.licenseList[0].licenseNumber != null}">
										<c:forEach var="l" items="${manager.licenseList}">
											<div class="row">
												<div class="col-lg-3">
													<div class="form-group ">
														<input type="text" class="form-control form-control-alternative" style="background-color: white;" value="${l.licenseNumber}" disabled="disabled">
													</div>
												</div>
												<div class="col-lg-3">
													<div class="form-group ">
														<input type="text" class="form-control form-control-alternative" style="background-color: white;" value="${l.licenseName}" disabled="disabled">
													</div>
												</div>
												<div class="col-lg-3">
													<div class="form-group ">
														<input type="text" class="form-control form-control-alternative" style="background-color: white;" value="${l.licenseAgency}" disabled="disabled">
													</div>
												</div>
												<div class="col-lg-3">
													<div class="form-group ">
														<input type="text" class="form-control form-control-alternative" style="background-color: white;" value="${l.licenseGetdate}" disabled="disabled">
													</div>
												</div>
											</div>
										</c:forEach>
									</c:if>
									<c:if test="${manager.licenseList[0].licenseNumber == null}">
										<div class="row">
											<div class="col-lg-3">
												<h5>(자격증이 없습니다)</h5>
											</div>
										</div>
									</c:if>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- Footer -->
			<jsp:include page="/WEB-INF/view/auth/include/footer.jsp"></jsp:include>
		</div>
	</div>
	<!--   Core   -->
	<script	src="${pageContext.request.contextPath}/assets/js/plugins/jquery/dist/jquery.min.js"></script>
	<script	src="${pageContext.request.contextPath}/assets/js/plugins/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
	<!--   Optional JS   -->
	<!--   Argon JS   -->
	<script	src="${pageContext.request.contextPath}/assets/js/argon-dashboard.min.js?v=1.1.2"></script>
	<script src="https://cdn.trackjs.com/agent/v3/latest/t.js"></script>
	<script>
		window.TrackJS && TrackJS.install({
			token : "ee6fab19c5a04ac1a32a645abde4613a",
			application : "argon-dashboard-free"
		});
	</script>
</body>
</html>