<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>studentOne</title>
</head>
<body>
	<h1>학생 상세 페이지</h1>
	<table border="1">
		<tr>
			<td>학생 ID</td>
			<td>${student.studentId}</td>
		</tr>
		<tr>
			<td>학생 Email</td>
			<td>${student.studentEmail}</td>
		</tr>
		<tr>
			<td>학생 이름</td>
			<td>${student.studentName}</td>
		</tr>
		<tr>
			<td>학생 전화번호</td>
			<td>${student.studentPhone}</td>
		</tr>
		<tr>
			<td>학생 성별</td>
			<td>${student.studentGender}</td>
		</tr>
		<tr>
			<td>학생 생일</td>
			<td>${student.studentBirth}</td>
		</tr>
		<tr>
			<td>학생 주소</td>
			<td>${student.studentAddressMain}</td>
		</tr>
		<tr>
			<td>학생 상세주소</td>
			<td>${student.studentAddressSub}</td>
		</tr>
		<tr>
			<td>학생 이미지</td>
			<td>${student.studentImage}</td>
		</tr>
		<tr>
			<td>학생정보 등록날짜</td>
			<td>${student.studentAccessdate}</td>
		</tr>
		<tr>
			<td>학생정보 수정날짜</td>
			<td>${student.studentUpdatedate}</td>
		</tr>
	</table>
</body>
</html>