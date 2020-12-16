<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>updateClassroom</title>
</head>
<body>
	<h1>updateClassroom</h1>
	<form method="post" action="${pageContext.request.contextPath}/auth/manager/updateClassroom">
		<table border="1">
			<tr>
				<td>강의실 번호</td>
				<td><input type="text" name="classroomNo" value="${classroom.classroomNo}" readonly="readonly"></td>
			<tr>
			<tr>
				<td>강의실 호실</td>
				<td><input type="text" name="classroomNumber" value="${classroom.classroomNumber"></td>
			</tr>
			<tr>
				<td>강의실 사이즈</td>
				<td><input type="text" name="classroomSize" value="${classroom.classroomSize"></td>
			</tr>
			<tr>
				<td>강의실 총 인원</td>
				<td><input type="text" name="classroomTotal" value="${classroom.classroomTotal"></td>
			</tr>
		</table>
		<button type="submit">강의실 수정</button>
	</form>
</body>
</html>