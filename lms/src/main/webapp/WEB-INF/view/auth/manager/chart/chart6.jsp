<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>chartIndex</title>
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
		
		<script>
			$(document).ready(function() {	
				// 차트 기본 정보 선언			
				let myChart ={
				    type: 'line',
				    data: {
				           labels:[],
				           datasets:[{
				              label:'최소 최대 점수',
				              backgroundColor: [],
				              borderColor: [],
				              data:[],
							  fill: 8
				           },{
				              label:'최소 최대 점수',
				              backgroundColor: [],
				              borderColor: [],
				              data:[],
							  fill: '+2'
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
					url:'${pageContext.request.contextPath}/auth/manager/chart/gradeBySubject',
					type:'get',
					success:function(data){
						console.log(data);
						
						$(data).each(function(key, value) {
							let ranColor1 = Math.floor(Math.random()*256);
							let ranColor2 = Math.floor(Math.random()*256);
							let ranColor3 = Math.floor(Math.random()*256);
							let ranColor4 = Math.floor(Math.random()*256);
							let ranColor5 = Math.floor(Math.random()*256);
							let ranColor6 = Math.floor(Math.random()*256);
							myChart.data.labels.push(value.lecture_name);
							myChart.data.datasets[0].data.push(value.min_score);
							myChart.data.datasets[0].backgroundColor.push("rgba(" + ranColor1 +  ", "+ ranColor2 + ", " + ranColor3 + ", 0.4)");
							myChart.data.datasets[0].borderColor.push("rgba(" + ranColor1 +  ", "+ ranColor2 + ", " + ranColor3 + ", 0.8)");

							myChart.data.datasets[1].data.push(value.max_score);
							myChart.data.datasets[1].backgroundColor.push("rgba(" + ranColor4 +  ", "+ ranColor5 + ", " + ranColor6 + ", 0.4)");
							myChart.data.datasets[1].borderColor.push("rgba(" + ranColor4 +  ", "+ ranColor5 + ", " + ranColor6 + ", 0.8)");							
						});
						
						var ctx = document.getElementById('chart-bars').getContext('2d');
						var chart = new Chart(ctx, myChart);
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
										<h3 class="mb-0">통계 2</h3>
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
												<h5 class="h3 mb-0">과목별 학생 성적</h5>
											</div>
											
											<div class="col-6 text-right">
												<div class="input-group">
													<select class="form-control" name="managerPosition">
														<c:if test="${manager.managerPosition == null}">
															<option value="" selected="selected">==전체==</option>
															<option value="사원">사원</option>
															<option value="대리">대리</option>
															<option value="팀장">팀장</option>
														</c:if>
														<c:if test="${manager.managerPosition == '사원'}">
															<option value="">==전체==</option>
															<option value="사원" selected="selected">사원</option>
															<option value="대리">대리</option>
															<option value="팀장">팀장</option>
														</c:if>
														<c:if test="${manager.managerPosition == '대리'}">
															<option value="">==전체==</option>
															<option value="사원">사원</option>
															<option value="대리" selected="selected">대리</option>
															<option value="팀장">팀장</option>
														</c:if>
														<c:if test="${manager.managerPosition == '팀장'}">
															<option value="" selected="selected">==전체==</option>
															<option value="사원">사원</option>
															<option value="대리">대리</option>
															<option value="팀장" selected="selected">팀장</option>
														</c:if>
													</select>
													
													<input type="text" class="form-control" name="managerName" placeholder="이름을 검색해주세요." value="${manager.managerName}">
													
													<div class="input-group-append">
														<button type="submit" class="btn btn-primary">검색</button>
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