<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>teacherOne</title>
</head>
<body>
	<h1>강사 상세 페이지</h1>
	<table border="1">
		<tr>
			<td>강사 ID</td>
			<td>${teacher.teacherId}</td>
		</tr>
		<tr>
			<td>강사 Email</td>
			<td>${teacher.teacherEmail}</td>
		</tr>
		<tr>
			<td>강사 이름</td>
			<td>${teacher.teacherName}</td>
		</tr>
		<tr>
			<td>강사 전화번호</td>
			<td>${teacher.teacherPhone}</td>
		</tr>
		<tr>
			<td>강사 성별</td>
			<td>${teacher.teacherGender}</td>
		</tr>
		<tr>
			<td>강사 생일</td>
			<td>${teacher.teacherBirth}</td>
		</tr>
		<tr>
			<td>강사 주소</td>
			<td>${teacher.teacherAddressMain}</td>
		</tr>
		<tr>
			<td>강사 상세주소</td>
			<td>${teacher.teacherAddressSub}</td>
		</tr>
		<tr>
			<td>강사 이미지</td>
			<td></td>
		</tr>
		<tr>
			<td>강사 설명</td>
			<td>${teacher.teacherInfo}</td>
		</tr>
		<tr>
			<td>강사 경력</td>
			<td>
				<c:forEach var="c" items="${teacher.careerList}">${c.careerContent}</c:forEach>
			</td>
		</tr>
		<tr>
			<td>보유 자격증</td>
			<td>
				<c:forEach var="l" items="${teacher.licenseList}">${l.licenseName}</c:forEach>
			</td>
		</tr>
		<tr>
			<td>강사정보 등록날짜</td>
			<td>${teacher.teacherAccessdate}</td>
		</tr>
		<tr>
			<td>강사정보 수정날짜</td>
			<td>${teacher.teacherUpdatedate}</td>
		</tr>		
	</table>
</body>
</html>