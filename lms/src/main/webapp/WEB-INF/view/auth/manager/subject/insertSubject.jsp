<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>과목 추가</h1>
	<form method="post" action="${pageContext.request.contextPath}/auth/manager/subject/insertSubject">
		<table border="1">
			<tr>
				<td>과목 이름</td>
				<td><input type="text" name="subjectName"></td>
			</tr>
			<tr>
				<td>과목 총 일수</td>
				<td><input type="text" name="subjectTotalday"></td>
			</tr>
			<tr>
				<td>과목 정보</td>
				<td><input type="text" name="subjectInfo"></td>
			</tr>
		</table>
		<button type="submit">입력</button>
	</form>
</body>
</html>