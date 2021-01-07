<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>updateLecture</title>
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
			$(document).ready(function() {
				$('#updateBtn').click(function() {
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
					$('#updateLectureForm').submit();
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
								action="${pageContext.request.contextPath}/auth/manager/lecture/updateLecture/${lectureNo}"
								id="updateLectureForm">
								<div class="card-header bg-white border-0">
									<div class="row align-items-center">
										<br>
										<div class="col-8">
											<h3 class="mb-0">강좌 정보 수정</h3>
										</div>
										<div class="col-4 text-right">
											<button type="button" class="btn btn-sm btn-dark"
												onclick="location.href='${pageContext.request.contextPath}/auth/manager/lecture/lectureList/1'">목록</button>
											<button type="button" class="btn btn-sm btn-primary"
												id="updateBtn">수정</button>
										</div>
										<br>
									</div>
								</div>
	
								<div class="table-responsive">
									<table class="table align-items-center table-flush">
										<tr>
											<th width="20%">강좌 번호</th>
											<td width="80%"><input type="text" class="form-control" name="lectureNo"
												value="${lectureNo}" readonly="readonly"></td>
										</tr>
										<tr>
											<th>강사 계정</th>
											<td><select class="form-control" name="accountId">
													<c:forEach var="a" items="${accountList}">
														<c:if test="${a.accountId == lct.lecture.accountId}">
															<option value="${a.accountId}" selected="selected">${a.accountId}</option>
														</c:if>
														<c:if test="${a.accountId != lct.lecture.accountId}">
															<option value="${a.accountId}">${a.accountId}</option>
														</c:if>
													</c:forEach>
											</select></td>
										</tr>
										<tr>
											<th>과목</th>
											<td><select class="form-control" name="subjectNo">
													<c:forEach var="s" items="${subjectList}">
														<c:if test="${s.subjectNo == lct.lecture.subjectNo}">
															<option value="${s.subjectNo}" selected="selected">${s.subjectName}</option>
														</c:if>
														<c:if test="${s.subjectNo != lct.lecture.subjectNo}">
															<option value="${s.subjectNo}">${s.subjectName}</option>
														</c:if>
													</c:forEach>
											</select></td>
										</tr>
										<tr>
											<th>강사명</th>
											<td><input type="text" class="form-control" name="teacherName"
												id="teacherNametext" value="${lct.lecture.teacherName}"></td>
										</tr>
										<tr>
											<th>강좌명</th>
											<td><input type="text" class="form-control" name="lectureName"
												id="lectureNametext" value="${lct.lecture.lectureName}"></td>
										</tr>
										<tr>
											<th>교재</th>
											<td><select class="form-control" name="textbookIsbn">
													<c:forEach var="t" items="${textbookList}">
														<c:if test="${t.textbookIsbn == lct.textbook.textbookIsbn}">
															<option value="${t.textbookIsbn}" selected="selected">${t.textbookTitle}:${t.textbookIsbn}</option>
														</c:if>
														<c:if test="${t.textbookIsbn != lct.textbook.textbookIsbn}">
															<option value="${t.textbookIsbn}">${t.textbookTitle}:${t.textbookIsbn}</option>
														</c:if>
													</c:forEach>
											</select></td>
										</tr>
										<tr>
											<th>개강일</th>
											<td><input type="date" class="form-control" name="lectureStartdate"
												id="lectureStartdate" value="${lct.lecture.lectureStartdate}">
											</td>
										</tr>
										<tr>
											<th>종강일</th>
											<td><input type="date" class="form-control" name="lectureEnddate"
												id="lectureEnddate" value="${lct.lecture.lectureEnddate}">
											</td>
										</tr>
										<tr>
											<th>정원</th>
											<td><input type="number" class="form-control" name="lectureTotal"
												id="lectureTotaltext" value="${lct.lecture.lectureTotal}"></td>
										</tr>
										<tr>
											<th>강의실</th>
											<td><select class="form-control" name="classroomNo">
													<c:forEach var="c" items="${classroomList}">
														<c:if test="${c.classroomNo == lct.lecture.classroomNo}">
															<option value="${c.classroomNo}" selected="selected">${c.classroomNumber}</option>
														</c:if>
														<c:if test="${c.classroomNo != lct.lecture.classroomNo}">
															<option value="${c.classroomNo}">${c.classroomNumber}</option>
														</c:if>
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