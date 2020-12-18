<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UpdateAccount</title>
</head>
<body>
	<h1>계정 활성화 여부 수정</h1>
	<form method="post" action="${pageContext.request.contextPath}/auth/manager/account/updateAccount">
		<table border="1">
			<tr>
				<td>계정 id</td>
				<td><input type="text" name="accountId" value="${account.accountId}" readonly="readonly"></td>
			<tr>
			<tr>
				<td>계정 활성화 여부 선택</td>
				<td>
					<input type="radio" name="accountState" value="대기">대기
					<input type="radio" name="accountState" value="활성화">활성화
					<input type="radio" name="accountState" value="탈퇴">탈퇴
				</td>
			</tr>
		</table>
		<button type="submit">수정</button>
	</form>
</body>
</html>