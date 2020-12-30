<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		
		<title>attendanceCalendarByDay</title>
		
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
			.sunday a {
	            color: #FF0000;
	         }
	         .saturday a {
	            color: #0000FF;
	         }
	         .weekday a {
	            color: #000000;
	         }
	         
	         .sunday {
	            color: #FF0000;
	         }
	         .saturday {
	            color: #0000FF;
	         }
	         .weekday {
	            color: #000000;
	         }
	         
	         .attendanceTableMenu {
	            width: 100%;
	            text-align: center;
	         }
	         
	         .attendanceTableMenu td {
	            vertical-align: middle;
	         }
	         
	         th {
	            width: ${100/7}%;
	            text-align: center;
	            background-color: #F9F9FB;
	         }
	         td {
	            height: 120px;
	            vertical-align: top;
	         }
	         .attendanceTable td {
	            height: 130px;
	            vertical-align: top;
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
			
			<!-- 접속자 -->
			<jsp:include page="/WEB-INF/view/auth/teacher/include/connector.jsp" />
			
			<!-- Page content -->
			<div class="container-fluid mt--7">
				<!-- Table -->
				<div class="row">
					<div class="col">
						<div class="card shadow">
							<div class="card-header bg-white border-0">
								<div class="row align-items-center">
									<br>
									<div class="col-8">
										<h3 class="mb-0">월별 출석부</h3>
									</div>
									<div class="col-4 text-right">
										<div style="float: right;">
										</div>
									</div>
								</div>
							</div>
							<div class="table-responsive">
								<!-- 날짜 출력 및 이동 -->
					            <table class="attendanceTableMenu">
					               <tr>
					                  <td width="35%" style="text-align: right;">
					                     <button type="button" class="btn btn-secondary" onclick="location.href='${pageContext.request.contextPath}/auth/teacher/lecture/${lectureNo}/attendance/attendanceCalendarByMonth/${currentYear}/${currentMonth - 1}'">
					                        <i class='fas fa-angle-double-left' style='font-size:36px'></i>
					                     </button>
					                  </td>
					                  <td width="30%">
					                     <h3>${currentYear}년 ${currentMonth}월</h3>
					                  </td>
					                  <td width="35%" style="text-align: left;">
					                     <button type="button" class="btn btn-secondary" onclick="location.href='${pageContext.request.contextPath}/auth/teacher/lecture/${lectureNo}/attendance/attendanceCalendarByMonth/${currentYear}/${currentMonth + 1}'">
					                        <i class='fas fa-angle-double-right' style='font-size:36px'></i>
					                     </button>
					                  </td>
					               </tr>
					            </table>
								
								<button type="button" class="btn btn-sm btn-success" style="float: right;" onclick="location.href='${pageContext.request.contextPath}/auth/teacher/lecture/${lectureNo}/attendance/attendanceToday'">오늘 날짜 이동</button>
								
								<br><br>
								
								<table class="table table-bordered attendanceTable">
									<thead>
										<tr>
											<th class="sunday">일</th>
					                        <th>월</th>
					                        <th>화</th>
					                        <th>수</th>
					                        <th>목</th>
					                        <th>금</th>
					                        <th class="saturday">토</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<c:forEach var="i" begin="1" end="${lastDay + (firstDayOfWeek - 1)}" step="1">
												<c:if test="${i - (firstDayOfWeek - 1) < 1}">
													<td>&nbsp;</td>
												</c:if>
												
												<c:if test="${i - (firstDayOfWeek - 1) > 0}">
													<td>
														<!-- 일요일 -->
														<c:if test="${i % 7 == 1}">
															<div class="sunday">
																<a href="${pageContext.request.contextPath}/auth/teacher/lecture/${lectureNo}/attendance/attendanceCalendarByDay/default/${currentYear}/${currentMonth}/${i - (firstDayOfWeek - 1)}">${i - (firstDayOfWeek - 1)}</a>
															</div>
														</c:if>
					                                 
														<!-- 토요일 -->
														<c:if test="${i % 7 == 0}">
															<div class="saturday">
																<a href="${pageContext.request.contextPath}/auth/teacher/lecture/${lectureNo}/attendance/attendanceCalendarByDay/default/${currentYear}/${currentMonth}/${i - (firstDayOfWeek - 1)}">${i - (firstDayOfWeek - 1)}</a>
															</div>
														</c:if>
					                                 
														<!-- 평일 (월요일 ~ 금요일) -->
														<c:if test="${i % 7 != 1 && i % 7 != 0}">
															<div class="weekday">
																<a href="${pageContext.request.contextPath}/auth/teacher/lecture/${lectureNo}/attendance/attendanceCalendarByDay/default/${currentYear}/${currentMonth}/${i - (firstDayOfWeek - 1)}">${i - (firstDayOfWeek - 1)}</a>
															</div>
														</c:if>
													</td>
												</c:if>
					                           
												<c:if test="${i != (lastDay + (firstDayOfWeek - 1))}">
													<c:if test="${i % 7 == 0}">
														</tr><tr>
													</c:if>
												</c:if>
											</c:forEach>
					                        
					                        <c:if test="${(lastDay + (firstDayOfWeek - 1)) % 7 != 0}">   
												<c:forEach begin="1" end="${7 - ((lastDay + (firstDayOfWeek - 1)) % 7)}" step="1">   
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