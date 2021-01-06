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
			$(document).ready(function() {
				// 강좌 선택시
				$('#lectureList').change(function() {
					// 과제 생성
					createReportList();
				})
				// 과제 선택시
				$('#reportList').change(function() {
					// 차트 생성
					showChart();					
				});

				// 과제 목록 생성 함수
				function createReportList(){
					$.ajax({
						url:'${pageContext.request.contextPath}/auth/manager/chart/reportListByLectureNo/' + $('#lectureList option:selected').val(),
						type:'get',
						success:function(data){
							console.log(data);
							// 과제가 없을시
							if(data == ''){
								$('#chart-parent').empty();
								$('#reportList').empty();
								$('#chart-parent').html('과제가 없습니다.');
								return;
							}
							$('#reportList').empty();
							
							$(data).each(function(key, value) {
								$('#reportList').append('<option value="' + value.reportNo + '">' + value.reportTitle + "</option>");
							});
							
							// 차트 생성
							showChart();
						}
					});
				}
				// 차트 생성 함수
				function showChart() {
					// 차트 기본 정보 선언			
					let myChart = {
					    type: 'bar',
					    data: {
					           labels:[],
					           datasets:[{
					              label:'점수',
					              backgroundColor: [],
					              borderColor: [],
					              data:[]
								}]
						},
					    options: {
					        scales: {
					            yAxes: [{
					                ticks: {
					                    beginAtZero: true
					                }
					            }]
					        }
					    }
					};
	
					// 데이터 가져와서 차트에 넣기
					$.ajax({
						url:'${pageContext.request.contextPath}/auth/manager/chart/attendanceCountByLecture/' + $('#lectureList option:selected').val() + '/' +  $('#reportList option:selected').val(),
						type:'get',
						success:function(data){
							console.log(data);
							$('#chart-parent').empty();
							$('#chart-parent').append('<canvas id="chart-bars" class="chart-canvas"></canvas>');
							
							$(data).each(function(key, value) {
								let ranColor1 = Math.floor(Math.random()*256);
								let ranColor2 = Math.floor(Math.random()*256);
								let ranColor3 = Math.floor(Math.random()*256);
								myChart.data.labels.push(value.account_id);
								myChart.data.datasets[0].data.push(value.point);
								myChart.data.datasets[0].backgroundColor.push("rgba(" + ranColor1 +  ", "+ ranColor2 + ", " + ranColor3 + ", 0.4)");
								myChart.data.datasets[0].borderColor.push("rgba(" + ranColor1 +  ", "+ ranColor2 + ", " + ranColor3 + ", 0.8)");
							});
							
							var ctx = document.getElementById('chart-bars').getContext('2d');
							var chart = new Chart(ctx, myChart);
						}
					});
				}

				// 처음 접근시 과제 목록과 차트 생성
				createReportList();
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
												<div class="input-group input-group-alternative">
													<div class="input-group-prepend">
														<span class="input-group-text">강좌</span>
													</div>
													<select class="form-control" name="lectureList" id="lectureList">
														<c:forEach var="l" items="${lectureList}">
															<option value="${l.lectureNo}">${l.lectureName}</option>
														</c:forEach>
													</select>
													
													<div class="input-group-prepend">
														<span class="input-group-text">과제번호</span>
													</div>
													<select class="form-control" name="reportList" id="reportList">
													</select>
												</div>
											</div>
										</div>
								    </div>
								    
								    <!-- Card body -->
								    <div class="card-body">
										
										<div class="chart" id="chart-parent"></div>
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