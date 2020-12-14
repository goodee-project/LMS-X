<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>학생 index</h1>
	<!-- 수강 목록 -->
	<h3>수강 목록</h3>
	<table border="1">	
		<tr>
			<th>강사</th>
			<th>강좌 이름</th>
			<th>강좌 시작일</th>
			<th>강좌 종료일</th>
			<th>강좌 총원</th>
			<th>상태</th>
		</tr>
		<c:forEach items="${lectureList}" var="l">
			<tr>
				<td>${l.lecture.teacherName}</td>
				<td>${l.lecture.lectureName}</td>
				<td>${l.lecture.lectureStartdate}</td>
				<td>${l.lecture.lectureEnddate}</td>
				<td>${l.lecture.lectureTotal}</td>
				<td>${l.classRegistration.classRegistrationState}</td>
			</tr>	
		</c:forEach>
	</table>
</body>
</html>