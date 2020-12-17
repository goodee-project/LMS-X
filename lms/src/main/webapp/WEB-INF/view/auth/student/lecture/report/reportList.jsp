<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>reportList</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<script>
		</script>
	</head>
	<body>
		<h1>강좌 - 과제</h1>
		<div>
			<jsp:include page="/WEB-INF/view/auth/student/include/menu.jsp" />
	    </div>
		<div>
			<jsp:include page="/WEB-INF/view/auth/student/include/lectureMenu.jsp" />
	    </div>
		<table border="1">	
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>제출 기간</th>
			</tr>
			<c:forEach items="${reportList}" var="r">
				<tr>
					<td>${r.reportNo}</td>
					<td><a href="">${r.reportTitle}</a></td>
					<td>${r.reportStartdate} ~ ${r.reportEnddate}</td>
				</tr>	
			</c:forEach>
		</table>
		
		<!-- 페이징 -->
		<div>
			<!-- 이전 페이지 네비 -->
			<c:if test="${navFirstPage > navPerPage}">
				<a href="${pageContext.request.contextPath}/auth/student/lecture/${lectureNo}/report/reportList/${navFirstPage - 1}">이전</a>	
			</c:if>
			<!-- 현재 페이지 네비 -->
			<c:forEach var="navPage" begin="${navFirstPage}" end="${navLastPage}">
				<c:if test="${navPage <= endPage}">
					<a href="${pageContext.request.contextPath}/auth/student/lecture/${lectureNo}/report/reportList/${navPage}">${navPage}</a>
				</c:if>
			</c:forEach>
			<!-- 다음 페이지 네비 -->
			<c:if test="${navLastPage < endPage}">
				<a href="${pageContext.request.contextPath}/auth/student/lecture/${lectureNo}/report/reportList/${navLastPage + 1}">다음</a>	
			</c:if>
		</div>
	
	</body>
</html>