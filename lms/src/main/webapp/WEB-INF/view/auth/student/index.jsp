<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>index</title>
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
					<td>${l.lecture.teacherName}</td>
					<td>${l.subject.subjectName}</td>
					<td><a href="${pageContext.request.contextPath}/auth/student/lecture/classOne/${l.lecture.lectureNo}">${l.lecture.lectureName}</a></td>					
					<td>${l.subject.subjectTotalday}일</td>
					<td>${l.lecture.lectureStartdate}</td>
					<td>${l.lecture.lectureEnddate}</td>
					<td>${l.lecture.lectureTotal}명</td>
					<td>${l.classRegistration.classRegistrationState}</td>
				</tr>	
			</c:forEach>
		</table>
				
		<!-- 페이지 네비게이션 -->
		<ul class="pagination justify-content-center">
			<!-- 처음으로 버튼 -->
			<c:choose>
				<c:when test="${currentPage > 1}">
					<li class="page-item">
						<a class="page-link" href="${pageContext.request.contextPath}/auth/student/index/1">
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
						<a class="page-link" href="${pageContext.request.contextPath}/auth/student/index/${prePage}">
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
								<a class="page-link" href="${pageContext.request.contextPath}/auth/student/index/${i}">${i}</a>
							</li>
						</c:otherwise>
					</c:choose>
				</c:if>
			</c:forEach>
			
			<!-- 다음 버튼 -->
			<c:choose>
				<c:when test="${currentPage < lastPage}">
					<li class="page-item">
						<a class="page-link" href="${pageContext.request.contextPath}/auth/student/index/${nextPage}">
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
						<a class="page-link" href="${pageContext.request.contextPath}/auth/student/index/${lastPage}">
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