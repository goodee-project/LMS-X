<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>로그인 로그 목록</h1>
	<div><a href="${pageContext.request.contextPath }/auth/manager/index">홈으로</a></div>
	<table border="1">
		<tr>
			<th>로그인 로그 번호</th>
			<th>접속계정ID</th>
			<th>접속 날짜</th>
			<th>접속 브라우저</th>
			<th>로그인 IP</th>
			<th>로그인한 OS</th>
		</tr>
		<c:forEach items="${loginLogList}" var="lll">
			<tr>
				<td>${lll.loginLogNo}</td>
				<td>${lll.accountId}</td>
				<td>${lll.loginLogDate}</td>
				<td>${lll.loginLogBrowser}</td>
				<td>${lll.loginLogIp}</td>
				<td>${lll.loginLogOs}</td>
			</tr>
		</c:forEach>
	</table>
	<!-- 페이지 네비게이션 -->
	<ul class="pagination justify-content-center">
		<!-- 처음으로 버튼 -->
		<c:choose>
			<c:when test="${currentPage > 1}">
				<li class="page-item">
					<a class="page-link" href="${pageContext.request.contextPath}/auth/manager/access/accessList/1">
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
					<a class="page-link" href="${pageContext.request.contextPath}/auth/manager/access/accessList/${prePage}">
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
							<a class="page-link" href="${pageContext.request.contextPath}/auth/manager/access/accessList/${i}">${i}</a>
						</li>
					</c:otherwise>
				</c:choose>
			</c:if>
		</c:forEach>
		
		<!-- 다음 버튼 -->
		<c:choose>
			<c:when test="${currentPage < lastPage}">
				<li class="page-item">
					<a class="page-link" href="${pageContext.request.contextPath}/auth/manager/access/accessList/${nextPage}">
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
					<a class="page-link" href="${pageContext.request.contextPath}/auth/manager/access/accessList/${lastPage}">
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
	
	<div class="card-footer py-4">
		<!-- 검색 -->
		<form method="get" action="${pageContext.request.contextPath}/auth/manager/access/accessList/1" class="form-inline">
			<div class="input-group" style="width: 70%; margin: auto;">
				<div class="input-group-prepend">
					<span class="input-group-text">검색</span>
				</div>
				
				<input type="text" class="form-control" name="searchText" value="${searchText}">
				
				<div class="input-group-append">
					<button type="submit" class="btn btn-outline-primary">검색</button>
				</div>
			</div>
		</form>
	</div>
</body>
</html>