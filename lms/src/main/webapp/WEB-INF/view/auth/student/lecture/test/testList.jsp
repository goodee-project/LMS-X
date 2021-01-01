<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>testList</title>
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
				// 첫 접근시 이미 평가를 완료했는지 체크
				$.ajax({
					url: '${pageContext.request.contextPath}/auth/student/lecture/test/selectCheckTestFinish/' + ${lectureNo},
					type:'post',
					success: function(data){
						// 미완료 평가인 경우
						if(!data){
							$('#totalScore').html('미평가');
							return;
						}
					}
				});			

				// 시험이 제출기간인지 체크
				$.ajax({
					url: '${pageContext.request.contextPath}/auth/student/lecture/test/selectCheckTestDate/' + ${lectureNo},
					type:'post',
					success: function(data){
						// 제출기간이 아닐경우
						if(!data){
							$('#testContent').html('${test.testContent}');
							return;
						}
					}
				});			
				
			})
		</script>
		
		<style>
			.table {
				text-align: center;
			}
			
			.table td {
				vertical-align: middle;
			}
			
			th {
				text-align: center;
			}
		</style>
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
	    	
	    	<!-- 접속자 -->
			<jsp:include page="/WEB-INF/view/auth/student/include/connector.jsp" />
   			<div class="container-fluid mt--7">
				<div class="card shadow">
					<div class="card-header border-0">
						<div class="row align-items-center">
							<div class="col">
								<h3 class="mb-0">평가</h3>
							</div>
						</div>
					</div>
					
					<div class="row align-items-center">
						<div class="col-12">
						    <!-- 평가 내용 -->
							<table class="table">	
								<thead class="thead-light">
									<tr>
										<th>내용</th>
										<th>출제일</th>
										<th>평가 시작일</th>
										<th>평가 종료일</th>
										<th>점수</th>
									</tr>
								</thead>
								<tr>
									<td id="testContent"><a href="${pageContext.request.contextPath}/auth/student/lecture/${lectureNo}/test/testOne/1">${test.testContent}</a></td>
									<td>${test.testCreatedate}</td>
									<td>${test.testStartdate}</td>
									<td>${test.testEnddate}</td>
									<td id="totalScore">				
										${test.totalScore}
									</td>
								</tr>	
							</table>	
						</div>
					</div>			
				</div>
				<!-- Footer -->
				<jsp:include page="/WEB-INF/view/auth/include/footer.jsp"></jsp:include>
			</div>		
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