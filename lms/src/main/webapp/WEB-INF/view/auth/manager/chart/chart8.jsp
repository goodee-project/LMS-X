<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>chart8</title>
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

		<!-- Chart -->
		<script>
			$('#search').click(function() {
				console.log('Hi');
				$.ajax({
				     url:'${pageContext.request.contextPath}/auth/manager/chart/attendanceCountByLecture/' + $('#lectureNo').val() + '/' + ('#reportNo').val(),
				     type:'GET',
				     success: function(data) {
				        var ctx = document.getElementById('totalInOfMonthByYearChartResult').getContext('2d');
				        var chart = new Chart(ctx, {
				           // The type of chart we want to create
				            type: 'bar',
				
				            // The data for our dataset
				            data: {
				               // 배열 형태로 작성
				                labels: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
				                datasets: [{
				                    label: getParam("year")+'년 월별 수입 내역 차트',
				                    backgroundColor: [
				                       	'rgba(255, 99, 132, 0.2)',
				                        'rgba(54, 162, 235, 0.2)',
				                        'rgba(255, 206, 86, 0.2)',
				                        'rgba(75, 192, 192, 0.2)',
				                        'rgba(153, 102, 255, 0.2)',
				                        'rgba(255, 159, 64, 0.2)', 
				                        'rgba(255, 99, 132, 0.2)',
				                        'rgba(54, 162, 235, 0.2)',
				                        'rgba(255, 206, 86, 0.2)',
				                        'rgba(75, 192, 192, 0.2)',
				                        'rgba(153, 102, 255, 0.2)',
				                        'rgba(255, 159, 64, 0.2)'
				                    ],
				                    borderColor: [
				                       	'rgba(255, 99, 132, 1)',
				                        'rgba(54, 162, 235, 1)',
				                        'rgba(255, 206, 86, 1)',
				                        'rgba(75, 192, 192, 1)',
				                        'rgba(153, 102, 255, 1)',
				                        'rgba(255, 159, 64, 1)',
				                        'rgba(255, 99, 132, 1)',
				                        'rgba(54, 162, 235, 1)',
				                        'rgba(255, 206, 86, 1)',
				                        'rgba(75, 192, 192, 1)',
				                        'rgba(153, 102, 255, 1)',
				                        'rgba(255, 159, 64, 1)'
				                    ],
				                    data:[data.january, data.february, data.march, data.april, data.may, data.june, 
				                         data.july, data.august, data.september, data.october, data.november, data.december],
				                    borderWidth: 1
				                }]
				            },
				
				            // Configuration options go here
				        	options: {}
						});
					}
				});
			});
		</script>
	</head>
	<body>
		<!-- 내비게이션 메인 메뉴 -->
		<jsp:include page="/WEB-INF/view/auth/manager/include/menu.jsp" />
		<div class="main-content">
			<!-- 내비게이션 상단 메뉴 -->
			<div class="container-fluid">
				<jsp:include page="/WEB-INF/view/auth/manager/include/topMenu.jsp" />
			</div>
	
			<!-- 접속자 -->
			<jsp:include page="/WEB-INF/view/auth/manager/include/connector.jsp" />
	
			<!-- Page content -->
			<div class="container-fluid mt--7">
				<!-- Table -->
				<div class="row">
					<div class="col">
						<div class="card shadow">
							<div class="card-header bg-white border-0">
								<div class="row align-items-center">
									<div class="col-8">
										<h3 class="mb-0">학생별 과제 점수</h3>
									</div>
									<div class="col-4 text-right">
										<a class="btn btn-sm btn-dark" href="${pageContext.request.contextPath}/auth/manager/chart/chartIndex">목록</a>
									</div>
								</div>
							</div>
							
							<div class="card-footer py-4">
								<!--* Card init *-->
								<div class="card">
								
								    <!-- Card header -->
								    <div class="card-header">
										<div class="row align-items-center">
											<div class="col-6">
												<!-- Title -->
												<h5 class="h3 mb-0">학생별 과제 점수</h5>
											</div>
											
											<div class="col-6 text-right">
												<div class="input-group">
													<div class="input-group-prepend">
														<span class="input-group-text">강좌</span>
													</div>
													<input type="text" class="form-control" name="lectureNo" id="lectureNo" placeholder="강좌 고유 번호" value="${lectureNo}">
													
													<div class="input-group-prepend">
														<span class="input-group-text">과제번호</span>
													</div>
													<input type="text" class="form-control" name="reportNo" id="reportNo" placeholder="과제 고유 번호" value="${reportNo}">
													
													<div class="input-group-append">
														<button type="button" class="btn btn-primary" id="search">검색</button>
													</div>
												</div>
											</div>
										</div>
								    </div>
								    
								    <!-- Card body -->
								    <div class="card-body">
	
										<div class="chart">
										    <!-- Chart wrapper -->
										    <canvas id="chart-bars" class="chart-canvas"></canvas>
										</div>
								    </div>
								</div>
							</div>
						</div>
					</div>
				</div>
				
				<!-- Footer -->
				<jsp:include page="/WEB-INF/view/auth/include/footer.jsp"></jsp:include>
			</div>
		</div>
		<!--   Core   -->
		<script
			src="${pageContext.request.contextPath}/assets/js/plugins/jquery/dist/jquery.min.js"></script>
		<script
			src="${pageContext.request.contextPath}/assets/js/plugins/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
		<!--   Optional JS   -->
		<script
			src="${pageContext.request.contextPath}/assets/js/plugins/chart.js/dist/Chart.min.js"></script>
		<script
			src="${pageContext.request.contextPath}/assets/js/plugins/chart.js/dist/Chart.extension.js"></script>
		<!--   Argon JS   -->
		<script
			src="${pageContext.request.contextPath}/assets/js/argon-dashboard.min.js?v=1.1.2"></script>
		<script src="https://cdn.trackjs.com/agent/v3/latest/t.js"></script>
		<script>
			window.TrackJS && TrackJS.install({
				token : "ee6fab19c5a04ac1a32a645abde4613a",
				application : "argon-dashboard-free"
			});
		</script>
	</body>
</html>