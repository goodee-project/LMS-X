<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		
		<title>studentOne</title>
		
		<!-- Favicon -->
		<link href="${pageContext.request.contextPath}/assets/img/brand/favicon.png" rel="icon" type="image/png">
		
		<!-- Fonts -->
		<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
		
		<!-- Icons -->
		<link href="${pageContext.request.contextPath}/assets/js/plugins/nucleo/css/nucleo.css" rel="stylesheet" />
		<link href="${pageContext.request.contextPath}/assets/js/plugins/@fortawesome/fontawesome-free/css/all.min.css" rel="stylesheet" />
		
		<!-- CSS Files -->
		<link href="${pageContext.request.contextPath}/assets/css/argon-dashboard.css?v=1.1.2" rel="stylesheet" />
		
		<!-- jQuery library -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		
		<!-- Bootstrap 4 Icons -->
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
		
		<!-- jQuery library -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		
		<style>
			.attendanceTable {
				text-align: center;
			}
			
			.attendanceTable td {
				vertical-align: middle;
			}
			
			.attendanceTable a {
				color: #000000;
			}
			
			.attendanceTable th {
				text-align: center;
			}
		</style>
	</head>
	
	<body>
		<!-- 내비게이션 메인 메뉴 -->
		<jsp:include page="/WEB-INF/view/auth/teacher/include/menu.jsp" />
		
		<div class="main-content">
			<!-- 내비게이션 상단 메뉴 -->
			<div class="container-fluid">
				<jsp:include page="/WEB-INF/view/auth/teacher/include/lectureMenu.jsp" />
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
			
			<!-- Page content -->
			<div class="container-fluid mt--7">
				<!-- Table 1 -->
				<div class="row">
					<div class="col">
						<div class="card shadow">
							<div class="card-header bg-white border-0">
								<div class="row align-items-center">
									<br>
									<div class="col-8">
										<h3 class="mb-0">학생 정보</h3>
									</div>
									<div class="col-4 text-right">
										<button type="button" class="btn btn-sm btn-dark" onclick="location.href='${pageContext.request.contextPath}/auth/teacher/lecture/${lectureNo}/student/studentList/1'">목록</button>
									</div>
									<br>
								</div>
							</div>
							
							<div class="table-responsive">
								<table class="table align-items-center table-flush">
									<tr>
										<td width="10%">ID</td>
										<td width="40%">${LASACR.classRegistration.accountId}</td>
										<td width="10%">이름</td>
										<td width="40%">${LASACR.student.studentName}</td>
									</tr>
									<tr>
										<td>생년월일</td>
										<td>${LASACR.student.studentBirth}</td>
										<td>성별</td>
										<td>${LASACR.student.studentGender}</td>
									</tr>
									<tr>
										<td>이메일</td>
										<td>${LASACR.student.studentEmail}</td>
										<td>전화번호</td>
										<td>${LASACR.student.studentPhone}</td>
									</tr>
									<tr>
										<td>주소</td>
										<td colspan="3">${LASACR.student.studentAddressMain}</td>
									</tr>
									<tr>
										<td>상세 주소</td>
										<td colspan="3">${LASACR.student.studentAddressSub}</td>
									</tr>
								</table>
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
									<div class="col-8">
										<h3 class="mb-0">출결 정보</h3>
									</div>
									<div class="col-4 text-right">
									</div>
								</div>
							</div>
							
							<div class="table-responsive">
								<table class="table attendanceTable align-items-center table-flush attendanceTableMenu">
									<tr>
										<td width="35%" style="text-align: right;">
											<button type="button" class="btn btn-secondary"
												onclick="location.href='${pageContext.request.contextPath}/auth/teacher/lecture/${LASACR.lecture.lectureNo}/student/studentOne/${LASACR.classRegistration.accountId}/${currentYear}/${currentMonth - 1}'">
												<i class='fas fa-angle-double-left' style='font-size: 36px'></i>
											</button>
										</td>
										<td width="30%">
											<h3>${currentYear}년 ${currentMonth}월</h3>
										</td>
										<td width="35%" style="text-align: left;">
											<button type="button" class="btn btn-secondary"
												onclick="location.href='${pageContext.request.contextPath}/auth/teacher/lecture/${LASACR.lecture.lectureNo}/student/studentOne/${LASACR.classRegistration.accountId}/${currentYear}/${currentMonth + 1}'">
												<i class='fas fa-angle-double-right' style='font-size: 36px'></i>
											</button>
										</td>
									</tr>
								</table>
								
								<table class="table attendanceTable align-items-center table-flush">
									<thead class="thead-light">
										<tr>
											<th>날짜</th>
											<th>출결 여부</th>
											<th>비고 혹은 사유</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="at" items="${attendanceList}">
											<tr>
												<c:if test="${at.attendanceDay != null}">
													<td>${at.attendanceDay}</td>
												</c:if>
												<c:if test="${at.attendanceDay == null}">
													<td></td>
												</c:if>
	
												<c:if test="${at.attendanceState != null}">
													<td>${at.attendanceState}</td>
												</c:if>
												<c:if test="${at.attendanceState == null}">
													<td></td>
												</c:if>
	
												<c:if test="${at.attendanceRemark != null}">
													<td>${at.attendanceRemark}</td>
												</c:if>
												<c:if test="${at.attendanceRemark == null}">
													<td></td>
												</c:if>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
				
				<!-- Footer -->
				<jsp:include page="/WEB-INF/view/auth/include/footer.jsp"></jsp:include>
			</div>
		</div>
		<!--   Core   -->
		<script src="${pageContext.request.contextPath}/assets/js/plugins/jquery/dist/jquery.min.js"></script>
		<script
			src="${pageContext.request.contextPath}/assets/js/plugins/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
		<!--   Optional JS   -->
		<script src="${pageContext.request.contextPath}/assets/js/plugins/chart.js/dist/Chart.min.js"></script>
		<script src="${pageContext.request.contextPath}/assets/js/plugins/chart.js/dist/Chart.extension.js"></script>
		<!--   Argon JS   -->
		<script src="${pageContext.request.contextPath}/assets/js/argon-dashboard.min.js?v=1.1.2"></script>
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