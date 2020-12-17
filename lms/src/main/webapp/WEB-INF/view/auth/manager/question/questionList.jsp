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
	<div><a href="${pageContext.request.contextPath }/auth/manager/index">홈으로</a></div>
	<table border="1">	
		<tr>
			<th>질문 번호</th>
			<th>질문 작성자</th>
			<th>질문 제목</th>
			<th>질문 작성날짜</th>
			<th>질문 수정날짜</th>
			<th>질문 조회수</th>
		</tr>
		<c:forEach items="${questionList}" var="q">
			<tr>
				<td><a href="${pageContext.request.contextPath}/auth/manager/question/questionOne/${q.questionNo}">${q.questionNo}</a></td>
				<td>${q.questionWriter}</td>
				<td>${q.questionTitle}</td>
				<td>${q.questionCreatedate}</td>
				<td>${q.questionUpdatedate}</td>
				<td>${q.questionCount}</td>
			</tr>	
		</c:forEach>
	</table>
</body>
</html>