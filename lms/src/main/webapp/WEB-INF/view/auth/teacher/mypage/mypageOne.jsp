<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>mypageOne</title>
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
</head>
<body>
	<jsp:include page="/WEB-INF/view/auth/teacher/include/menu.jsp"/>
	<a href="${pageContext.request.contextPath}/auth/teacher/mypage/updateMypage">정보 수정</a>
	<a href="${pageContext.request.contextPath}/auth/teacher/mypage/updateMypageCareerAndLicense">경력 자격증 추가</a>
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
					<c:if test="${c.careerContent != null}">
						<div>
							<span>${c.careerContent}</span>
							<span>( ${c.careerStartdate} ~ ${c.careerEnddate} )</span>
						</div>
					</c:if>
				</c:forEach>
			</td>
		</tr>
		<tr>
			<td>자격증</td>
			<td colspan="8">
				<c:forEach var="l" items="${teacher.licenseList}" >
					<c:if test="${l.licenseNumber != null}">
						<div>
							<span>${l.licenseNumber}</span>
							<span>${l.licenseName}</span>
							<span>${l.licenseAgency}</span>
							<span>${l.licenseGetdate}</span>
						</div>
					</c:if>
				</c:forEach>
			</td>
		</tr>	
	</table>
	</body>
</html>