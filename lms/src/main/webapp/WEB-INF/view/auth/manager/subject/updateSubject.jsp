<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>updateSubject</title>
		<link href="${pageContext.request.contextPath}/assets/img/brand/favicon.png" rel="icon" type="image/png">
		<!-- Fonts -->
		<link
			href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700"
			rel="stylesheet">
		<!-- Icons -->
		<link href="${pageContext.request.contextPath}/assets/js/plugins/nucleo/css/nucleo.css" rel="stylesheet" />
		<link
			href="${pageContext.request.contextPath}/assets/js/plugins/@fortawesome/fontawesome-free/css/all.min.css"
			rel="stylesheet" />
		<!-- CSS Files -->
		<link href="${pageContext.request.contextPath}/assets/css/argon-dashboard.css?v=1.1.2" rel="stylesheet" />
		<!-- jQuery / Ajax Google CDN -->
		<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<script>
			$(document).ready(function(){
				
				$('#subjectBtn').click(function(){
					
					if ($('#subjectTotalday').val() == "") {
						$('#subjectTotalday').focus();
						return;
					}
					if ($('#subjectInfo').val().replace(/(\s*)/g, "") == "") {
						$('#subjectInfo').focus();
						return;
					}
					$('#subjectForm').submit();
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
							<form id="subjectForm" method="post" action="${pageContext.request.contextPath}/auth/manager/subject/updateSubject">
								<div class="card-header bg-white border-0">
									<div class="row align-items-center">
										<br>
										<div class="col-8">
											<h3 class="mb-0">과목 수정</h3>
										</div>
										<div class="col-4 text-right">
											<button type="button" class="btn btn-sm btn-dark" onclick="location.href='${pageContext.request.contextPath}/auth/manager/subject/subjectList/1'">목록</button>
											<button type="button" id="subjectBtn" class="btn btn-sm btn-primary">수정</button>
										</div>
										<br>
									</div>
								</div>
							
								<div class="table-responsive">
									<table class="table align-items-center table-flush">
										<tr>
											<th width="20%">과목 번호</th>
											<th width="80%"><input type="text" name="subjectNo" class="form-control" readonly="readonly" value="${subject.subjectNo}" readonly="readonly"></td>
										</tr>
										<tr>
											<th>과목 이름</th>
											<td><input type="text" name="subjectName" class="form-control" value="${subject.subjectName}" readonly="readonly"></td>
										</tr>
										<tr>
											<th>과목 총 일수</th>
											<td><input type="number" id ="subjectTotalday" name="subjectTotalday" class="form-control" value="${subject.subjectTotalday}"></td>
										</tr>
										<tr>
											<th>과목 정보</th>
											<td><input  type="text" id="subjectInfo" name="subjectInfo" class="form-control" value="${subject.subjectInfo}"></td>
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
	</body>
</html>