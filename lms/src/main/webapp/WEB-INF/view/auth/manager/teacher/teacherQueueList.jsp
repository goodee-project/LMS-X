<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>teacherQueueList</title>
	<link href="${pageContext.request.contextPath}/assets/img/brand/favicon.png" rel="icon" type="image/png">
	<!-- Fonts -->
	<link
		href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700"
		rel="stylesheet">
	<!-- Icons -->
	<link href="${pageContext.request.contextPath}/assets/js/plugins/nucleo/css/nucleo.css" rel="stylesheet" />
	<link
		href="${pageContext.request.contextPath}/assets/js/plugins/@fortawesome/fontawesome-free/css/all.min.css"
		rel="stylesheet" />
	<!-- CSS Files -->
	<link href="${pageContext.request.contextPath}/assets/css/argon-dashboard.css?v=1.1.2" rel="stylesheet" />
</head>
	<body>
	<!-- 내비게이션 메인 메뉴 -->
	<jsp:include page="/WEB-INF/view/auth/manager/include/menu.jsp" />
	<div class="main-content">
	<!-- 내비게이션 상단 메뉴 -->
	<div class="container-fluid">
		<jsp:include page="/WEB-INF/view/auth/manager/include/topMenu.jsp" />
	</div>
	    <!-- Header -->
			<div class="header bg-gradient-primary pb-8 pt-5 pt-md-8">
				<div class="container-fluid">
					<div class="header-body">
						<!-- Card stats -->
						<div class="row">
							<div class="col-xl-3 col-lg-6">
								<div class="card card-stats mb-4 mb-xl-0">
									<div class="card-body">
										<div class="row">
											<div class="col">
												<h5 class="card-title text-uppercase text-muted mb-0">접속자 현황</h5>
												<span class="h2 font-weight-bold mb-0">350,897</span>
											</div>
											<div class="col-auto">
												<div
													class="icon icon-shape bg-danger text-white rounded-circle shadow">
													<i class="fas fa-chart-bar"></i>
												</div>
											</div>
										</div>
										<p class="mt-3 mb-0 text-muted text-sm">
											<span class="text-nowrap">누적 접속자</span>
											<span class="text-success mr-2">1,000,000,000</span> 
										</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="container-fluid mt--7">
				<div class="card shadow">
					<div class="card-header border-0">
						<div class="row align-items-center">
							<div class="col">
								<h2 class="mb-0">강사 승인대기 목록</h2>
							</div>
						</div>
					</div>
					<div class="row align-items-center">
						<div class="col-12">
							<table class="table">
								<thead class="thead-light">
									<tr>
										<th>아이디</th>
										<th>이메일</th>
										<th>핸드폰번호</th>
										<th>이름</th>
										<th>성별</th>
										<th>생일</th>
										<th>주소</th>
										<th>승인</th>
										<th>거절</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="tql" items="${teacherQueueList}">
										<tr>
											<td>${tql.teacherId}</td>
											<td>${tql.teacherEmail}</td>
											<td>${tql.teacherPhone}</td>
											<td>${tql.teacherName}</td>
											<td>${tql.teacherGender}</td>
											<td>${tql.teacherBirth}</td>
											<td>${tql.teacherAddressMain} ${tql.teacherAddressSub}</td>
											<td><a href="${pageContext.request.contextPath}/auth/manager/teacher/accessTeacher/${currentPage}/${tql.teacherId}">승인</a></td>
											<td><a href="${pageContext.request.contextPath}/auth/manager/teacher/negativeTeacher/${tql.teacherId}">거절</a></td>
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
											<a class="page-link" href="${pageContext.request.contextPath}/auth/manager/teacher/teacherQueueList/1">
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
											<a class="page-link" href="${pageContext.request.contextPath}/auth/manager/teacher/teacherQueueList/${prePage}">
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
													<a class="page-link" href="${pageContext.request.contextPath}/auth/manager/teacher/teacherQueueList/${i}">${i}</a>
												</li>
											</c:otherwise>
										</c:choose>
									</c:if>
								</c:forEach>
								
								<!-- 다음 버튼 -->
								<c:choose>
									<c:when test="${currentPage < lastPage}">
										<li class="page-item">
											<a class="page-link" href="${pageContext.request.contextPath}/auth/manager/teacher/teacherQueueList/${nextPage}">
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
											<a class="page-link" href="${pageContext.request.contextPath}/auth/manager/teacher/teacherQueueList/${lastPage}">
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
					</div>
				</div>
				<!-- Footer -->
				<jsp:include page="/WEB-INF/view/auth/include/footer.jsp"></jsp:include>
			</div>
		</div>
	</body>
</html>