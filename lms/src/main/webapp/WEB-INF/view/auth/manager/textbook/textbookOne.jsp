<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>교재 상세 페이지</h1>
	<table border="1">
		<tr>
			<td>교재 번호</td>
			<td>${textbook.textbookIsbn}</td>
		</tr>
		<tr>
			<td>교재 이름</td>
			<td>${textbook.textbookTitle}</td>
		</tr>
		<tr>
			<td>교재 저자</td>
			<td>${textbook.textbookWriter}</td>
		</tr>
		<tr>
			<td>교재 출판사</td>
			<td>${textbook.textbookPublisher}</td>
		</tr>
		<tr>
			<td>교재 출판일</td>
			<td>${textbook.textbookPublishdate}</td>
		</tr>
		<tr>
			<td>교재 정보</td>
			<td>${textbook.textbookInfo}</td>
		</tr>
		<tr>
			<td>교재 가격</td>
			<td>${textbook.textbookPrice}</td>
		</tr>
		<tr>
			<td>교재 수정</td>
			<td><a href="${pageContext.request.contextPath}/auth/manager/textbook/updateTextbook/${textbook.textbookIsbn}">수정</a></td>
		</tr>
		<tr>
			<td>교재 삭제</td>
			<td><a href="${pageContext.request.contextPath}/auth/manager/textbook/deleteTextbook/${textbook.textbookIsbn}">삭제</a></td>
		</tr>
	</table>
</body>
</html>