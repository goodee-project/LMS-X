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
	<div>
		<jsp:include page="/WEB-INF/view/auth/student/include/menu.jsp" />
    </div>
	<!-- 수강 목록 -->
	<h3>수강 목록</h3>
	<table border="1">	
		<tr>
			<th>수강 번호</th>
			<th>강사</th>
			<th>과목 이름</th>
			<th>강좌 이름</th>
			<th>강좌 총일수</th>
			<th>강좌 시작일</th>
			<th>강좌 종료일</th>
			<th>강좌 총원</th>
			<th>상태</th>
		</tr>
		<c:forEach items="${lectureList}" var="l">
			<tr>
				<td><a href="${pageContext.request.contextPath }/auth/student/lecture/classOne/${l.lecture.lectureNo}">${l.classRegistration.classRegistrationNo}</a></td>
				<td>${l.lecture.teacherName}</td>
				<td>${l.subject.subjectName}</td>
				<td>${l.lecture.lectureName}</td>
				<td>${l.subject.subjectTotalday}일</td>
				<td>${l.lecture.lectureStartdate}</td>
				<td>${l.lecture.lectureEnddate}</td>
				<td>${l.lecture.lectureTotal}명</td>
				<td>${l.classRegistration.classRegistrationState}</td>
			</tr>	
		</c:forEach>
	</table>
	
	<!-- 페이징 -->
	<div>
		<!-- 이전 페이지 네비 -->
		<c:if test="${navFirstPage > navPerPage }">
			<a href="${pageContext.request.contextPath }/auth/student/index/${navFirstPage - 1}">이전</a>	
		</c:if>
		<!-- 현재 페이지 네비 -->
		<c:forEach var="navPage" begin="${navFirstPage }" end="${navLastPage }">
			<c:if test="${navPage <= endPage }">
				<a href="${pageContext.request.contextPath }/auth/student/index/${navPage}">${navPage}</a>
			</c:if>
		</c:forEach>
		<!-- 다음 페이지 네비 -->
		<c:if test="${navLastPage < endPage }">
			<a href="${pageContext.request.contextPath }/auth/student/youngi/${navLastPage + 1}">다음</a>	
		</c:if>
	</div>
</body>
</html>