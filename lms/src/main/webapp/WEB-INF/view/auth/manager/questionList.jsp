<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>질문 index</h1>
	<table border="1">	
		<tr>
			<th>질문 번호</th>
			<th>강좌 번호</th>
			<th>계정 번호</th>
			<th>질문 작성자</th>
			<th>질문 제목</th>
			<th>질문 내용</th>
			<th>질문 작성날짜</th>
			<th>질문 수정날짜</th>
			<th>질문 조회수</th>
			<th>질문 비밀번호</th>
		</tr>
		<c:forEach items="${questionList}" var="q">
			<tr>
				<td>${q.questionNo}</td>
				<td>${q.lectureNo}</td>
				<td>${q.accountId}</td>
				<td>${q.questionWriter}</td>
				<td>${q.questionTitle}</td>
				<td>${q.questionContent}</td>
				<td>${q.questionCreatedate}</td>
				<td>${q.questionUpdatedate}</td>
				<td>${q.questionCount}</td>
				<td>${q.questionPassword}</td>
			</tr>	
		</c:forEach>
	</table>
</body>
</html>