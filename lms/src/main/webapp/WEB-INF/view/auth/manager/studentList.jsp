<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>학생 index</h1>
	<table border="1">	
		<tr>
			<th>학생 ID</th>
			<th>학생 Email</th>
			<th>학생 이름</th>
			<th>학생 전화번호</th>
			<th>학생 성별</th>
			<th>학생 생일</th>
			<th>학생 주소</th>
			<th>학생 상세주소</th>
			<th>학생 이미지</th>
			<th>학생정보 등록날짜</th>
			<th>학생정보 수정날짜</th>
		</tr>
		<c:forEach items="${studentList}" var="s">
			<tr>
				<td>${s.studentId}</td>
				<td>${s.studentEmail}</td>
				<td>${s.studentName}</td>
				<td>${s.studentPhone}</td>
				<td>${s.studentGender}</td>
				<td>${s.studentBirth}</td>
				<td>${s.studentAddressMain}</td>
				<td>${s.studentAddressSub}</td>
				<td>${s.studentImage}</td>
				<td>${s.studentAccessdate}</td>
				<td>${s.studentUpdatedate}</td>
			</tr>	
		</c:forEach>
	</table>
</body>
</html>