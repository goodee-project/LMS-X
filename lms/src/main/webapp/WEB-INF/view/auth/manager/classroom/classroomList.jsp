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
	<div><a href="${pageContext.request.contextPath }/auth/manager/index">홈으로</a></div>
	<div><a href="${pageContext.request.contextPath }/auth/manager/classroom/insertClassroom">강의실 추가</a></div>
	<table border="1">
		<tr>
			<th>강의실 번호</th>
			<th>강의실 호실</th>
			<th>강의실 사이즈</th>
			<th>강의실 총 인원</th>
			<th>수정</th>
			<th>삭제</th>
		</tr>
		<c:forEach items="${classroomList}" var="cr">
			<tr>
				<td>${cr.classroomNo}</td>
				<td>${cr.classroomNumber}</td>
				<td>${cr.classroomSize}</td>
				<td>${cr.classroomTotal}</td>
				<td><a href="${pageContext.request.contextPath }/auth/manager/classroom/updateClassroom/${cr.classroomNo}">수정</a></td>
				<td><a href="${pageContext.request.contextPath}/auth/manager/classroom/deleteClassroom?classroomNo=${cr.classroomNo}">삭제</a></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>