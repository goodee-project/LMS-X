<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insertLecture</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
	$('#insertBtn').click(function(){
		if($('#teacherNametext').val().length < 1){
			alert('강사명을 입력해주세요.');
			return;
		} 
		if($('#lectureNametext').val().length < 1){
			alert('강의명을 입력해주세요.');
			return;	 
		} 
		
		$('#insertLectureForm').submit();
	});
});
</script>
</head>
<body>
	<h1>강의 개설</h1>
	<form method="post" action="${pageContext.request.contextPath}/auth/manager/insertLecture" id="insertLectureForm">
		<table border="1">
			<tr>
				<td>강사 계정</td>
				<td><select name="accountId">
						<c:forEach var="a" items="${accountList}">
							<option value="${a.accountId}">${a.accountId}</option>
						</c:forEach>
				</select></td>
			</tr>
			<tr>
				<td>과목 번호</td>
				<td><select name="subjectNo">
						<c:forEach var="s" items="${subjectList}">
							<option value="${s.subjectNo}">${s.subjectNo}:${s.subjectName}</option>
						</c:forEach>
				</select></td>
			</tr>
			<tr>
				<td>강사 명</td>
				<td><input type="text" name="teacherName"id="teacherNametext" placeholder="강사 명을 입력해주세요."></td>
			</tr>
			<tr>
				<td>강의 명</td>
				<td><input type="text" name="lectureName"id="lectureNametext" placeholder="강의 명을 입력해주세요."></td>
			</tr>
			<tr>
				<td>교재</td>
				<td><select name="textbookIsbn">
						<c:forEach var="t" items="${textbookList}">
							<option value="${t.textbookIsbn}">${t.textbookTitle}:${t.textbookIsbn}</option>
						</c:forEach>
				</select></td>
			</tr>
			<tr>
				<td>개강일</td>
				<td><input type="datetime-local" name="lectureStartdate"></td>
			</tr>
			<tr>
				<td>종강일</td>
				<td><input type="datetime-local" name="lectureEnddate"></td>
			</tr>
			<tr>
				<td>정원</td>
				<td><input type="number" name="lectureTotal" id="lectureTotaltext"></td>
			</tr>
			<tr>
				<td>강의실</td>
				<td><select name="classroomNo">
						<c:forEach var="c" items="${classroomList}">
							<option value="${c.classroomNo}">${c.classroomNo}:${c.classroomNumber}</option>
						</c:forEach>
				</select></td>
			</tr>
		</table>
		<button type="button" id="insertBtn">개설</button>
	</form>
	<a href="${pageContext.request.contextPath}/auth/manager/lectureList/1">뒤로가기</a>
</body>
</html>