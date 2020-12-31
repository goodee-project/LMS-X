<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		
		<title>insertMultiplechoice</title>
		
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
			$(document).ready(function(){
				$('#insertMultiplechoiceExampleBtn').click(function(){
					let submitCk = true;
					$('.multiplechoiceExampleContent').each(function(index, item){
						if($(item).val().length < 1 && submitCk){
							alert('보기 내용을 작성해주세요.');
							submitCk = false;
							return;
						} 
					})
					
					if(submitCk){	
						$('#insertMultiplechoiceExampleForm').submit();
					}
					
				})
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
							<form id="insertMultiplechoiceExampleForm" action="${pageContext.request.contextPath}/auth/teacher/lecture/${lectureNo}/test/insertMultiplechoice" method="post">
								<div class="card-header bg-white border-0">
									<div class="row align-items-center">
										<div class="col-8">
											<h3 class="mb-0">문제 - 보기 관리</h3>
										</div>
										<div class="col-4 text-right">
											<button type="button" id="insertMultiplechoiceExampleBtn" class="btn btn-primary">저장</button>									
											<button type="button" class="btn btn-dark" onclick="location.href='${pageContext.request.contextPath}/auth/teacher/lecture/${lectureNo}/test/multiplechoiceList/1'">목록</button>
										</div>
									</div>
								</div>
								
								<div class="table-responsive">
										<table class="table align-items-center table-flush">
											<thead class="thead-light">
												<tr>
													<th></th>
													<th width="50%" style="text-align:left">문제<input type="text" name="multiplechoiceQuestion" class="form-control"></th>
													<th style="text-align:left">
														정답
														<select class="form-control" name="multiplechoiceAnswer">
															<option value="1">1</option>
															<option value="2">2</option>
															<option value="3">3</option>	
															<option value="4">4</option>
															<option value="5">5</option>
														</select>
													</th>
													<th style="text-align:left">점수<input type="text" name="multiplechoiceScore" class="form-control"></th>
												</tr>
											</thead>
											<c:forEach var="i" begin="1" end="5">
												<tr>
													<td><input type="hidden" name="multiplechoiceExampleId" class="form-control multiplechoiceExampleId" value="${i}">${i}</td>
													<td colspan="3"><input type="text" name="multiplechoiceExampleContent" class="form-control multiplechoiceExampleContent"></td>
													
												</tr>
											</c:forEach>
										</table>
								</div>
							</form>
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