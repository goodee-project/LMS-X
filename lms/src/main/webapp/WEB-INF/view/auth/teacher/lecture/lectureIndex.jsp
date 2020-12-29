<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>lectureIndex</title>
		
		<!-- Bootstrap Framework 사용 -->
		
		<!-- Latest compiled and minified CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
		
		<!-- jQuery library -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		
		<!-- CSS Files -->
		<link
			href="${pageContext.request.contextPath}/assets/css/argon-dashboard.css?v=1.1.2"
			rel="stylesheet" />
		
		<!-- Icons -->
		<link
			href="${pageContext.request.contextPath}/assets/js/plugins/nucleo/css/nucleo.css"
			rel="stylesheet" />
		
		<!-- Popper JS -->
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
		
		<!-- Latest compiled JavaScript -->
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
		
		<!-- Bootstrap 4 Icons -->
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
	
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
									<h3 class="mb-0">강좌 정보</h3>
									<br>
								</div>
								<div class="col-4 text-right">
								</div>
								<br>
							</div>
							<div class="table-responsive">
								<table class="table align-items-center table-flush">
									<thead class="thead-light">
										<tr>
											<th scope="col">과목</th>
											<th scope="col">강좌</th>
											<th scope="col">강사</th>
											<th scope="col">개강일</th>
											<th scope="col">종강일</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>${lecture.subject.subjectName}</td>
											<td>${lecture.lectureName}</td>
											<td>${lecture.teacherName}</td>
											<td>${lecture.lectureStartdate}</td>
											<td>${lecture.lectureEnddate}</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- Table 2 -->
			<div class="row mt-5">
				<div class="col">
					<div class="card shadow">
						<div class="card-header bg-white border-0">
							<div class="row align-items-center">
								<br>
								<div class="col-8">
									<h3 class="mb-0">공지사항 목록</h3>
									<br>
								</div>
								<div class="col-4 text-right">
								</div>
								<br>
							</div>
							<div class="table-responsive">
								<table class="table align-items-center table-flush">
									<thead>
										<tr>
											<th>번호</th>
											<th>제목</th>
											<th>작성일시</th>
											<th>조회수</th>
										</tr>
									</thead>
									<tbody>
										<c:if test="${lectureNoticeList[0].lectureNoticeNo != null}">
											<c:forEach var="lnl" items="${lectureNoticeList}">
												<tr>
													<td width="15%">${lnl.lectureNoticeNo}</td>
													<td width="45%">
														<a href="${pageContext.request.contextPath}/auth/teacher/lecture/${lnl.lectureNo}/notice/noticeOne/${lnl.lectureNoticeNo}">${lnl.lectureNoticeTitle}</a>
													</td>
													<td width="20%">${lnl.lectureNoticeCreatedate}</td>
													<td width="20%">${lnl.lectureNoticeCount}</td>
												</tr>
											</c:forEach>
										</c:if>
										<c:if test="${lectureNoticeList[0].lectureNoticeNo == null}">
											<tr>
												<td colspan="7">(공지사항이 없습니다)</td>
											</tr>
										</c:if>
									</tbody>						
								</table>
							</div>
						</div>		
					</div>
				</div>
			</div>
		</div>
		 <!--   Core   -->
		  <script src="./assets/js/plugins/jquery/dist/jquery.min.js"></script>
		  <script src="./assets/js/plugins/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
		  <!--   Optional JS   -->
		  <script src="./assets/js/plugins/chart.js/dist/Chart.min.js"></script>
		  <script src="./assets/js/plugins/chart.js/dist/Chart.extension.js"></script>
		  <!--   Argon JS   -->
		  <script src="./assets/js/argon-dashboard.min.js?v=1.1.2"></script>
		  <script src="https://cdn.trackjs.com/agent/v3/latest/t.js"></script>
		  <script>
		    window.TrackJS &&
		      TrackJS.install({
		        token: "ee6fab19c5a04ac1a32a645abde4613a",
		        application: "argon-dashboard-free"
		      });
		  </script>
	</body>
</html>