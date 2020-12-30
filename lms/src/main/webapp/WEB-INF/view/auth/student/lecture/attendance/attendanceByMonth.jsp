<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>attendanceByMonth</title>
		<!-- Favicon -->
		<link href="${pageContext.request.contextPath}/assets/img/brand/favicon.png" rel="icon" type="image/png">
		<!-- Fonts -->
		<link
			href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700"
			rel="stylesheet">
		<!-- Icons -->
		<link href="${pageContext.request.contextPath}/assets/js/plugins/nucleo/css/nucleo.css" rel="stylesheet" />
		<link href="${pageContext.request.contextPath}/assets/js/plugins/@fortawesome/fontawesome-free/css/all.min.css" rel="stylesheet" />
		<!-- CSS Files -->
		<link href="${pageContext.request.contextPath}/assets/css/argon-dashboard.css?v=1.1.2" rel="stylesheet" />
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<script>
			$(document).ready(function(){
				for(let i = 1; i <= ${lastDay+(firstDayOfWeek-1)}; i++){
					if(i%7 == 1){
						$('#day' + i).css('color', '#FF0000');
					}else if(i%7 == 0){
						$('#day' + i).css('color', '#0000FF');
					}
				}
			});
		
		</script>
	</head>
	<body class="">
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
								<h3 class="mb-0">출석 현황</h3>
							</div>
						</div>
					</div>
					<div class="row align-items-center">
						<div class="col-12">
						<!-- 본문 -->						
						<div style="width:300px; margin:0 auto">
							<table class="table">
								<tr>
									<td width="50">
										<h2>
											<a href="${pageContext.request.contextPath}/auth/student/lecture/${lectureNo}/attendance/attendanceByMonth/${currentYear}/${currentMonth-1}">
												<i class='fas fa-angle-double-left' style='font-size:24px'></i>
											</a>
										</h2>
									</td>
									<td width="200" style="text-align:center"><h2>&nbsp; ${currentYear}년 ${currentMonth} 월 &nbsp;</h2></td>
									<td width="50">
										<h2>
											<a href="${pageContext.request.contextPath}/auth/student/lecture/${lectureNo}/attendance/attendanceByMonth/${currentYear}/${currentMonth+1}">
												<i class='fas fa-angle-double-right' style='font-size:24px'></i>
											</a>
										</h2>
									</td>
									
								</tr>
							</table>
						</div>
						<div>
							<table class="table">
								<thead class="thead-light">
									<tr>
										<th style="color:#FF0000">일</th>
										<th>월</th>
										<th>화</th>
										<th>수</th>
										<th>목</th>
										<th>금</th>
										<th style="color:#0000FF">토</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<c:forEach var="i" begin="1" end="${lastDay+(firstDayOfWeek-1)}" step="1">
											<c:if test="${i-(firstDayOfWeek-1) < 1}">
												<td>&nbsp;</td>
											</c:if>						
															
											<c:if test="${i-(firstDayOfWeek-1) > 0}">
												<td style="width:14%;">
													<div>
														<p id="day${i}">${i-(firstDayOfWeek-1)}</p>
													</div>
													<c:forEach var="a" items="${attendanceList}">
														<c:if test="${(i-(firstDayOfWeek-1)) == (fn:substring(a.attendanceDay,8,10))}">
															${a.attendanceState} 
															<c:if test="${!empty a.attendanceRemark}">
																: ${a.attendanceRemark}
															</c:if>
														</c:if>									
													</c:forEach>
												</td>
											</c:if>
											<c:if test="${i%7 == 0}">
												</tr><tr>
											</c:if>
										</c:forEach>
										
										<c:if test="${(lastDay+(firstDayOfWeek-1)) % 7 != 0}">
											<c:forEach begin="1" end="${7- ((lastDay+(firstDayOfWeek-1)) % 7)}" step="1">
												<td>&nbsp;</td>
											</c:forEach>
										</c:if>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			<!-- Footer -->
			<jsp:include page="/WEB-INF/view/auth/include/footer.jsp"></jsp:include> 		
		</div>
		<!--   Core   -->
		<script src="${pageContext.request.contextPath}/assets/js/plugins/jquery/dist/jquery.min.js"></script>
		<script src="${pageContext.request.contextPath}/assets/js/plugins/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
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
</html>