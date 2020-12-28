<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>index</title>
		<!-- Favicon -->
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
		<!-- jQuery / Ajax Google CDN -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	</head>
	<body class="">
		<nav class="navbar navbar-vertical fixed-left navbar-expand-md navbar-light bg-white"
			id="sidenav-main">
			<!-- 메인 Navbar -->
			<div class="container-fluid">
				<jsp:include page="/WEB-INF/view/auth/student/include/menu.jsp" />
		    </div>	
		</nav>
		<div class="main-content">
		<!-- 상단 Navbar -->
		<div class="container-fluid">
			<jsp:include page="/WEB-INF/view/auth/student/include/topMenu.jsp" />
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
			<div class="col-xl-12">
				<div class="card shadow">
					<div class="card-header border-0">
						<div class="row align-items-center">
							<div class="col">
								<h3 class="mb-0">수강 목록</h3>
							</div>
						</div>
					</div>
					<div class="row align-items-center">
						<div class="col-12">
							<table class="table">
								<thead class="thead-light">
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
								</thead>
								<c:forEach items="${lectureList}" var="l">
									<tr>
										<td>${l.lecture.teacherName}</td>
										<td>${l.subject.subjectName}</td>
										<td><a
											href="${pageContext.request.contextPath}/auth/student/lecture/classOne/${l.lecture.lectureNo}">${l.lecture.lectureName}</a></td>
										<td>${l.subject.subjectTotalday}일</td>
										<td>${l.lecture.lectureStartdate}</td>
										<td>${l.lecture.lectureEnddate}</td>
										<td>${l.lecture.lectureTotal}명</td>
										<td>${l.classRegistration.classRegistrationState}</td>
									</tr>
								</c:forEach>
							</table>
						</div>
					</div>
				</div>
				<div class="card-body">
					<!-- Chart -->
					<div class="chart">
						<!-- Chart wrapper -->
						<canvas id="chart-sales" class="chart-canvas"></canvas>
					</div>
				</div>
			</div>
		</div>
		<!--   Core   -->
		<script src="./assets/js/plugins/jquery/dist/jquery.min.js"></script>
		<script
			src="./assets/js/plugins/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
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