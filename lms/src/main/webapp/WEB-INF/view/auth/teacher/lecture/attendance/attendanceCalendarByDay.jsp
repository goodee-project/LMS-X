<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>attendanceCalendarByDay</title>
		
		<!-- Bootstrap Framework 사용 -->
		
		<!-- Latest compiled and minified CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
		
		<!-- jQuery library -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		
		<!-- Popper JS -->
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
		
		<!-- Latest compiled JavaScript -->
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
		
		<!-- Bootstrap 4 Icons -->
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
	
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
				$('.submitBtn').on('click', function() {
					let accountId = $(this).val();
					console.log('accountId: ' + accountId);
					
					let attendanceState = $('#' + accountId + 'AttendanceState').val();
					console.log('attendanceState: ' + attendanceState);
					
					let attendanceRemark = $('#' + accountId + 'AttendanceRemark').val();
					console.log('attendanceRemark: ' + attendanceRemark);
					
					if (attendanceRemark == '') {
						alert('출석 상태를 변경해주세요!');
						return;
					}
					
					console.log('${pageContext.request.contextPath}/auth/teacher/lecture/${lectureNo}/attendance/updateAttendance/${currentYear}/${currentMonth}/${currentDay}/' + accountId + '/' + attendanceState + '/' + attendanceRemark);
					
					$.ajax({
						url: '${pageContext.request.contextPath}/auth/teacher/lecture/${lectureNo}/attendance/updateAttendance/${currentYear}/${currentMonth}/${currentDay}/' + accountId + '/' + attendanceState + '/' + attendanceRemark, 
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
		
		<!-- 내비게이션 서브 메뉴 -->
		<jsp:include page="/WEB-INF/view/auth/teacher/include/lectureMenu.jsp" />
		
		<!-- 상단 인터페이스 -->
		<div class="jumbotron jumbotron-fluid">
			<div class="container">
				<h1>출석 관리</h1>
				<p>학생들의 출석부를 관리하는 메뉴입니다.</p>
			</div>
		</div>
		
		<!-- 본문 -->
		<div class="container">
			<h3>일일 출석부</h3>
		
			<br>
			
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
							<td>
								<select class="form-control" id="${al.accountId}AttendanceState" name="attendanceState">
									<c:if test="${al.attendanceState == null}">
										<option value="" selected="selected">미출석</option>
									</c:if>
									<c:if test="${al.attendanceState != null}">
										<option value="">미출석</option>
									</c:if>
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
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		
		<br><br>
	</body>
</html>