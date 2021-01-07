<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>lectureOne</title>
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
		$('#studnetAccessBtn').on('click', function(){
			let paramId = $(this).val();
			$.ajax({
				url: '${pageContext.request.contextPath}/auth/manager/lecture/${lectureNo}/isLectureTotalFull/${studentListCount}',
				type:'get',
				success: function(data){
					if(!data) {
						alert('이미 정원이 초과되었습니다.');
						return;
					}
					else {
						$(location).attr('href', '${pageContext.request.contextPath}/auth/manager/lecture/' + ${lectureNo} + '/updateStudentClassState/' + paramId + '/수강중')
					}
				}
			});
		})
	})
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
								<br>
								<div class="col-8">
									<h3 class="mb-0">강좌 정보 조회</h3>
								</div>
								<div class="col-4 text-right">
									<button type="button" class="btn btn-sm btn-dark" onclick="location.href='${pageContext.request.contextPath}/auth/manager/lecture/lectureOne/${lectureNo}'">이전</button>
								</div>
								<br>
							</div>
						</div>

					</div>
				</div>
			</div>
			<div class="row mt-4">
				<div class="col-5">
					<div class="card shadow">
						<div class="card-header bg-white border-0">
							<h3 class="mb-0">수강 승인된 학생 : ${studentListCount}</h3>
							<div class="table-responsive" style="height:500px; overflow: auto; width: 100%; max-height: 500px;">
								<table class="table align-items-center table-flush">
									<thead class="thead-light">
										<tr>
											<th>ID</th>
											<th>상태</th>
											<th>승인 날짜</th>
										</tr>
									</thead>
									<c:forEach var="sl" items="${studentList}">
										<tr>
											<td>${sl.accountId}</td>
											<td>${sl.classRegistrationState}</td>
											<td>${sl.classRegistrationUpdatedate}</td>
										</tr>
									</c:forEach>
								</table>
							</div>
						</div>
					</div>
				</div>
				<div class="col-7">
					<div class="card shadow">
						<div class="card-header bg-white border-0">
							<h3 class="mb-0">수강 대기중인 학생 : ${studentListByStateCount}</h3>
							<div class="table-responsive" style="height:500px; overflow: auto; width: 100%; max-height: 500px;">
								<table class="table align-items-center table-flush">
									<thead class="thead-light">
										<tr>
											<th width="20%">ID</th>
											<th width="15%">상태</th>
											<th>신청 날짜</th>
											<th width="15%">승인</th>
											<th width="15%">거절</th>
										</tr>
									</thead>
									<c:forEach var="sls" items="${studentListByState}">
										<tr>
											<td>${sls.accountId}</td>
											<td>${sls.classRegistrationState}</td>
											<td>${sls.classRegistrationUpdatedate}</td>
											<td>
												<button value="${sls.accountId}" style="color:white" id="studnetAccessBtn" class="btn btn-primary btn-sm">승인</button>
											</td>
											<td>
												<a href="${pageContext.request.contextPath}/auth/manager/lecture/${lectureNo}/updateStudentClassState/${sls.accountId}/취소" class="btn btn-danger btn-sm">거절</a>
											</td>
										</tr>
									</c:forEach>
								</table>
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