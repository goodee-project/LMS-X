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
	<div><a href="${pageContext.request.contextPath }/auth/manager/index">홈으로</a></div>
	<div><a href="${pageContext.request.contextPath }/auth/manager/subject/insertSubject">과목 추가</a></div>
	<table border="1">
		<tr>
			<th>과목 번호</th>
			<th>과목 이름</th>
			<th>과목 생성날짜</th>
			<th>과목 수정날짜</th>
		</tr>
		<c:forEach items="${subjectList}" var="s">
			<tr>
				<td><a href="${pageContext.request.contextPath}/auth/manager/subject/subjectOne/${s.subjectNo}">${s.subjectNo}</a></td>
				<td>${s.subjectName}</td>
				<td>${s.subjectCreatedate}</td>
				<td>${s.subjectUpdatedate}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>