<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
									<button type="button" class="btn btn-sm btn-dark"
										onclick="location.href='${pageContext.request.contextPath}/auth/manager/lecture/lectureList/1'">목록</button>
									<button type="button" class="btn btn-sm btn-primary"
										onclick="location.href='${pageContext.request.contextPath}/auth/manager/lecture/updateLecture/${lectureNo}'">수정</button>
									<button type="button" class="btn btn-sm btn-info"
										onclick="location.href='${pageContext.request.contextPath}/auth/manager/lecture/${lectureNo}/archive/archiveList/1'">자료실</button>
									<button type="button" class="btn btn-sm btn-info"
										onclick="location.href='${pageContext.request.contextPath}/auth/manager/lecture/${lectureNo}/question/questionList/1'">질문 게시판</button>
									<button type="button" class="btn btn-sm btn-danger"
										onclick="location.href='${pageContext.request.contextPath}/auth/manager/lecture/${lectureNo}/studentManagement'">수강 학생 관리</button>
								</div>
								<br>
							</div>
						</div>

						<div class="table-responsive">
							<table class="table align-items-center table-flush">
								<tr>
									<th width="20%">강좌 번호</th>
									<td width="80%">${lectureNo}</td>
								</tr>
								<tr>
									<th>강사명</th>
									<td>${lct.lecture.teacherName}</td>
								</tr>
								<tr>
									<th>강의명</th>
									<td>${lct.lecture.lectureName}</td>
								</tr>
								<tr>
									<th>교재</th>
									<td>${lct.textbook.textbookTitle}</td>
								</tr>
								<tr>
									<th>강의실</th>
									<td>${lct.classroom.classroomNumber}호</td>
								</tr>
								<tr>
									<th>개강일</th>
									<td>${lct.lecture.lectureStartdate}</td>
								</tr>
								<tr>
									<th>종강일</th>
									<td>${lct.lecture.lectureEnddate}</td>
								</tr>
								<tr>
									<th>정원</th>
									<td>${lct.lecture.lectureTotal}</td>
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