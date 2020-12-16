<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insertClassroom</title>
</head>
<body>
	<h1>강의실 추가</h1>
	<form method="post" action="${pageContext.request.contextPath}/auth/manager/classroom/insertClassroom">
		<table border="1">
			<tr>
				<td>호실</td>
				<td>
					<input type="text" name="classroomNumber">
				</td>
			</tr>
			<tr>
				<td>강의실 크기</td>
				<td>
					<input type="text" name="classroomSize">
				</td>
			</tr>
			<tr>
				<td>강의실 인원 제한</td>
				<td>
					<input type="text" name="classroomTotal">
				</td>
			</tr>
		</table>
		<button type="submit">입력</button>
	</form>
</body>
</html>