<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>accountOne</title>
</head>
<body>
	<h1>Account 상세보기</h1>
	<table border="1">
		<tr>
			<td>계정 ID</td>
			<td>${account.accountId}</td>
		</tr>
		<tr>
			<td>계정 활성화 여부</td>
			<td>${account.accountState}</td>
		</tr>
		<tr>
			<td>계정 권한 등급</td>
			<td>${account.accountLevel}</td>
		</tr>
		<tr>
			<td>계정 생성일</td>
			<td>${account.accountCreatedate}</td>
		</tr>
		<tr>
			<td>계정 수정일</td>
			<td>${account.accountUpdatedate}</td>
		</tr>
		<tr>
			<td>활성화 여부 수정</td>
			<td><a href="${pageContext.request.contextPath}/auth/manager/account/updateAccount/${account.accountId}">수정</a></td>
		</tr>
	</table>
</body>
</html>