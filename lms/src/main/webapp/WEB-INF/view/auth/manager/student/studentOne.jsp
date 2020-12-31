<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>studentOne</title>
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
			<div class="container-fluid mt--7">
				<div class="row">
					<div class="col">
						<div class="card shadow">
							<div class="card-header bg-white border-0">
								<div class="row align-items-center">
									<div class="col-8">
										<h3 class="mb-0">강사 승인대기 목록</h3>
									</div>
										<div class="col-4 text-right">
											<a class="btn btn-sm btn-dark" href="${pageContext.request.contextPath}/auth/manager/student/studentList/1">목록</a>
										</div>
									</div>
								</div>
							<div class="table-responsive">
								<table class="table align-items-center table-flush">
									<tr>
										<td width="10%">학생 ID</td>
										<td width="40%">${student.studentId}</td>
										<td>학생 Email</td>
										<td>${student.studentEmail}</td>
									</tr>
									<tr>
										<td>학생 이름</td>
										<td>${student.studentName}</td>
										<td>학생 전화번호</td>
										<td>${student.studentPhone}</td>
									</tr>
									<tr>
										<td>학생 성별</td>
										<td>${student.studentGender}</td>
										<td>학생 생일</td>
										<td>${student.studentBirth}</td>
									</tr>
									<tr>
										<td>학생 주소</td>
										<td>${student.studentAddressMain}</td>
									</tr>
									<tr>
										<td>학생 상세주소</td>
										<td>${student.studentAddressSub}</td>
										<td>학생 이미지</td>
										<td></td>
									</tr>
									<tr>
										<td>학생정보 등록날짜</td>
										<td>${student.studentAccessdate}</td>
										<td>학생정보 수정날짜</td>
										<td>${student.studentUpdatedate}</td>
									</tr>
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