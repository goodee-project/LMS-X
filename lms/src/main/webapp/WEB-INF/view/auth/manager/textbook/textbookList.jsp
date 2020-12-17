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
	<div><a href="${pageContext.request.contextPath }/auth/manager/index">홈으로</a></div>
	<div><a href="${pageContext.request.contextPath }/auth/manager/textbook/insertTextbook">교재 추가</a></div>
	<table border="1">
		<tr>
			<th>교재 번호</th>
			<th>교재 이름</th>
			<th>교재 저자</th>
			<th>교재 출판일</th>
		</tr>
		<c:forEach items="${textbookList}" var="t">
			<tr>
				<td><a href="${pageContext.request.contextPath}/auth/manager/textbook/textbookOne/${t.textbookIsbn}">${t.textbookIsbn}</a></td>
				<td>${t.textbookTitle}</td>
				<td>${t.textbookWriter}</td>
				<td>${t.textbookPublishdate}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>