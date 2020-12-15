<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Lecture Notice List</title>
</head>
<body>
	<h1>강의 공지사항</h1>
	<div>
		<table border="1">
			<thead>
				<tr>
					<td>강의 공지사항 번호</td>
					<td>강의 공지사항 제목</td>
					<td>강의 공지사항 작성일</td>
					<td>강의 공지사항 조회수</td>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="sln" items="${lectureNotice}">
					<td>${sln.lectureNoticeNo}</td>
					<td><a href="${pageContext.request.contextPath}/student/lecutreNoticeOne/${sln.lectureNoticeNo}">${sln.lectureNoticeTitle}</a></td>
					<td>${sln.lectureNoticeCreatedate}</td>
					<td>${sln.lectureNoticeCount}</td>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>