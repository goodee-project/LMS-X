<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>studentManagement</title>
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
			
			 th {
				text-align: center;
			}
		</style>
		
		<script>
			$(document).ready(function(){
				$('#studnetAccessBtn').on('click', function(){
					let paramId = $(this).val();
					$.ajax({
						url: '${pageContext.request.contextPath}/auth/manager/lecture/${lectureNo}/isLectureTotalFull/${studentListCount}',
						type:'get',
						success: function(data){
							if(!data) {
								$('#parentModal').html(`
									<div>
										<div class="modal fade" id="infoModal" tabindex="-1" role="dialog" aria-labelledby="infoModalLabel" aria-hidden="true">
											<div class="modal-dialog modal-dialog-centered" role="document">
												<div class="modal-content">
													<div class="modal-header">
														<h5 class="modal-title" id="infoModalLabel">정보</h5>
														<button type="button" class="close" data-dismiss="modal" aria-label="Close">
															<span aria-hidden="true">&times;</span>
														</button>
													</div>
													<div class="modal-body">정원이 초과된 강좌입니다.</div>
													<div class="modal-footer">
														<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
													</div>
												</div>
											</div>
										</div>
									</div>
								`);
								$("#infoModal").modal("show");
								return;
							}
							else {
								$(location).attr('href', '${pageContext.request.contextPath}/auth/manager/lecture/' + ${lectureNo} + '/updateStudentClassState/' + paramId + '/수강중');
							}
						}
					});
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
				<jsp:include page="/WEB-INF/view/auth/manager/include/lectureMenu.jsp" />
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
										<h3 class="mb-0">수강 학생 관리</h3>
									</div>
									<div class="col-4 text-right">
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
								<h3 class="mb-0">수강 승인된 학생&nbsp;&nbsp;<span class="badge badge-primary">${studentListCount}</span></h3>
							</div>
								
							<div class="table-responsive" style="height:500px; overflow: auto; width: 100%; max-height: 500px;">
								<table class="table align-items-center table-flush">
									<thead class="thead-light">
										<tr>
											<th>아이디</th>
											<th>상태</th>
											<th>승인 날짜</th>
										</tr>
									</thead>
									<tbody>
										<c:if test="${!empty studentList}">
											<c:forEach var="sl" items="${studentList}">
												<tr>
													<td>${sl.accountId}</td>
													<td>${sl.classRegistrationState}</td>
													<td>${sl.classRegistrationUpdatedate}</td>
												</tr>
											</c:forEach>
										</c:if>
										<c:if test="${empty studentList}">
											<tr>
												<td colspan="3">(승인된 학생이 없습니다)</td>
											</tr>
										</c:if>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<div class="col-7">
						<div class="card shadow">
							<div class="card-header bg-white border-0">
								<h3 class="mb-0">수강 대기중인 학생&nbsp;&nbsp;<span class="badge badge-primary">${studentListByStateCount}</span></h3>
							</div>
							
							<div class="table-responsive" style="height:500px; overflow: auto; width: 100%; max-height: 500px;">
								<table class="table align-items-center table-flush">
									<thead class="thead-light">
										<tr>
											<th width="20%">아이디</th>
											<th width="15%">상태</th>
											<th width="35%">신청 날짜</th>
											<th width="15%">승인</th>
											<th width="15%">거절</th>
										</tr>
									</thead>
									<tbody>
										<c:if test="${!empty studentListByState}">
											<c:forEach var="sls" items="${studentListByState}">
												<tr>
													<td>${sls.accountId}</td>
													<td>${sls.classRegistrationState}</td>
													<td>${sls.classRegistrationUpdatedate}</td>
													<td>
														<button type="button" class="btn btn-sm btn-success" data-toggle="modal" data-target="#modal-default-${sls.accountId}">승인</button>
														
														<div id="parentModal"></div>
														
														<div class="modal fade" id="modal-default-${sls.accountId}" tabindex="-1"
															role="dialog" aria-labelledby="modal-default" aria-hidden="true">
															<div class="modal-dialog modal- modal-dialog-centered modal-"
																role="document">
																<div class="modal-content">
													
																	<div class="modal-header">
																		<h6 class="modal-title" id="modal-title-notification">확인</h6>
																		<button type="button" class="close" data-dismiss="modal"
																			aria-label="Close">
																			<span aria-hidden="true">×</span>
																		</button>
																	</div>
													
																	<div class="modal-body">
													
																		<div class="py-3 text-center">
																			<i class="ni ni-bell-55 ni-3x"></i>
																			<h4 class="heading mt-4">승인 확인</h4>
																			<p>${sls.accountId} 학생의 수강신청을 승인하시겠습니까?</p>
																		</div>
													
																	</div>
													
																	<div class="modal-footer">
																		<button type="button" class="btn btn-link" data-dismiss="modal">취소</button>
																		<button type="button" class="btn btn-primary ml-auto" id="studnetAccessBtn" value="${sls.accountId}" data-dismiss="modal">승인</button>
																	</div>
																</div>
															</div>
														</div>
													</td>
													<td>
														<button type="button" class="btn btn-sm btn-danger" data-toggle="modal" data-target="#modal-notification-${sls.accountId}">거절</button>
														
														<div class="modal fade" id="modal-notification-${sls.accountId}" tabindex="-1"
															role="dialog" aria-labelledby="modal-notification" aria-hidden="true">
															<div class="modal-dialog modal-danger modal-dialog-centered modal-"
																role="document">
																<div class="modal-content bg-gradient-danger">
													
																	<div class="modal-header">
																		<h6 class="modal-title" id="modal-title-notification">경고</h6>
																		<button type="button" class="close" data-dismiss="modal"
																			aria-label="Close">
																			<span aria-hidden="true">×</span>
																		</button>
																	</div>
													
																	<div class="modal-body">
													
																		<div class="py-3 text-center">
																			<i class="ni ni-bell-55 ni-3x"></i>
																			<h4 class="heading mt-4">거절 확인</h4>
																			<p>${sls.accountId} 학생의 수강신청을 거절하시겠습니까?</p>
																		</div>
													
																	</div>
													
																	<div class="modal-footer">
																		<button type="button" class="btn btn-white" data-dismiss="modal">취소</button>
																		<button type="button" class="btn btn-link text-white ml-auto" onclick="location.href='${pageContext.request.contextPath}/auth/manager/lecture/${lectureNo}/updateStudentClassState/${sls.accountId}/취소'">취소</button>
																	</div>
																</div>
															</div>
														</div>
													</td>
												</tr>
											</c:forEach>
										</c:if>
										<c:if test="${empty studentListByState}">
											<tr>
												<td colspan="5">(대기중인 학생이 없습니다)</td>
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