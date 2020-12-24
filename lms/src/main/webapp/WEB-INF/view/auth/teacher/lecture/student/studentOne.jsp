<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>student One</title>
</head>
<body>
	<h1>학생 정보</h1>
	<!-- 내비게이션 메인 메뉴 -->
	<jsp:include page="/WEB-INF/view/auth/teacher/include/menu.jsp" />
	
	<!-- 내비게이션 서브 메뉴 -->
	<jsp:include page="/WEB-INF/view/auth/teacher/include/lectureMenu.jsp" />
		<table border="1">
			<tr>
				<td>강좌 번호</td>
				<td>${LASACR.lecture.lectureNo}</td>
			</tr>
			<tr>
				<td>학생 ID</td>
				<td>${LASACR.classRegistration.accountId}</td>
			</tr>
			<tr>
				<td>이름</td>
				<td>${LASACR.student.studentName}</td>
			</tr>
			<tr>
				<td>이메일</td>
				<td>${LASACR.student.studentEmail}</td>
			</tr>
			<tr>
				<td>성별</td>
				<td>${LASACR.student.studentGender}</td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td>${LASACR.student.studentPhone}</td>
			</tr>
			<tr>
				<td>생년월일</td>
				<td>${LASACR.student.studentBirth}</td>
			</tr>
			<tr>
				<td>주소</td>
				<td>${LASACR.student.studentAddressMain}</td>
			</tr>
			<tr>
				<td>상세주소</td>
				<td>${LASACR.student.studentAddressSub}</td>
			</tr>
		</table>
</body>
</html>