<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>lecturNoticeOne</title>
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
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
	<body>
			<!-- 메인 Navbar -->
		
		<nav class="navbar navbar-vertical fixed-left navbar-expand-md navbar-light bg-white" id="sidenav-main">
			<div class="container-fluid">
				<jsp:include page="/WEB-INF/view/auth/student/include/menu.jsp" />
		    </div>	
		</nav>   		
		<div class="main-content">
			<!-- 상단 Navbar -->
			<div class="container-fluid">
				<jsp:include page="/WEB-INF/view/auth/student/include/topMenu.jsp" />
	    	</div>
			<!-- 강좌 Navbar -->
			<div class="container-fluid">
				<jsp:include page="/WEB-INF/view/auth/student/include/lectureMenu.jsp" />
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
								<h3 class="mb-0">강의 공지사항 상세보기</h3>
							</div>
						</div>
					</div>	
				<div class="row align-items-center">
					<div class="col-12">
						<table class="table">
							<tr>
								<td width="10%">강좌 번호</td>
								<td>${lectureNotice.lectureNo}</td>
							</tr>
							<tr>
								<td>공지사항 번호</td>
								<td>${lectureNotice.lectureNoticeNo}</td>
							</tr>
							<tr>
								<td>제목</td>
								<td>${lectureNotice.lectureNoticeTitle}</td>
							</tr>
							<tr>
								<td >내용</td>
								<td >${lectureNotice.lectureNoticeContent}</td>
							</tr>
							<tr>
								<td>작성일</td>
								<td >${lectureNotice.lectureNoticeCreatedate}</td>
							</tr>
							<tr>
								<td>수정일</td>
								<td >${lectureNotice.lectureNoticeUpdatedate}</td>
							</tr>
							<tr>
								<td>조회수</td>
								<td >${lectureNotice.lectureNoticeCount}</td>
							</tr>
						</table>
						<div style="float: right"><a class="btn btn-outline-primary" href="${pageContext.request.contextPath}/auth/student/lecture/${lectureNo}/notice/noticeList/1">뒤로가기</a></div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>