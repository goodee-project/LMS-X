<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>교과서 index</h1>
	<table border="1">
		<tr>
			<th>교재 번호</th>
			<th>교재 이름</th>
			<th>교재 저자</th>
			<th>교재 출판사</th>
			<th>교재 출판일</th>
			<th>교재 정보</th>
			<th>교재 가격</th>
		</tr>
		<c:forEach items="${textbookList}" var="t">
			<tr>
				<td>${t.textbookIsbn}</td>
				<td>${t.textbookTitle}</td>
				<td>${t.textbookWriter}</td>
				<td>${t.textbookPublisher}</td>
				<td>${t.textbookPublishdate}</td>
				<td>${t.textbookInfo}</td>
				<td>${t.textbookPrice}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>