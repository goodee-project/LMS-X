<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>강의 관리 목록</h1>
	<div>
		<a href="${pageContext.request.contextPath}/auth/logout">로그아웃</a>
		<a href="${pageContext.request.contextPath}/auth/manager/insertLecture">강의 개설</a>
	</div>
	<table border="1">
		<tr>
			<th>강좌 번호</th>
			<th>강사명</th>
			<th>강의명</th>
			<th>개강일</th>
			<th>종강일</th>
			<th>정원</th>
		</tr>
		<c:forEach items="${lectureList}" var="l">
			<tr>
				<td>${l.lectureNo}</td>
				<td>${l.teacherName}</td>
				<td>${l.lectureName}</td>
				<td>${l.lectureStartdate}</td>
				<td>${l.lectureEnddate}</td>
				<td>${l.lectureTotal}</td>
			</tr>
		</c:forEach>
	</table>
	<!-- 페이징 -->
	<div>
		<!-- 이전 페이지 네비 -->
		<c:if test="${navFirstPage > navPerPage }">
			<a
				href="${pageContext.request.contextPath }/auth/manager/lectureList/${navFirstPage - 1}">이전</a>
		</c:if>
		<!-- 현재 페이지 네비 -->
		<c:forEach var="navPage" begin="${navFirstPage }"
			end="${navLastPage }">
			<c:if test="${navPage <= endPage }">
				<a
					href="${pageContext.request.contextPath }/auth/manager/lectureList/${navPage}">${navPage}</a>
			</c:if>
		</c:forEach>
		<!-- 다음 페이지 네비 -->
		<c:if test="${navLastPage < endPage }">
			<a
				href="${pageContext.request.contextPath }/auth/manager//${navLastPage + 1}">다음</a>
		</c:if>
	</div>
</body>
</html>