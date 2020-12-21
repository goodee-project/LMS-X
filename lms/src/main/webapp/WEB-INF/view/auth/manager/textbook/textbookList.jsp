<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>교과서 index</h1>
	<div><a href="${pageContext.request.contextPath }/auth/manager/index">홈으로</a></div>
	<div><a href="${pageContext.request.contextPath }/auth/manager/textbook/insertTextbook">교재 추가</a></div>
	<table border="1">
		<tr>
			<th>교재 번호</th>
			<th>교재 이름</th>
			<th>교재 저자</th>
			<th>교재 출판일</th>
		</tr>
		<c:forEach items="${textbookList}" var="t">
			<tr>
				<td><a href="${pageContext.request.contextPath}/auth/manager/textbook/textbookOne/${t.textbookIsbn}">${t.textbookIsbn}</a></td>
				<td>${t.textbookTitle}</td>
				<td>${t.textbookWriter}</td>
				<td>${t.textbookPublishdate}</td>
			</tr>
		</c:forEach>
	</table>
	<!-- 페이지 네비게이션 -->
	<ul class="pagination justify-content-center">
		<!-- 처음으로 버튼 -->
		<c:choose>
			<c:when test="${currentPage > 1}">
				<li class="page-item">
					<a class="page-link" href="${pageContext.request.contextPath}/auth/manager/textbook/textbookList/1">
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
					<a class="page-link" href="${pageContext.request.contextPath}/auth/manager/textbook/textbookList/${prePage}">
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
							<a class="page-link" href="${pageContext.request.contextPath}/auth/manager/textbook/textbookList/${i}">${i}</a>
						</li>
					</c:otherwise>
				</c:choose>
			</c:if>
		</c:forEach>
		
		<!-- 다음 버튼 -->
		<c:choose>
			<c:when test="${currentPage < lastPage}">
				<li class="page-item">
					<a class="page-link" href="${pageContext.request.contextPath}/auth/manager/textbook/textbookList/${nextPage}">
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
					<a class="page-link" href="${pageContext.request.contextPath}/auth/manager/textbook/textbookList/${lastPage}">
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