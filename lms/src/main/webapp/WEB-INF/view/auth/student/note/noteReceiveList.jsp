<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>noticeReceiveList</title>
</head>
	<body>
		<h1>수신함</h1>
		<!-- 메뉴 -->
		<div>
			<jsp:include page="/WEB-INF/view/auth/student/include/menu.jsp" />
	    </div>
		<div>
			<a href="${pageContext.request.contextPath}/auth/student/note/noteReceiveList/1">수신함</a>
			
			<a href="${pageContext.request.contextPath}/auth/student/note/noteDispatchList/1">발신함</a>
			
			<a href="${pageContext.request.contextPath}/auth/student/note/insertNote">쪽지 작성</a>
	    </div>
		<div>
			<table border="1">
				<thead>
					<tr>
						<td>상태</td>
						<td>제목</td>
						<td>보낸사람</td>
						<td>보낸 날짜</td>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="nl" items="${noteList}">
						<tr>
							<td>
								<c:if test="${nl.noteIsRead == 'Y'}">
									읽음
								</c:if>
								<c:if test="${nl.noteIsRead == 'N'}">
									!
								</c:if>
							</td>
							<td><a href="${pageContext.request.contextPath}/auth/student/note/noteReceiveOne/${nl.noteNo}">${nl.noteTitle}</a></td>
							<td>${nl.noteDispatcherName}(${nl.noteDispatcherId})</td>
							<td>${nl.noteSendDate}</td>
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
							<a class="page-link" href="${pageContext.request.contextPath}/auth/student/note/noteReceiveList/1">
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
							<a href="${pageContext.request.contextPath}/auth/student/note/noteReceiveList/${prePage}">
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
									<a class="page-link" href="${pageContext.request.contextPath}/auth/student/note/noteReceiveList/${i}">${i}</a>
								</li>
							</c:otherwise>
						</c:choose>
					</c:if>
				</c:forEach>
				
				<!-- 다음 버튼 -->
				<c:choose>
					<c:when test="${currentPage < lastPage}">
						<li >
							<a href="${pageContext.request.contextPath}/auth/student/note/noteReceiveList/${nextPage}">
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
							<a class="page-link" href="${pageContext.request.contextPath}/auth/student/note/noteReceiveList/${lastPage}">
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