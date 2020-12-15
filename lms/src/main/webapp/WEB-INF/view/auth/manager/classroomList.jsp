<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>강의실 index</h1>
	<table border="1">
		<tr>
			<th>강의실 번호</th>
			<th>강의실 호실</th>
			<th>강의실 사이즈</th>
			<th>강의실 총 인원</th>
		</tr>
		<c:forEach items="${classroomList}" var="cr">
			<tr>
				<td>${cr.classroomNo}</td>
				<td>${cr.classroomNumber}</td>
				<td>${cr.classroomSize}</td>
				<td>${cr.classroomTotal}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>