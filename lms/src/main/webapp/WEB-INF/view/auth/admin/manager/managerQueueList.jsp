<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>managerQueueList</title>
	<!-- Bootstrap Framework 사용 -->
		
	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	
	<!-- jQuery library -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	
	<!-- Popper JS -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	
	<!-- Latest compiled JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	
	<!-- Bootstrap 4 Icons -->
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">

	
</head>
<body>

	<jsp:include page="/WEB-INF/view/auth/admin/include/menu.jsp"/>
	
	<h1>운영자 승인대기 목록</h1>

	<table class="table-bordered">
		<thead>
			<tr>
				<th>아이디</th>
				<th>이메일</th>
				<th>이름</th>
				<th>성별</th>
				<th>생일</th>
				<th>주소</th>
				<th>승인</th>
				<th>거절</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="mql" items="${managerQueueList}">
				<tr>
					<td>${mql.managerId}</td>
					<td>${mql.managerEmail}</td>
					<td>${mql.managerName}</td>
					<td>${mql.managerGender}</td>
					<td>${mql.managerBirth}</td>
					<td>${mql.managerAddressMain} ${mql.managerAddressSub}</td>
					<td><a href="${pageContext.request.contextPath}/auth/admin/accessManager/${currentPage}/${mql.managerId}">승인</a></td>
					<td><a href="${pageContext.request.contextPath}/auth/admin/negativeManager/${mql.managerId}">거절</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
	<ul class="pagination justify-content-center">
		<!-- 처음으로 버튼 -->
		<c:choose>
			<c:when test="${currentPage > 1}">
				<li class="page-item">
					<a class="page-link" href="${pageContext.request.contextPath}/auth/admin/managerQueue/1">
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
					<a class="page-link" href="${pageContext.request.contextPath}/auth/admin/managerQueue/${prePage}">
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
							<a class="page-link" href="${pageContext.request.contextPath}/auth/admin/managerQueue/${i}">${i}</a>
						</li>
					</c:otherwise>
				</c:choose>
			</c:if>
		</c:forEach>
		
		<!-- 다음 버튼 -->
		<c:choose>
			<c:when test="${currentPage < lastPage}">
				<li class="page-item">
					<a class="page-link" href="${pageContext.request.contextPath}/auth/admin/managerQueue/${nextPage}">
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
					<a class="page-link" href="${pageContext.request.contextPath}/auth/admin/managerQueue/${lastPage}">
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