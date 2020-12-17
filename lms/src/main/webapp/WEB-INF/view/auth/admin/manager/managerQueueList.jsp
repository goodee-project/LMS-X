<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>managerQueueList</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>

	<jsp:include page="/WEB-INF/view/auth/admin/include/menu.jsp"/>
	<a href="${pageContext.request.contextPath}/auth/admin/index">목록</a>
	<h1>운영자 승인대기 목록</h1>

	<table class="table-bordered">
		<thead>
			<tr>
				<th>아이디</th>
				<th>이메일</th>
				<th>이름</th>
				<th>성별</th>
				<th>생일</th>
				<th>주소</th>
				<th>승인</th>
				<th>거절</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="mql" items="${managerQueueList}">
				<tr>
					<td>${mql.managerId}</td>
					<td>${mql.managerEmail}</td>
					<td>${mql.managerName}</td>
					<td>${mql.managerGender}</td>
					<td>${mql.managerBirth}</td>
					<td>${mql.managerAddressMain} ${mql.managerAddressSub}</td>
					<td><a href="${pageContext.request.contextPath}/auth/admin/accessManager/${mql.managerId}">승인</a></td>
					<td><a href="${pageContext.request.contextPath}/auth/admin/negativeManager/${mql.managerId}">거절</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
</body>
</html>