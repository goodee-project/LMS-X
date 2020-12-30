<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		
		<title>attendanceCalendarByDay</title>
		
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
			table {
				text-align: center;
			}
			
			.table td {
				vertical-align: middle;
			}
			
			.attendanceTableMenu {
				width: 100%;
				text-align: center;
			}
			
			.attendanceTableMenu td {
				vertical-align: middle;
				height: 120px;
			}
			th {
				text-align: center;
				background-color: #F9F9FB;
			}
		</style>
		
		<script>
			$(document).ready(function() {
				// 출석/결석/외출/조퇴/지각 입력
				$('.attendanceBtn').on('click', function() {
					let accountId = $(this).val();
					console.log('accountId: ' + accountId);
					
					let attendanceState = $(this).text();
					console.log('attendanceState: ' + attendanceState);
					
					$.ajax({
						url: '${pageContext.request.contextPath}/auth/teacher/lecture/${lectureNo}/attendance/insertAttendance/${currentYear}/${currentMonth}/${currentDay}/' + accountId + '?attendanceState=' + attendanceState, 
						type: 'get', 
						success: function() {
							alert(accountId + ' 학생의 출석 상태가 입력되었습니다.');
							
							let selected = '';
							
							if (attendanceState == '출석') {
								selected = '<option value="출석" selected="selected">출석</option><option value="결석">결석</option><option value="외출">외출</option><option value="조퇴">조퇴</option><option value="지각">지각</option>';
							} else if (attendanceState == '결석') {
								selected = '<option value="출석">출석</option><option value="결석" selected="selected">결석</option><option value="외출">외출</option><option value="조퇴">조퇴</option><option value="지각">지각</option>';
							} else if (attendanceState == '외출') {
								selected = '<option value="출석">출석</option><option value="결석">결석</option><option value="외출" selected="selected">외출</option><option value="조퇴">조퇴</option><option value="지각">지각</option>';
							} else if (attendanceState == '조퇴') {
								selected = '<option value="출석">출석</option><option value="결석">결석</option><option value="외출">외출</option><option value="조퇴" selected="selected">조퇴</option><option value="지각">지각</option>';
							} else if (attendanceState == '지각') {
								selected = '<option value="출석">출석</option><option value="결석">결석</option><option value="외출">외출</option><option value="조퇴">조퇴</option><option value="지각" selected="selected">지각</option>';
							}
							
							// colspan 제거
							$('#' + accountId + 'AttendanceStateTable').removeAttr('colspan');
							
							// 추가할 내용
							let html = '<td><select class="form-control" id="' + accountId + 'AttendanceState" name="attendanceState">' + selected + '</select></td><td><input type="text" class="form-control" id="' + accountId + 'AttendanceRemark"></td><td><button type="button" class="btn btn-sm btn-dark submitBtn" value="' + accountId + '">변경</button></td>';
							
							// 해당 요소 태그 내부의 내용을 비운다
							$('#' + accountId + 'AttendanceStateTable').html('');
							
							// 해당 요소 태그 내부의 맨 마지막에 내용을 추가
							$('#' + accountId + 'AttendanceStateTable').append(html);
							
							// 대상 요소를 감싸고 있는 부모요소 삭제 및 부모 요소의 내용은 유지
							$('#' + accountId + 'AttendanceStateTable').contents().unwrap();
						}, 
						error: function() {
							alert('데이터베이스 접근에 실패하였습니다.\n인터넷 연결을 다시 한 번 확인해주세요.');
						}
					});
				});
				
				// 출석 상태 변경
				$(document).on("click", ".submitBtn", function() {
					let accountId = $(this).val();
					console.log('accountId: ' + accountId);
					
					let attendanceState = $('#' + accountId + 'AttendanceState').val();
					console.log('attendanceState: ' + attendanceState);
					
					let attendanceRemark = $('#' + accountId + 'AttendanceRemark').val();
					console.log('attendanceRemark: ' + attendanceRemark);
					
					console.log('${pageContext.request.contextPath}/auth/teacher/lecture/${lectureNo}/attendance/updateAttendance/${currentYear}/${currentMonth}/${currentDay}/' + accountId + '?attendanceState=' + attendanceState + '&attendanceRemark=' + attendanceRemark);
					
					$.ajax({
						url: '${pageContext.request.contextPath}/auth/teacher/lecture/${lectureNo}/attendance/updateAttendance/${currentYear}/${currentMonth}/${currentDay}/' + accountId + '?attendanceState=' + attendanceState + '&attendanceRemark=' + attendanceRemark, 
						type: 'get', 
						success: function() {
							alert(accountId + ' 학생의 출석 상태가 변경되었습니다.');
						}, 
						error: function() {
							alert('데이터베이스 접근에 실패하였습니다.\n인터넷 연결을 다시 한 번 확인해주세요.');
						}
					});
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
							<div class="card-header bg-white border-0">
								<div class="row align-items-center">
									<br>
									<div class="col-8">
										<h3 class="mb-0">일일 출석부</h3>
									</div>
									<div class="col-4 text-right">
										<div style="float: right;">
										</div>
									</div>
								</div>
							</div>
							<div class="table-responsive">
								<!-- 날짜 출력 및 이동 -->
					            <table class="attendanceTableMenu">
					               <tr>
					                  <td width="35%" style="text-align: right;">
					                     <button type="button" class="btn btn-secondary" onclick="location.href='${pageContext.request.contextPath}/auth/teacher/lecture/${lectureNo}/attendance/attendanceCalendarByDay/pre/${currentYear}/${currentMonth}/${currentDay}'">
					                        <i class='fas fa-angle-double-left' style='font-size:36px'></i>
					                     </button>
					                  </td>
					                  <td width="30%">
					                     <h3>${currentYear}년 ${currentMonth}월 ${currentDay}일</h3>
					                  </td>
					                  <td width="35%" style="text-align: left;">
					                     <button type="button" class="btn btn-secondary" onclick="location.href='${pageContext.request.contextPath}/auth/teacher/lecture/${lectureNo}/attendance/attendanceCalendarByDay/next/${currentYear}/${currentMonth}/${currentDay}'">
					                        <i class='fas fa-angle-double-right' style='font-size:36px'></i>
					                     </button>
					                  </td>
					               </tr>
					            </table>
					            
					            <br>
								
								<table class="table">
									<thead>
										<tr>
											<th width="12%">학생 아이디</th>
											<th width="12%">학생 이름</th>
											<th width="10%">성별</th>
											<th width="15%">출석 상태</th>
											<th width="36%">비고(사유)</th>
											<th width="15%">출석 상태 변경</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="al" items="${attendanceList}">
											<tr>
												<td>${al.accountId}</td>
												<td>${al.student.studentName}</td>
												<td>${al.student.studentGender}</td>
												<c:if test="${al.attendanceState != null}">
													<td>
														<select class="form-control" id="${al.accountId}AttendanceState" name="attendanceState">
															<c:if test="${al.attendanceState == '출석'}">
																<option value="출석" selected="selected">출석</option>
															</c:if>
															<c:if test="${al.attendanceState != '출석'}">
																<option value="출석">출석</option>
															</c:if>
															<c:if test="${al.attendanceState == '결석'}">
																<option value="결석" selected="selected">결석</option>
															</c:if>
															<c:if test="${al.attendanceState != '결석'}">
																<option value="결석">결석</option>
															</c:if>
															<c:if test="${al.attendanceState == '외출'}">
																<option value="외출" selected="selected">외출</option>
															</c:if>
															<c:if test="${al.attendanceState != '외출'}">
																<option value="외출">외출</option>
															</c:if>
															<c:if test="${al.attendanceState == '조퇴'}">
																<option value="조퇴" selected="selected">조퇴</option>
															</c:if>
															<c:if test="${al.attendanceState != '조퇴'}">
																<option value="조퇴">조퇴</option>
															</c:if>
															<c:if test="${al.attendanceState == '지각'}">
																<option value="지각" selected="selected">지각</option>
															</c:if>
															<c:if test="${al.attendanceState != '지각'}">
																<option value="지각">지각</option>
															</c:if>
														</select>
													</td>
													<td>
														<input type="text" class="form-control" id="${al.accountId}AttendanceRemark" value="${al.attendanceRemark}">
													</td>
													<td>
														<button type="button" class="btn btn-sm btn-dark submitBtn" value="${al.accountId}">변경</button>
													</td>
												</c:if>
												<c:if test="${al.attendanceState == null}">
													<td colspan="3" id="${al.accountId}AttendanceStateTable">
														<button type="button" class="btn btn-sm btn-primary attendanceBtn" value="${al.accountId}">출석</button>
														<button type="button" class="btn btn-sm btn-danger attendanceBtn" value="${al.accountId}">결석</button>
														<button type="button" class="btn btn-sm btn-warning attendanceBtn" value="${al.accountId}">외출</button>
														<button type="button" class="btn btn-sm btn-info attendanceBtn" value="${al.accountId}">조퇴</button>
														<button type="button" class="btn btn-sm btn-secondary attendanceBtn" value="${al.accountId}">지각</button>
													</td>
												</c:if>
											</tr>
										</c:forEach>
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