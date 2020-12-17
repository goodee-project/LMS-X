<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>lectureNoticeList</title>
	<!--강의 공지사항 <학생>-->
</head>
	<body>
		<h1>강의 공지사항</h1>
		<div>
			<table border="1">
				<thead>
					<tr>
						<td>강의 공지사항 번호</td>
						<td>강의 공지사항 제목</td>
						<td>강의 공지사항 작성일</td>
						<td>강의 공지사항 조회수</td>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="ln" items="${lectureNotice}">
						<tr>
							<td>${ln.lectureNoticeNo}</td>
							<td><a href="${pageContext.request.contextPath}/auth/student/lecture/lectureNotice/lectureNoticeOne/${ln.lectureNoticeNo}">${ln.lectureNoticeTitle}</a></td>
							<td>${ln.lectureNoticeCreatedate}</td>
							<td>${ln.lectureNoticeCount}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<!-- 페이징 -->
			<div>
				<!-- 이전 페이지 네비 -->
				<c:if test="${navFirstPage > navPerPage }">
					<a href="${pageContext.request.contextPath }/auth/student/lecture/${lectureNo}/lectureNotice/lectureNoticeList/${navFirstPage - 1}">이전</a>
				</c:if>
				<!-- 현재 페이지 네비 -->
				<c:forEach var="navPage" begin="${navFirstPage }" end="${navLastPage }">
					<c:if test="${navPage <= endPage }">
						<a href="${pageContext.request.contextPath}/auth/student/lecture/${lectureNo}/lectureNotice/lectureNoticeList/${navPage}">${navPage}</a>
					</c:if>
				</c:forEach>
				<!-- 다음 페이지 네비 -->
				<c:if test="${navLastPage < endPage }">
					<a href="${pageContext.request.contextPath }/auth/student/lecture/${lectureNo}/lectureNotice/lectureNoticeList/${navLastPage + 1}">다음</a>
				</c:if>
			</div>
		</div>
	</body>
</html>