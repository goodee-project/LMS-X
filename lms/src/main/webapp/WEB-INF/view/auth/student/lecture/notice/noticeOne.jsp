<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>lecturNoticeOne</title>
</head>
	<body>
		<h1>강의 공지사항 상세보기</h1>
		<div>
			<jsp:include page="/WEB-INF/view/auth/student/include/menu.jsp" />
	    </div>
		<table border="1">
			<tr>
				<td>강좌 번호</td>
				<td>${lectureNotice.lectureNo}</td>
			</tr>
			<tr>
				<td>공지사항 번호</td>
				<td>${lectureNotice.lectureNoticeNo}</td>
			</tr>
			<tr>
				<td>제목</td>
				<td>${lectureNotice.lectureNoticeTitle}</td>
			</tr>
			<tr>
				<td>내용</td>
				<td>${lectureNotice.lectureNoticeContent}</td>
			</tr>
			<tr>
				<td>작성일</td>
				<td>${lectureNotice.lectureNoticeCreatedate}</td>
			</tr>
			<tr>
				<td>수정일</td>
				<td>${lectureNotice.lectureNoticeUpdatedate}</td>
			</tr>
			<tr>
				<td>조회수</td>
				<td>${lectureNotice.lectureNoticeCount}</td>
			</tr>
		</table>
			<a href="${pageContext.request.contextPath}/auth/student/lecture/${lectureNo}/notice/noticeList/1">뒤로가기</a>
	</body>
</html>