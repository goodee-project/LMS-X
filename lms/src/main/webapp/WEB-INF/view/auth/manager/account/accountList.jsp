<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>accountList</title>
</head>
<body>
	<h1>계정 리스트</h1>
	<div><a href="${pageContext.request.contextPath }/auth/manager/index">홈으로</a></div>
	<table border="1">	
		<tr>
			<th>계정 ID</th>
			<th>계정 활성화 여부</th>
			<th>계정 권한 등급</th>
		</tr>
		<c:forEach items="${accountList}" var="a">
			<tr>
				<td><a href="${pageContext.request.contextPath}/auth/manager/account/accountOne/${a.accountId}">${a.accountId}</a></td>	
				<td>${a.accountState}</td>
				<td>${a.accountLevel}</td>
			</tr>	
		</c:forEach>
	</table>
</body>
</html>