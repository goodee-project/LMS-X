<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>과목 상세 페이지</h1>
	<table border="1">
		<tr>
			<td>과목 번호</td>
			<td>${subject.subjectNo}</td>
		</tr>
		<tr>
			<td>과목 이름</td>
			<td>${subject.subjectName}</td>
		</tr>
		<tr>
			<td>과목 생성날짜</td>
			<td>${subject.subjectCreatedate}</td>
		</tr>
		<tr>
			<td>과목 수정날짜</td>
			<td>${subject.subjectUpdatedate}</td>
		</tr>
		<tr>
			<td>과목 총 일수</td>
			<td>${subject.subjectTotalday}</td>
		</tr>
		<tr>
			<td>과목 정보</td>
			<td>${subject.subjectInfo}</td>
		</tr>
		<tr>
			<td>과목 수정</td>
			<td><a href="${pageContext.request.contextPath}/auth/manager/subject/updateSubject/${subject.subjectNo}">수정</a></td>
		</tr>
		<tr>
			<td>과목 삭제</td>
			<td><a href="${pageContext.request.contextPath}/auth/manager/subject/deleteSubject/${subject.subjectNo}">삭제</a></td>
		</tr>
	</table>
</body>
</html>