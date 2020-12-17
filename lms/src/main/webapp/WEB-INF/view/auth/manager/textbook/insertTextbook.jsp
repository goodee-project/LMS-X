<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>교재 추가</h1>
	<form method="post" action="${pageContext.request.contextPath}/auth/manager/textbook/insertTextbook">
		<table border="1">
			<tr>
				<td>교재 isbn</td>
				<td><input type="text" name="textbookIsbn"></td>
			</tr>
			<tr>
				<td>교재 이름</td>
				<td><input type="text" name="textbookTitle"></td>
			</tr>
			<tr>
				<td>교재 저자</td>
				<td><input type="text" name="textbookWriter"></td>
			</tr>
			<tr>
				<td>교재 출판사</td>
				<td><input type="text" name="textbookPublisher"></td>
			</tr>
			<tr>
				<td>교재 정보</td>
				<td><input type="text" name="textbookInfo"></td>
			</tr>
			<tr>
				<td>교재 가격</td>
				<td><input type="text" name="textbookPrice"></td>
			</tr>
		</table>
		<button type="submit">입력</button>
	</form>
</body>
</html>