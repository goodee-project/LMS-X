<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		
		<title>updateReportSubmit</title>
		
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
		
		<!-- jQuery를 이용하여 유효성 검사 -->
		<script>
			$(document).ready(function() {	// 문서가 로드되면 이 스크립트를 제일 마지막에 실행해주세요
				$('lectureArchiveTitle').focus();	// 시작 시 폼 커서를 lectureArchiveTitle쪽으로 이동
				
				// 버튼 클릭시 폼 내용의 유효성 검사를 수행
				$("#submitBtn").click(function() {
					if ($("#reportSubmitPoint").val() == "") {		// reportSubmitPoint이 공백인 경우 수행
						$("#reportSubmitPointMsg").html('');		// 메시지 초기화
						$('#reportSubmitPointMsg').append('<div style="margin-top: 10px;">점수를 입력하세요<div>');
						$('#reportSubmitPoint').focus();
					
						return;
					} else {
						$("#reportSubmitPointMsg").text('');		// 메시지 초기화
					}

					if ($("#reportSubmitFeedback").val() == "") { 	// reportSubmitFeedback가 공백인 경우 수행
						$("#reportSubmitFeedbackMsg").html('');		// 메시지 초기화
						$('#reportSubmitFeedbackMsg').append('<div style="margin-top: 10px;">내용을 입력하세요<div>');
						$('#reportSubmitFeedback').focus();
					
						return;
					} else {
						$("#reportSubmitFeedbackMsg").html('');		// 메시지 초기화
					}

					$('#reportSubmitForm').submit();
				});
			});
		</script>
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
							<form method="post" action="${pageContext.request.contextPath}/auth/teacher/lecture/${lectureNo}/report/reportOne/${reportNo}/updateReportSubmit/${reportSubmitNo}" id="reportSubmitForm">
								<div class="card-header bg-white border-0">
									<div class="row align-items-center">
										<br>
										<div class="col-8">
											<h3 class="mb-0">과제 평가 수정</h3>
										</div>
										<div class="col-4 text-right">
												<button type="button" class="btn btn-sm btn-dark" onclick="location.href='${pageContext.request.contextPath}/auth/teacher/lecture/${lectureNo}/report/reportOne/${reportNo}/reportSubmitOne/${reportSubmitNo}'">목록</button>
												<button type="button" class="btn btn-sm btn-primary" id="submitBtn">수정</button>
											</div>
										<br>
									</div>
								</div>
								<div class="table-responsive">
									<table class="table align-items-center table-flush">
										<tr>
											<th width="20%">점수</th>
											<td width="80%">
												<input type="number" class="form-control" name="reportSubmitPoint" id="reportSubmitPoint" value="${reportSubmit[0].reportSubmitPoint}">
												<div class="msgDiv" id="reportSubmitPointMsg"></div>
											</td>
										</tr>
										<tr>
											<th>평가 내용</th>
											<td>
												<input type="text" class="form-control" name="reportSubmitFeedback" id="reportSubmitFeedback" value="${reportSubmit[0].reportSubmitFeedback}">
												<div class="msgDiv" id="reportSubmitFeedbackMsg"></div>
											</td>
										</tr>
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