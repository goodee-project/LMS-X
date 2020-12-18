<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>managerOne</title>
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

	<jsp:include page="/WEB-INF/view/auth/admin/include/menu.jsp"/>

	<table class="table table-bordered">
		<tr>
			<td rowspan="3" colspan="2">이미지...</td>
			<td>아이디</td>
			<td>${manager.managerId}</td>
			<td>이름</td>
			<td>${manager.managerName}</td>
			<td>성별</td>
			<td>${manager.managerGender}</td>
			<td>직급</td>
			<td>
				<form method="post" action="${pageContext.request.contextPath}/auth/admin/updatePosition/${manager.managerId}">
					<select name="managerPosition">
						<c:if test = "${manager.managerPosition eq '사원'}">
							<option value="사원" selected="selected">사원</option>
							<option value="대리" >대리</option>
							<option value="팀장">팀장</option>
						</c:if>
						<c:if test = "${manager.managerPosition eq '대리'}">
							<option value="사원">사원</option>
							<option value="대리" selected="selected" >대리</option>
							<option value="팀장">팀장</option>
						</c:if>
						<c:if test = "${manager.managerPosition eq '팀장'}">
							<option value="사원">사원</option>
							<option value="대리">대리</option>
							<option value="팀장" selected="selected">팀장</option>
						</c:if>
					</select>
					<button  type="submit">직급 수정</button>
				</form>
			</td>
		</tr>
		
		<tr>
			<td>전화번호</td>
			<td colspan="3">${manager.managerPhone}</td>
			<td>생일</td>
			<td colspan="3">${manager.managerBirth}</td>
		</tr>
		<tr>
			<td>주소</td>
			<td colspan="7">${manager.managerAddressMain} ${manager.managerAddressSub}</td>
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
</body>
</html>