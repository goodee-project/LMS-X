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
			<jsp:include page="/WEB-INF/view/auth/student/include/menu.jsp" />
	    </div>
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
							<td><a href="${pageContext.request.contextPath}/auth/student/lecture/${ln.lectureNo}/notice/noticeOne/${ln.lectureNoticeNo}">${ln.lectureNoticeTitle}</a></td>
							<td>${ln.lectureNoticeCreatedate}</td>
							<td>${ln.lectureNoticeCount}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<!-- 페이지 네비게이션 -->
			<ul class="pagination justify-content-center">
				<!-- 처음으로 버튼 -->
				<c:choose>
					<c:when test="${currentPage > 1}">
						<li class="page-item">
							<a class="page-link" href="${pageContext.request.contextPath}/auth/student/lecture/{lectureNo}/notice/noticeList/1">
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
						<li>
							<a href="${pageContext.request.contextPath}/auth/student/lecture/${lectureNo}/notice/noticeList/${prePage}">
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
									<a class="page-link" href="${pageContext.request.contextPath}/auth/student/lecture/${lectureNo}/notice/noticeList/${i}">${i}</a>
								</li>
							</c:otherwise>
						</c:choose>
					</c:if>
				</c:forEach>
				
				<!-- 다음 버튼 -->
				<c:choose>
					<c:when test="${currentPage < lastPage}">
						<li >
							<a href="${pageContext.request.contextPath}/auth/student/lecture/${lectureNo}/notice/noticeList/${nextPage}">
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
							<a class="page-link" href="${pageContext.request.contextPath}/auth/student/lecture/${lectureNo}/notice/noticeList/${lastPage}">
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
		</div>
	</body>
</html>