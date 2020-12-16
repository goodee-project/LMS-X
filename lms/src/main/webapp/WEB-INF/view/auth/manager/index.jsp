<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>운영자 index</h1>
	<table border="1">
		<tr>
			<td><a href="${pageContext.request.contextPath}/auth/manager/lecture/lectureList/1">강의 관리 페이지</a></td>
			<td><a href="${pageContext.request.contextPath}/auth/manager/classroom/classroomList">강의실 관리 페이지</a></td>
			<td><a href="${pageContext.request.contextPath}/auth/manager/textbook/textbookList">교재 관리 페이지</a></td>
			<td><a href="${pageContext.request.contextPath}/auth/manager/subject/subjectList">과목 관리 페이지</a></td>
			<td><a href="${pageContext.request.contextPath}/auth/manager/student/studentList">학생정보 페이지</a></td>
			<td><a href="${pageContext.request.contextPath}/auth/manager/teacher/teacherList">강사정보 페이지</a></td>
			<td><a href="${pageContext.request.contextPath}/auth/manager/chart/chartList">통계 페이지</a></td> 		<!-- 학생 출석 통계 등등 -->
			<td><a href="${pageContext.request.contextPath}/auth/manager/question/questionList">질문 목록 페이지</a></td>
			<td><a href="${pageContext.request.contextPath}/auth/manager/faq/faqList">FAQ 관리 페이지</a></td>
		</tr>
	</table>
	<div>
		<a href="${pageContext.request.contextPath}/auth/logout">로그아웃</a>
    </div>
</body>
</html>