<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<!-- Favicon -->
	<link
		href="${pageContext.request.contextPath}/assets/img/brand/favicon.png"
		rel="icon" type="image/png">
	
	<!-- Fonts -->
	<link
		href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700"
		rel="stylesheet">
	
	<!-- Icons -->
	<link
		href="${pageContext.request.contextPath}/assets/js/plugins/nucleo/css/nucleo.css"
		rel="stylesheet" />
	<link
		href="${pageContext.request.contextPath}/assets/js/plugins/@fortawesome/fontawesome-free/css/all.min.css"
		rel="stylesheet" />
	
	<!-- CSS Files -->
	<link
		href="${pageContext.request.contextPath}/assets/css/argon-dashboard.css?v=1.1.2"
		rel="stylesheet" />
	
	<!-- jQuery library -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	
	<!-- Bootstrap 4 Icons -->
	<link rel="stylesheet"
		href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
		integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
		crossorigin="anonymous">
	
	<!-- jQuery library -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

		<script>
			$(document).ready(function(){

				var myChart = {
						type: 'line',
						data: {
							labels: [],
							datasets: [{
								label:'최근 10일간 접속 트래픽',
								data: [],
								backgroundColor: [],
								borderColor: [],
								fill: false,
								borderDash: [7, 7],
								pointRadius: [6, 7, 8, 9, 10, 11, 12, 13,14,15,16,17],
								pointHoverRadius: 10,
								hoverBorderColor : []
							}]
						},
						options: {
							responsive: true,
							legend: {
								position: 'bottom',
							},
							hover: {
								mode: 'index'
							},
							scales: {
								xAxes: [{
									display: true,
									scaleLabel: {
										display: true,
										labelString: '접속일'
									}
								}],
								yAxes: [{
									display: true,
									scaleLabel: {
										display: true,
										labelString: '접속자 수'
									}
								}]
							}
						}
					};				
				$.ajax({
					url:'${pageContext.request.contextPath}/auth/manager/chart/latestLoginLog',
					type:'get',
					success:function(data){

						let ranColor1 = Math.floor(Math.random()*256);
						let ranColor2 = Math.floor(Math.random()*256);
						let ranColor3 = Math.floor(Math.random()*256);
						
						$(data).each(function(key, value) {
							myChart.data.labels.push(value.day);
							myChart.data.datasets[0].data.push(value.cnt);
							myChart.data.datasets[0].backgroundColor.push("rgba(" + ranColor1 +  ", "+ ranColor2 + ", " + ranColor3 + ", 0.3)");
							myChart.data.datasets[0].borderColor.push("rgba(" + ranColor1 +  ", "+ ranColor2 + ", " + ranColor3 + ", 0.8)");
							
						});
						
						var ctx = document.getElementById('chart').getContext('2d');
						var chart = new Chart(ctx, myChart);
					}
				});
				
			});
		</script>
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
		}
		</style>
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
									<br>
									<div class="col-8">
										<h3 class="mb-0">Index</h3>
									</div>
									<div class="col-4 text-right">										
									</div>
									<br>
								</div>
							</div>
	
							<div class="card-footer py-4">
								<!--* Card init *-->
								<div class="card">
								
								    <!-- Card header -->
								    <div class="card-header">
								    
										<!-- Title -->
										<h5 class="h3 mb-0">최근 10일간 접속 트래픽</h5>
								    </div>
									
									<!-- Card body -->
								    <div class="card-body">
										
										<div class="chart" id="chart-parent">
											<!-- Chart wrapper -->
										    <canvas id="chart" class="chart-canvas"></canvas>
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