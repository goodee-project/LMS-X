<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>과목 index</h1>
	<table border="1">
		<tr>
			<th>과목 번호</th>
			<th>과목 이름</th>
			<th>과목 생성날짜</th>
			<th>과목 수정날짜</th>
			<th>과목 총 일수</th>
			<th>과목 정보</th>
		</tr>
		<c:forEach items="${subjectList}" var="s">
			<tr>
				<td>${s.subjectNo}</td>
				<td>${s.subjectName}</td>
				<td>${s.subjectCreatedate}</td>
				<td>${s.subjectUpdatedate}</td>
				<td>${s.subjectTotalday}</td>
				<td>${s.subjectInfo}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>