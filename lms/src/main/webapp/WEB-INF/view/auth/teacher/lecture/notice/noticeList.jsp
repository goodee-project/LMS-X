<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>noticeList</title>
<!-- Bootstrap Framework 사용 -->

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- CSS Files -->
<link
	href="${pageContext.request.contextPath}/assets/css/argon-dashboard.css?v=1.1.2"
	rel="stylesheet" />

<!-- Icons -->
<link
	href="${pageContext.request.contextPath}/assets/js/plugins/nucleo/css/nucleo.css"
	rel="stylesheet" />

<!-- Popper JS -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	
<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<!-- Bootstrap 4 Icons -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
	integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
	crossorigin="anonymous">

<style>
.table {
	text-align: center;
}

.table td {
	vertical-align: middle;
}

.table a {
	color: #000000;
}

th {
	text-align: center;
	background-color: #F9F9FB;
}
</style>
</head>
<body class="">
	<nav
		class="navbar navbar-vertical fixed-left navbar-expand-md navbar-light bg-white"
		id="sidenav-main">
		<div class="container-fluid">
			<!-- 내비게이션 메인 메뉴 -->
			<jsp:include page="/WEB-INF/view/auth/teacher/include/menu.jsp" />
		</div>
	</nav>
	<div class="main-content">
		<!-- 내비게이션 상단 메뉴 -->
		<div class="container-fluid">
			<jsp:include
				page="/WEB-INF/view/auth/teacher/include/lectureMenu.jsp" />
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
											<h5 class="card-title text-uppercase text-muted mb-0">접속자
												현황</h5>
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
										<span class="text-nowrap">누적 접속자</span> <span
											class="text-success mr-2">1,000,000,000</span>
									</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="container-fluid mt--7">
			<!-- Table -->
			<div class="row">
				<div class="col">
					<div class="card shadow">
						<div class="card-header bg-white border-0">
							<div class="row align-items-center">
								<br>
								<div class="col-8">
									<h3 class="mb-0">&nbsp;&nbsp;&nbsp;공지사항 목록</h3>
								</div>
								<div class="col-4 text-right">
									<button type="button" class="btn btn-sm btn-success"
										style="float: right;"
										onclick="location.href='${pageContext.request.contextPath}/auth/teacher/lecture/${lectureNo}/notice/insertNotice'">작성</button>
								</div>
								<br>
							</div>
						</div>
						<div class="table-responsive">
							<table class="table align-items-center table-flush">
								<thead class="thead-light">
									<tr>
										<th scope="col">번호</th>
										<th scope="col">제목</th>
										<th scope="col">작성일시</th>
										<th scope="col">조회수</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${teacherLectureNoticeList}" var="n">
										<tr>
											<td>${n.lectureNoticeNo}</td>
											<td><a
												href="${pageContext.request.contextPath}/auth/teacher/lecture/${n.lectureNo}/notice/noticeOne/${n.lectureNoticeNo}">${n.lectureNoticeTitle}</a></td>
											<td>${n.lectureNoticeCreatedate}</td>
											<td>${n.lectureNoticeCount}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<div class="card-footer py-4">
							<nav aria-label="...">
								<!-- 페이지 내비게이션 -->
								<ul class="pagination justify-content-center">
									<!-- 처음으로 버튼 -->
									<c:choose>
										<c:when test="${currentPage > 1}">
											<li class="page-item"><a class="page-link"
												href="${pageContext.request.contextPath}/auth/teacher/lecture/${lectureNo}/notice/noticeList/1">
													<i class='fas fa-angle-double-left'></i>
											</a></li>
										</c:when>
										<c:otherwise>
											<li class="page-item disabled"><a class="page-link"
												href="#"> <i class='fas fa-angle-double-left'></i>
											</a></li>
										</c:otherwise>
									</c:choose>

									<!-- 이전 버튼 -->
									<c:choose>
										<c:when test="${currentPage > 1}">
											<li class="page-item"><a class="page-link"
												href="${pageContext.request.contextPath}/auth/teacher/lecture/${lectureNo}/notice/noticeList/${prePage}">
													<i class='fas fa-angle-left'></i>
											</a></li>
										</c:when>
										<c:otherwise>
											<li class="page-item disabled"><a class="page-link"
												href="#"> <i class='fas fa-angle-left'></i>
											</a></li>
										</c:otherwise>
									</c:choose>

									<!-- 현재 페이지 표시 -->
									<c:forEach var="i" begin="${navFirstPage}" end="${navLastPage}">
										<c:if test="${i <= lastPage}">
											<c:choose>
												<%-- 현재 페이지 --%>
												<c:when test="${i == currentPage}">
													<li class="page-item active"><a class="page-link"
														href="#">${i}</a></li>
												</c:when>
												<%-- 현재 페이지가 아닌 선택 가능한 페이지 --%>
												<c:otherwise>
													<li class="page-item"><a class="page-link"
														href="${pageContext.request.contextPath}/auth/teacher/lecture/${lectureNo}/notice/noticeList/${i}">${i}</a>
													</li>
												</c:otherwise>
											</c:choose>
										</c:if>
									</c:forEach>

									<!-- 다음 버튼 -->
									<c:choose>
										<c:when test="${currentPage < lastPage}">
											<li class="page-item"><a class="page-link"
												href="${pageContext.request.contextPath}/auth/teacher/lecture/${lectureNo}/notice/noticeList/${nextPage}">
													<i class='fas fa-angle-right'></i>
											</a></li>
										</c:when>
										<c:otherwise>
											<li class="page-item disabled"><a class="page-link"
												href="#"> <i class='fas fa-angle-right'></i>
											</a></li>
										</c:otherwise>
									</c:choose>

									<!-- 마지막으로 버튼 -->
									<c:choose>
										<c:when test="${currentPage < lastPage}">
											<li class="page-item"><a class="page-link"
												href="${pageContext.request.contextPath}/auth/teacher/lecture/${lectureNo}/notice/noticeList/${lastPage}">
													<i class='fas fa-angle-double-right'></i>
											</a></li>
										</c:when>
										<c:otherwise>
											<li class="page-item disabled"><a class="page-link"
												href="#"> <i class='fas fa-angle-double-right'></i>
											</a></li>
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
							</nav>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>