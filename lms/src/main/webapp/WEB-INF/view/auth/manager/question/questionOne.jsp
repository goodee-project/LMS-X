<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>질문 상세 페이지</h1>
	<table border="1">	
		<tr>
			<td>질문 번호</td>
			<td>${question.questionNo}</td>
		<tr>
		<tr>
			<td>강의 번호</td>
			<td>${question.lectureNo}</td>
		</tr>
		<tr>
			<td>계정 번호</td>
			<td>${question.accountId}</td>
		</tr>
		<tr>
			<td>질문 작성자</td>
			<td>${question.questionWriter}</td>
		</tr>
		<tr>
			<td>질문 제목</td>
			<td>${question.questionTitle}</td>
		</tr>
		<tr>
			<td>질문 내용</td>
			<td>${question.questionContent}</td>
		</tr>
		<tr>
			<td>질문 작성날짜</td>
			<td>${question.questionCreatedate}</td>
		</tr>
		<tr>
			<td>질문 수정날짜</td>
			<td>${question.questionUpdatedate}</td>
		</tr>
		<tr>
			<td>질문 조회수</td>
			<td>${question.questionCount}</td>
		</tr>
		<tr>
			<td>질문게시글 삭제</td>
			<td><a href="${pageContext.request.contextPath}/auth/manager/question/deleteQuestion/${question.questionNo}">삭제</a></td>
		</tr>
	</table>
</body>
</html>