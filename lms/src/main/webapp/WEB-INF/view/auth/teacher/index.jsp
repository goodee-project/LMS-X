<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>index.jsp</title>
	</head>
	<body>
		<h1>강사 Index</h1>
		
		<table border="1">
			<thead>
				<tr>
					<th>강좌 번호</th>
					<th>계정 아이디</th>
					<th>과목 번호</th>
					<th>강사 이름</th>
					<th>강좌 이름</th>
					<th>강좌 개강일</th>
					<th>강좌 종강일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="tll" items="${teacherLectureList}">
					<tr>
						<td>${tll.lectureNo}</td>
						<td>${tll.accountId}</td>
						<td>${tll.subjectNo}</td>
						<td>${tll.teacherName}</td>
						<td>${tll.lectureName}</td>
						<td>${tll.lectureStartdate}</td>
						<td>${tll.lectureEnddate}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</body>
</html>