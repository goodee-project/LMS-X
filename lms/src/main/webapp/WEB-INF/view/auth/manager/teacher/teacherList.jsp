<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div><a href="${pageContext.request.contextPath }/auth/manager/index">홈으로</a></div>
	<h1>강사 index</h1>
	<div><a href="${pageContext.request.contextPath}/auth/manager/teacher/teacherQueueList/1">승인대기</a></div>
	<table border="1">	
		<tr>
			<th>강사 ID</th>
			<th>강사 이름</th>
			<th>강사 성별</th>
			<th>활성화 여부</th>
		</tr>
		<c:forEach items="${teacherList}" var="t">
			<tr>
				<td><a href="${pageContext.request.contextPath}/auth/manager/teacher/teacherOne/${t.teacherId}">${t.teacherId}</a></td>
				<td>${t.teacherName}</td>
				<td>${t.teacherGender}</td>
				<td>${t.accountState}</td>
			</tr>	
		</c:forEach>
	</table>
	<!-- 페이지 네비게이션 -->
	<ul class="pagination justify-content-center">
		<!-- 처음으로 버튼 -->
		<c:choose>
			<c:when test="${currentPage > 1}">
				<li class="page-item">
					<a class="page-link" href="${pageContext.request.contextPath}/auth/manager/teacher/teacherList/1">
						<i class='fas fa-angle-double-left'></i>
					</a>
				</li>
			</c:when>
			<c:otherwise>
				<li class="page-item disabled">
					<a class="page-link" href="#">
						<i class='fas fa-angle-double-left'></i>
					</a>
				</li>
			</c:otherwise>
		</c:choose>
		
		<!-- 이전 버튼 -->
		<c:choose>
			<c:when test="${currentPage > 1}">
				<li class="page-item">
					<a class="page-link" href="${pageContext.request.contextPath}/auth/manager/teacher/teacherList/${prePage}">
						<i class='fas fa-angle-left'></i>
					</a>
				</li>
			</c:when>
			<c:otherwise>
				<li class="page-item disabled">
					<a class="page-link" href="#">
						<i class='fas fa-angle-left'></i>
					</a>
				</li>
			</c:otherwise>
		</c:choose>
		
		<!-- 현재 페이지 표시 -->
		<c:forEach var="i" begin="${navFirstPage}" end="${navLastPage}">
			<c:if test="${i <= lastPage}">
				<c:choose>
					<%-- 현재 페이지 --%>
					<c:when test="${i == currentPage}">
						<li class="page-item active">
							<a class="page-link" href="#">${i}</a>
						</li>
					</c:when>
					<%-- 현재 페이지가 아닌 선택 가능한 페이지 --%>
					<c:otherwise>
						<li class="page-item">
							<a class="page-link" href="${pageContext.request.contextPath}/auth/manager/teacher/teacherList/${i}">${i}</a>
						</li>
					</c:otherwise>
				</c:choose>
			</c:if>
		</c:forEach>
		
		<!-- 다음 버튼 -->
		<c:choose>
			<c:when test="${currentPage < lastPage}">
				<li class="page-item">
					<a class="page-link" href="${pageContext.request.contextPath}/auth/manager/teacher/teacherList/${nextPage}">
						<i class='fas fa-angle-right'></i>
					</a>
				</li>
			</c:when>
			<c:otherwise>
				<li class="page-item disabled">
					<a class="page-link" href="#">
						<i class='fas fa-angle-right'></i>
					</a>
				</li>
			</c:otherwise>
		</c:choose>
		
		<!-- 마지막으로 버튼 -->
		<c:choose>
			<c:when test="${currentPage < lastPage}">
				<li class="page-item">
					<a class="page-link" href="${pageContext.request.contextPath}/auth/manager/teacher/teacherList/${lastPage}">
						<i class='fas fa-angle-double-right'></i>
					</a>
				</li>
			</c:when>
			<c:otherwise>
				<li class="page-item disabled">
					<a class="page-link" href="#">
						<i class='fas fa-angle-double-right'></i>
					</a>
				</li>
			</c:otherwise>
		</c:choose>
	</ul>
	
	<!-- 총 페이지 수 출력 -->
	<table style="margin: auto;">
		<tr>
			<td>
				<button type="button" class="btn btn-outline-dark btn-sm">
					${currentPage} / ${lastPage} 페이지
				</button>
			</td>
		</tr>
	</table>
</body>
</html>