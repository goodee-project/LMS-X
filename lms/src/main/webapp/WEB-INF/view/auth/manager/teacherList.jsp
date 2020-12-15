<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>강사 index</h1>
	<table border="1">	
		<tr>
			<th>강사 ID</th>
			<th>강사 Email</th>
			<th>강사 이름</th>
			<th>강사 전화번호</th>
			<th>강사 성별</th>
			<th>강사 생일</th>
			<th>강사 주소</th>
			<th>강사 상세주소</th>
			<th>강사 이미지</th>
			<th>강사정보 등록날짜</th>
			<th>강사정보 수정날짜</th>
			<th>강사 설명</th>
		</tr>
		<c:forEach items="${teacherList}" var="t">
			<tr>
				<td>${t.teacherId}</td>
				<td>${t.teacherEmail}</td>
				<td>${t.teacherName}</td>
				<td>${t.teacherPhone}</td>
				<td>${t.teacherGender}</td>
				<td>${t.teacherBirth}</td>
				<td>${t.teacherAddressMain}</td>
				<td>${t.teacherAddressSub}</td>
				<td>${t.teacherImage}</td>
				<td>${t.teacherAccessdate}</td>
				<td>${t.teacherUpdatedate}</td>
				<td>${t.teacherInfo}</td>
			</tr>	
		</c:forEach>
	</table>
</body>
</html>