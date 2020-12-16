<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>updateLecture</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
	$('#updateBtn').click(function(){
		if($('#teacherNametext').val().length <= 0){
			alert('강사명을 입력해주세요.');
			return;
		} 
		if($('#lectureNametext').val().length <= 0){
			alert('강의명을 입력해주세요.');
			return;	 
		}
		if( $('#lectureEnddate').val() <= $('#lectureStartdate').val()){
			alert('개강일은 종강일보다 빨라야 합니다.');
			return;
			}
		if($('#lectureTotaltext').val() <= 0){
			alert('0보다 커야합니다.');
			return;
			}
		if($('#lectureTotaltext').val() > 24){
			alert('25보다 작아야합니다.');
			return;
			}
		$('#updateLectureForm').submit();
	});
});
</script>
</head>
<body>
	<h1>강의 수정</h1>
	<a href="${pageContext.request.contextPath}/auth/manager/lectureOne/${lectureNo}">뒤로가기</a>
	<form method="post" action="${pageContext.request.contextPath}/auth/manager/updateLecture/${lectureNo}" id="updateLectureForm">
		<table border="1">
			<tr>
				<td>강의 번호</td>
				<td><input type="text" name="lectureNo" value="${lectureNo}" readonly="readonly"></td>
			</tr>
			<tr>
				<td>강사 계정</td>
				<td>
					<select name="accountId">
							<c:forEach var="a" items="${accountList}">
								<option value="${a.accountId}">${a.accountId}</option>
							</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<td>과목</td>
				<td>
					<select name="subjectNo">
					<c:forEach var="s" items="${subjectList}">
						<option value="${s.subjectNo}">${s.subjectName}</option>
					</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<td>강사 명</td>
				<td><input type="text" name="teacherName"id="teacherNametext" value="${lct.lecture.teacherName}"></td>
			</tr>
			<tr>
				<td>강의 명</td>
				<td><input type="text" name="lectureName"id="lectureNametext" value="${lct.lecture.lectureName}"></td>
			</tr>
			<tr>
				<td>교재</td>
				<td><select name="textbookIsbn">
						<c:forEach var="t" items="${textbookList}">
							<option value="${t.textbookIsbn}"selected="selected">${t.textbookTitle}:${t.textbookIsbn}</option>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<td>개강일</td>
				<td>
					<input type="date" name="lectureStartdate" id="lectureStartdate">
					<script>
   						 $('#lectureStartdate').val("${lct.lecture.lectureStartdate}");
					</script>
				</td>
			</tr>
			<tr>
				<td>종강일</td>
				<td>
					<input type="date" name="lectureEnddate" id="lectureEnddate">
					<script>
   						 $('#lectureEnddate').val("${lct.lecture.lectureEnddate}");
					</script>
				</td>
			</tr>
			<tr>
				<td>정원</td>
				<td><input type="number" name="lectureTotal" id="lectureTotaltext"value="${lct.lecture.lectureTotal}"></td>
			</tr>
			<tr>
				<td>강의실</td>
				<td>
					<select name="classroomNo">
						<c:forEach var="c" items="${classroomList}">
							<c:if test="${c.classroomNo == lct.lecture.classroomNo}">
								<option value="${c.classroomNo}" selected="selected">${c.classroomNumber}</option>
							</c:if>
							<c:if test="${c.classroomNo != lct.lecture.classroomNo}">
								<option value="${c.classroomNo}">${c.classroomNumber}</option>
							</c:if>
						</c:forEach>
					</select>
				</td>
			</tr>
		</table>
		<button type="button" id="updateBtn">수정</button>
	</form>
</body>
</html>