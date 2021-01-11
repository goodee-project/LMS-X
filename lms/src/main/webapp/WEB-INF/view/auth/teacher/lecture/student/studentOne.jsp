<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		
		<title>studentOne</title>
		
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
		
		<style>
			.attendanceTable {
				text-align: center;
			}
			
			.attendanceTable td {
				vertical-align: middle;
			}
			
			.attendanceTable th {
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
				<div class="row">
					<div class="col-xl-4 order-xl-2 mb-5 mb-xl-0">
						<div class="card card-profile shadow">
							<div class="row justify-content-center">
								<div class="col-lg-3 order-lg-2">
									<div class="card-profile-image">
										<img id="img" style="width: 200px; height: 200px;" src="${pageContext.request.contextPath}/resource/mypageImage/${studentImage}">
									</div>
								</div>
							</div>
							<div class="card-body pt-0 pt-md-4" style="margin-top: 50px;">
								<div class="row">
									<div class="col">
										<div class="card-profile-stats justify-content-center mt-md-5 ">
										</div>
									</div>
								</div>
								<div class="text-center">
									<h3>
										${LASACR.classRegistration.accountId}<span class="font-weight-light">,	${LASACR.student.studentGender}</span>
									</h3>
									<div class="h5 font-weight-300">
										<i class="ni location_pin mr-2"></i>${LASACR.student.studentEmail}
									</div>
									<div class="h5 font-weight-300">
										<i class="ni location_pin mr-2"></i>${LASACR.student.studentPhone}
									</div>
									<div class="h5 mt-4">
										<i class="ni business_briefcase-24 mr-2"></i>${LASACR.student.studentAddressMain}
									</div>
									<div>
										<i class="ni education_hat mr-2"></i>${LASACR.student.studentAddressSub}
									</div>
									<hr class="my-4" />
								</div>
							</div>
						</div>
					</div>
					<div class="col-xl-8 order-xl-1">
						<div class="card bg-secondary shadow">
							<div class="card-header bg-white border-0">
								<div class="row align-items-center">
									<div class="col-8">
										<h3 class="mb-0">학생 상세보기</h3>
									</div>
									<div class="col-4 text-right">
										<a class="btn btn-sm btn-dark" href="${pageContext.request.contextPath}/auth/teacher/lecture/${lectureNo}/student/studentList/1">목록</a>
									</div>
								</div>
							</div>
							<div class="card-body">
								<div class="row align-items-center mb-4">
									<br>
									<div class="col-8">
										<h6 class="heading-small text-muted">개인정보</h6>
									</div>
								</div>
								<div class="pl-lg-4">
									<div class="row">
										<div class="col-lg-6">
											<div class="form-group">
												<label class="form-control-label" >아이디</label>
												<input type="text" class="form-control form-control-alternative" style="background-color: white;" value="${LASACR.classRegistration.accountId}" disabled="disabled">
											</div>
										</div>
										<div class="col-lg-6">
											<div class="form-group">
												<label class="form-control-label" >생년월일</label>
												<input type="text" class="form-control form-control-alternative" style="background-color: white;" value="${LASACR.student.studentBirth}" disabled="disabled">
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-lg-6">
											<div class="form-group">
												<label class="form-control-label" >이름</label>
												<input type="text" class="form-control form-control-alternative" style="background-color: white;" value="${LASACR.student.studentName}" disabled="disabled">
											</div>
										</div>
										<div class="col-lg-6">
											<div class="form-group">
												<label class="form-control-label" >성별</label>
												<input type="text" class="form-control form-control-alternative" style="background-color: white;" value="${LASACR.student.studentGender}" disabled="disabled">
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-lg-6">
											<div class="form-group">
												<label class="form-control-label" >이메일</label>
												<input type="text" class="form-control form-control-alternative" style="background-color: white;" value="${LASACR.student.studentEmail}" disabled="disabled">
											</div>
										</div>
										<div class="col-lg-6">
											<div class="form-group">
												<label class="form-control-label" >전화번호</label>
												<input type="text" class="form-control form-control-alternative" style="background-color: white;" value="${LASACR.student.studentPhone}" disabled="disabled">
											</div>
										</div>
									</div>
									
									<div class="row">
										<div class="col-lg-12">
											<div class="form-group">
												<label class="form-control-label" >주소</label>
												<input type="text" class="form-control form-control-alternative" style="background-color: white;" value="${LASACR.student.studentAddressMain} ${LASACR.student.studentAddressSub}" disabled="disabled">
											</div>
										</div>
									</div>
								</div>
								<hr class="my-4" />
								<div class="row align-items-center mb-4">
									<br>
									<div class="col-8">
										<h6 class="heading-small text-muted">부가정보</h6>
									</div>
								</div>
								<div class="pl-lg-4">
									<div class="form-group">
										<label class="form-control-label" >자격증</label>
										<c:if test="${studentLicenseList[0].licenseNumber != null}">
											<c:forEach var="l" items="${studentLicenseList}">
												<div class="row">
													<div class="col-lg-3">
														<div class="form-group ">
															<input type="text" class="form-control form-control-alternative" style="background-color: white;" value="${l.licenseNumber}" disabled="disabled">
														</div>
													</div>
													<div class="col-lg-3">
														<div class="form-group ">
															<input type="text" class="form-control form-control-alternative" style="background-color: white;" value="${l.licenseName}" disabled="disabled">
														</div>
													</div>
													<div class="col-lg-3">
														<div class="form-group ">
															<input type="text" class="form-control form-control-alternative" style="background-color: white;" value="${l.licenseAgency}" disabled="disabled">
														</div>
													</div>
													<div class="col-lg-3">
														<div class="form-group ">
															<input type="text" class="form-control form-control-alternative" style="background-color: white;" value="${l.licenseGetdate}" disabled="disabled">
														</div>
													</div>
												</div>
											</c:forEach>
										</c:if>
										<c:if test="${studentLicenseList[0].licenseNumber == null}">
											<div class="row">
												<div class="col-lg-3">
													<h5>(자격증이 없습니다)</h5>
												</div>
											</div>
										</c:if>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- Table 2 -->
				<div class="row mt-5">
					<div class="col">
						<div class="card shadow">
							<div class="card-header bg-white border-0">
								<div class="row align-items-center">
									<div class="col-8">
										<h3 class="mb-0">출결 정보</h3>
									</div>
									<div class="col-4 text-right">
									</div>
								</div>
							</div>
							
							<div class="table-responsive">
								<table class="table attendanceTable align-items-center table-flush attendanceTableMenu">
									<tr>
										<td width="35%" style="text-align: right;">
											<button type="button" class="btn btn-secondary"
												onclick="location.href='${pageContext.request.contextPath}/auth/teacher/lecture/${LASACR.lecture.lectureNo}/student/studentOne/${LASACR.classRegistration.accountId}/${currentYear}/${currentMonth - 1}'">
												<i class='fas fa-angle-double-left' style='font-size: 36px'></i>
											</button>
										</td>
										<td width="30%">
											<h3>${currentYear}년 ${currentMonth}월</h3>
										</td>
										<td width="35%" style="text-align: left;">
											<button type="button" class="btn btn-secondary"
												onclick="location.href='${pageContext.request.contextPath}/auth/teacher/lecture/${LASACR.lecture.lectureNo}/student/studentOne/${LASACR.classRegistration.accountId}/${currentYear}/${currentMonth + 1}'">
												<i class='fas fa-angle-double-right' style='font-size: 36px'></i>
											</button>
										</td>
									</tr>
								</table>
								
								<table class="table attendanceTable align-items-center table-flush">
									<thead class="thead-light">
										<tr>
											<th width="20%">날짜</th>
											<th width="20%">출결 여부</th>
											<th width="60%">비고 혹은 사유</th>
										</tr>
									</thead>
									<tbody>
										<c:if test="${!empty attendanceList[0].attendanceState}">
											<c:forEach var="at" items="${attendanceList}">
												<tr>
													<c:if test="${at.attendanceDay != null}">
														<td>${at.attendanceDay}</td>
													</c:if>
													<c:if test="${at.attendanceDay == null}">
														<td></td>
													</c:if>
		
													<c:if test="${at.attendanceState != null}">
														<td>${at.attendanceState}</td>
													</c:if>
													<c:if test="${at.attendanceState == null}">
														<td></td>
													</c:if>
		
													<c:if test="${at.attendanceRemark != null}">
														<td>${at.attendanceRemark}</td>
													</c:if>
													<c:if test="${at.attendanceRemark == null}">
														<td></td>
													</c:if>
												</tr>
											</c:forEach>
										</c:if>
										<c:if test="${empty attendanceList[0].attendanceState}">
											<tr>
												<td colspan="3">
													(출결 기록이 없습니다)
												</td>
											</tr>
										</c:if>
									</tbody>
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