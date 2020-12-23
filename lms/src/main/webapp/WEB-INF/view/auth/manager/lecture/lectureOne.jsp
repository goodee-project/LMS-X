<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>lectureOne</title>
</head>
<body>
	<h1>강의 상세보기</h1>
	<div>
		<a href="${pageContext.request.contextPath}/auth/manager/lecture/lectureList/1">뒤로가기</a>
		<a href="${pageContext.request.contextPath}/auth/manager/lecture/updateLecture/${lectureNo}">수정</a>
		<a class="nav-link" href="${pageContext.request.contextPath}/auth/manager/lecture/${lectureNo}/archive/archiveList/1">강의 자료 게시판</a>
	</div>
	<table border="1">
		<tr>
			<td>강의 번호</td>
			<td>${lectureNo}</td>
		</tr>
		<tr>
			<td>강사명</td>
			<td>${lct.lecture.teacherName}</td>
		</tr>
		<tr>
			<td>강의명</td>
			<td>${lct.lecture.lectureName}</td>
		</tr>
		<tr>
			<td>교재</td>
			<td>${lct.textbook.textbookTitle}</td>
		</tr>
		<tr>
			<td>강의실</td>
			<td>${lct.classroom.classroomNumber}호</td>
		</tr>
		<tr>
			<td>개강일</td>
			<td>${lct.lecture.lectureStartdate}</td>
		</tr>
		<tr>
			<td>종강일</td>
			<td>${lct.lecture.lectureEnddate}</td>
		</tr>
		<tr>
			<td>정원</td>
			<td>${lct.lecture.lectureTotal}</td>
		</tr>
	</table>
</body>
</html>