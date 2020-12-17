<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>index</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
	<h1>관리자 index</h1>
	<jsp:include page="/WEB-INF/view/auth/admin/include/menu.jsp"/>
	<h1>운영자 목록</h1>
	<a href="${pageContext.request.contextPath}/auth/admin/managerQueue">승인 대기</a>
	<table class="table-bordered">
		<thead>
			<tr>
				<th>아이디</th>
				<th>직책</th>
				<th>이름</th>
				<th>성별</th>
				<th>생일</th>
				<th>이메일</th>
				<th>핸드폰번호</th>
				<th>승인날짜</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="m" items="${managerList}">
				<tr>
					<td>${m.managerId}</td>
					<td>${m.managerPosition}</td>
					
					<td>${m.managerName}</td>
					<td>${m.managerGender}</td>
					<td>${m.managerBirth}</td>
					<td>${m.managerEmail}</td>
					<td>${m.managerPhone}</td>
					<td>${m.managerAccessdate}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
</body>
</html>