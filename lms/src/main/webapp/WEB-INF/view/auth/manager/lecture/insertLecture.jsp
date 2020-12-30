<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insertLecture</title>
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
<script>
	$(document).ready(function() {
		$('#insertBtn').click(function() {
			if ($('#teacherNametext').val().length <= 0) {
				alert('강사명을 입력해주세요.');
				return;
			}
			if ($('#lectureNametext').val().length <= 0) {
				alert('강의명을 입력해주세요.');
				return;
			}
			if ($('#lectureEnddate').val() <= $('#lectureStartdate').val()) {
				alert('개강일은 종강일보다 빨라야 합니다.');
				return;
			}
			if ($('#lectureTotaltext').val() <= 0) {
				alert('0보다 커야합니다.');
				return;
			}
			if ($('#lectureTotaltext').val() > 24) {
				alert('25보다 작아야합니다.');
				return;
			}
			$('#insertLectureForm').submit();
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
						<form method="post"
							action="${pageContext.request.contextPath}/auth/manager/lecture/insertLecture"
							id="insertLectureForm">
							<div class="card-header bg-white border-0">
								<div class="row align-items-center">
									<br>
									<div class="col-8">
										<h3 class="mb-0">강좌 목록</h3>
									</div>
									<div class="col-4 text-right">
										<button type="button" class="btn btn-sm btn-dark"
											onclick="location.href='${pageContext.request.contextPath}/auth/manager/lecture/lectureList/1'">목록</button>
										<button type="button" class="btn btn-sm btn-success"
											id="insertBtn">개설</button>
									</div>
									<br>
								</div>
							</div>

							<div class="table-responsive">
								<table class="table align-items-center table-flush">
									<tr>
										<td>강사 계정</td>
										<td><select name="accountId">
												<c:forEach var="a" items="${accountList}">
													<option value="${a.accountId}">${a.accountId}</option>
												</c:forEach>
										</select></td>
									</tr>
									<tr>
										<td>과목</td>
										<td><select name="subjectNo">
												<c:forEach var="s" items="${subjectList}">
													<option value="${s.subjectNo}">${s.subjectName}</option>
												</c:forEach>
										</select></td>
									</tr>
									<tr>
										<td>강사 명</td>
										<td><input type="text" name="teacherName"
											id="teacherNametext" placeholder="강사 명을 입력해주세요."></td>
									</tr>
									<tr>
										<td>강의 명</td>
										<td><input type="text" name="lectureName"
											id="lectureNametext" placeholder="강의 명을 입력해주세요."></td>
									</tr>
									<tr>
										<td>교재</td>
										<td><select name="textbookIsbn">
												<c:forEach var="t" items="${textbookList}">
													<option value="${t.textbookIsbn}">${t.textbookTitle}:${t.textbookIsbn}</option>
												</c:forEach>
										</select></td>
									</tr>
									<tr>
										<td>개강일</td>
										<td><input type="date" name="lectureStartdate"
											id="lectureStartdate"></td>
									</tr>
									<tr>
										<td>종강일</td>
										<td><input type="date" name="lectureEnddate"
											id="lectureEnddate"></td>
									</tr>
									<tr>
										<td>정원</td>

										<td><input type="number" name="lectureTotal"
											id="lectureTotaltext"></td>
									</tr>
									<tr>
										<td>강의실</td>
										<td><select name="classroomNo">
												<c:forEach var="c" items="${classroomList}">
													<option value="${c.classroomNo}">${c.classroomNo}:${c.classroomNumber}</option>
												</c:forEach>
										</select></td>
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