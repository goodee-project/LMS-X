<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	</div>
	<table border="1">
		<tr>
			<th>강좌 번호</th>
			<th>강사명</th>
			<th>강의명</th>
			<th>개강일</th>
			<th>종강일</th>
			<th>정원</th>
			<th>상태 변경</th>
		</tr>
		<c:forEach items="${lectureList}" var="l">
			<tr>
				<td>
					<c:if test="${l.lectureStartdate != '0000-00-00'}">
						<a href="${pageContext.request.contextPath}/auth/manager/lecture/lectureOne/${l.lectureNo}">${l.lectureNo}</a>
					</c:if>
					<c:if test="${l.lectureStartdate == '0000-00-00'}">
						${l.lectureNo}
					</c:if>
				</td>
				<td>${l.teacherName}</td>
				<td>${l.lectureName}</td>
				<td>${l.lectureStartdate}</td>
				<td>${l.lectureEnddate}</td>
				<td>${l.lectureTotal}</td>
				<td>
					<c:if test="${l.lectureStartdate != '0000-00-00'}">
					<button type="button" class="btn btn-sm btn-dark" onclick="location.href='${pageContext.request.contextPath}/auth/manager/lecture/updateLectureStat/${l.lectureNo}'">변경</button>
					</c:if>
					<c:if test="${l.lectureStartdate == '0000-00-00'}">
						<button type="button" class="btn btn-sm btn-dark">폐강</button>
					</c:if>
				</td>
			</tr>
		</c:forEach>
	</table>
		<!-- 페이지 네비게이션 -->
		<ul class="pagination justify-content-center">
			<!-- 처음으로 버튼 -->
			<c:choose>
				<c:when test="${currentPage > 1}">
					<li class="page-item">
						<a class="page-link" href="${pageContext.request.contextPath}/auth/manager/lecture/lectureList/1">
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
						<a class="page-link" href="${pageContext.request.contextPath}/auth/manager/lecture/lectureList/${prePage}">
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
								<a class="page-link" href="${pageContext.request.contextPath}/auth/manager/lecture/lectureList/${i}">${i}</a>
							</li>
						</c:otherwise>
					</c:choose>
				</c:if>
			</c:forEach>
			
			<!-- 다음 버튼 -->
			<c:choose>
				<c:when test="${currentPage < lastPage}">
					<li class="page-item">
						<a class="page-link" href="${pageContext.request.contextPath}/auth/manager/lecture/lectureList/${nextPage}">
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
						<a class="page-link" href="${pageContext.request.contextPath}/auth/manager/lecture/lectureList/${lastPage}">
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