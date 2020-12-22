<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>updateSubject</title>
</head>
<body>
	<h1>updateSubject</h1>
	<form method="post" action="${pageContext.request.contextPath}/auth/manager/subject/updateSubject">
		<table border="1">
			<tr>
				<td>과목 번호</td>
				<td><input type="text" name="subjectNo" value="${subject.subjectNo}" readonly="readonly"></td>
			</tr>
			<tr>
				<td>과목 이름</td>
				<td><input type="text" name="subjectName" value="${subject.subjectName}" readonly="readonly"></td>
			</tr>
			<tr>
				<td>과목 총 일수</td>
				<td><input type="text" name="subjectTotalday" value="${subject.subjectTotalday}"></td>
			</tr>
			<tr>
				<td>과목 정보</td>
				<td><input type="text" name="subjectInfo" value="${subject.subjectInfo}"></td>
			</tr>
		</table>
		<button type="submit">과목 수정</button>
	</form>
</body>
</html>