<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>updateMypageCareerAndLicense</title>
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
			let insertCareerBtn = 0;
			$('#insertCareerBtn').click(function(){
				let insertCareerHtml = `
					
					<form id="careerForm" method="post" action="${pageContext.request.contextPath}/auth/teacher/mypage/insertMypageCareer">
						<table class="table table-bordered" >
							<tr>
								<td>경력 정보</td>
								<td>
									<input type="text" name="accountId" hidden="hidden" value="${sessionScope.loginId}">
									<input id="careerContent" type="text" name="careerContent">
								</td>
							</tr>
							<tr>
								<td>경력 일자</td>
								<td>
								<input id="careerStartdate" type="date" name="careerStartdate"> ~ <input id="careerEnddate" type="date" name="careerEnddate">
								<div id="careerDateCheck"></div>
								</td>
							</tr>
						</table>
						<button id="careerBtn" type="button" >등록</button>
						<button id="insertCareerBtnDelete" type="button" >취소</button>
					</form>
				`;
				
				$('#insertCareer').html(insertCareerHtml);
				
				$('#insertCareerBtnDelete').click(function(){
					$('#insertCareer').html('');
				});
				
				$('#careerBtn').click(function(){
			
					if ($('#careerContent').val() == "" ) {
						$('#careerContent').focus();
						return;
					}
					if ($('#careerStartdate').val() == "") {
						$('#careerDateCheck').html('경력 일자를 입력해주세요.');
						return;
					} else if ($('#careerEnddate').val()== "") {
						$('#careerDateCheck').html('경력 일자를 입력해주세요.');
						return;
					} else if ($('#careerStartdate').val().replace(/-/gi,"") > $('#careerEnddate').val().replace(/-/gi,"")) {
						$('#careerDateCheck').html('경력 일자를 확인해주세요.');
						return;
					} else{
						$('#careerDateCheck').html('');
					}
					$('#careerForm').submit();
				});
			});

			$('#insertLicenseBtn').click(function(){
				let insertCareerHtml = `
					<form id="licenseForm" method="post" action="${pageContext.request.contextPath}/auth/teacher/mypage/insertMypageLicense">
						<table class="table table-bordered" >
							<tr>
								<td>자격증 번호</td>
								<td>
									<input type="text" name="accountId" hidden="hidden" value="${sessionScope.loginId}">
									<input id="licenseNumber" type="text" name="licenseNumber">
								</td>
							</tr>
							<tr>
								<td>자격증 이름</td>
								<td>
									<input id="licenseName" type="text" name="licenseName">
								</td>
							</tr>
							<tr>
								<td>자격증 발급기관</td>
								<td>
									<input id="licenseAgency" type="text" name="licenseAgency">
								</td>
							</tr>
							<tr>
								<td>자격증 발급 일자</td>
								<td>
									<input id="licenseGetdate" type="date" name="licenseGetdate">
									<div id="licenseDateCheck"></div>
								</td>
							</tr>
						</table>
						<button id="licenseBtn" type="button" >등록</button>
						<button id="insertLicenseBtnDelete" type="button" >취소</button>
					</form>
				`;
				
				$('#insertLicense').html(insertCareerHtml);

				$('#insertLicenseBtnDelete').click(function(){
					$('#insertLicense').html('');
				});
				
				$('#licenseBtn').click(function(){
					if ($('#licenseNumber').val() == "") {
						$('#licenseNumber').focus();
						return;
					}
					if ($('#licenseName').val() == "") {
						$('#licenseName').focus();
						return;
					}
					if ($('#licenseAgency').val() == "") {
						$('#licenseAgency').focus();
						return;
					}
					if ($('#licenseGetdate').val() == "") {
						$('#licenseDateCheck').html('자격증 발급 일자를 입력해주세요.');
						return;
					} else {
						$('#licenseDateCheck').html('');
					}
					
					$('#licenseForm').submit();
				});
			});
		
		});
	</script>
</head>
<body>

	<jsp:include page="/WEB-INF/view/auth/teacher/include/menu.jsp"/>
	<a href="${pageContext.request.contextPath}/auth/teacher/mypage/updateMypage">정보 수정</a>
	<table class="table table-bordered">
		<tr>
			<td>아이디</td>
			<td>${teacher.teacherId}</td>
			<td>이름</td>
			<td colspan="2">${teacher.teacherName}</td>
			<td>성별</td>
			<td>${teacher.teacherGender}</td>
			<td rowspan="2" colspan="2">이미지...</td>
		</tr>
		
		<tr>
			<td>전화번호</td>
			<td >${teacher.teacherPhone}</td>
			<td>이메일</td>
			<td colspan="2">${teacher.teacherEmail}</td>
			<td>생일</td>
			<td >${teacher.teacherBirth}</td>
		</tr>
		<tr>
			<td>자기소개</td>
			<td colspan="8">${teacher.teacherInfo}</td>
		</tr>
		<tr>
			<td>주소</td>
			<td colspan="8">${teacher.teacherAddressMain} ${teacher.teacherAddressSub}</td>
		</tr>
		
		<tr>
			<td>경력</td>
			<td colspan="8">
				<c:forEach var="c" items="${teacher.careerList}" >
					<c:if test="${c.careerContent !=null}">
						<div>
							<span>${c.careerContent}</span>
							<span>( ${c.careerStartdate} ~ ${c.careerEnddate} )</span>
							<span><a href="${pageContext.request.contextPath}/auth/teacher/mypage/deleteMypageCareer/${c.careerNo}">x</a></span>
						</div>
					</c:if>
				</c:forEach>
				<hr>
				<div>
					<button id="insertCareerBtn" type="button">추가</button>
				</div>
				<div id="insertCareer"></div>
			</td>
		</tr>
		<tr>
			<td>자격증</td>
			<td colspan="8">
				<c:forEach var="l" items="${teacher.licenseList}" >
					<c:if test="${l.licenseNumber !=null}">
						<div>
							<span>${l.licenseNumber}</span>
							<span>${l.licenseName}</span>
							<span>${l.licenseAgency}</span>
							<span>( ${l.licenseGetdate} )</span>
							<span><a href="${pageContext.request.contextPath}/auth/teacher/mypage/deleteMypageLicense/${l.licenseNo}">x</a></span>
						</div>
					</c:if>
				</c:forEach>
				<hr>
				<div>
					<button id="insertLicenseBtn" type="button">추가</button>
				</div>
				<div id="insertLicense"></div>
			</td>
		</tr>	
	</table>
</body>
</html>