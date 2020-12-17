<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>attendanceCalendarByMonth</title>
		
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
			.sunday a {
	            color: #FF0000;
	         }
	         .saturday a {
	            color: #0000FF;
	         }
	         .weekday a {
	            color: #000000;
	         }
	         
	         .sunday {
	            color: #FF0000;
	         }
	         .saturday {
	            color: #0000FF;
	         }
	         .weekday {
	            color: #000000;
	         }
	         
	         .attendanceTableMenu {
	            width: 100%;
	            text-align: center;
	         }
	         
	         .attendanceTableMenu td {
	            vertical-align: middle;
	         }
	         
	         th {
	            width: ${100/7}%;
	            text-align: center;
	            background-color: #F9F9FB;
	         }
	         td {
	            height: 120px;
	            vertical-align: top;
	         }
	         .attendanceTable td {
	            height: 130px;
	            vertical-align: top;
	         }
		</style>
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
			<h3>월별 출석부</h3>
			
			<!-- 날짜 출력 및 이동 -->
            <table class="attendanceTableMenu">
               <tr>
                  <td width="35%" style="text-align: right;">
                     <button type="button" class="btn btn-secondary" onclick="location.href='${pageContext.request.contextPath}/auth/teacher/lecture/${lectureNo}/attendance/attendanceCalendarByMonth/${currentYear}/${currentMonth - 1}'">
                        <i class='fas fa-angle-double-left' style='font-size:36px'></i>
                     </button>
                  </td>
                  <td width="30%">
                     <h3>${currentYear}년 ${currentMonth}월</h3>
                  </td>
                  <td width="35%" style="text-align: left;">
                     <button type="button" class="btn btn-secondary" onclick="location.href='${pageContext.request.contextPath}/auth/teacher/lecture/${lectureNo}/attendance/attendanceCalendarByMonth/${currentYear}/${currentMonth + 1}'">
                        <i class='fas fa-angle-double-right' style='font-size:36px'></i>
                     </button>
                  </td>
               </tr>
            </table>
			
			<br>
			
			<table class="table table-bordered attendanceTable">
				<thead>
					<tr>
						<th class="sunday">일</th>
                        <th>월</th>
                        <th>화</th>
                        <th>수</th>
                        <th>목</th>
                        <th>금</th>
                        <th class="saturday">토</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<c:forEach var="i" begin="1" end="${lastDay + (firstDayOfWeek - 1)}" step="1">
							<c:if test="${i - (firstDayOfWeek - 1) < 1}">
								<td>&nbsp;</td>
							</c:if>
							
							<c:if test="${i - (firstDayOfWeek - 1) > 0}">
								<td>
									<!-- 일요일 -->
									<c:if test="${i % 7 == 1}">
										<div class="sunday">
											<a href="${pageContext.request.contextPath}/auth/teacher/lecture/${lectureNo}/attendance/attendanceCalendarByDay/default/${currentYear}/${currentMonth}/${i - (firstDayOfWeek - 1)}">${i - (firstDayOfWeek - 1)}</a>
										</div>
									</c:if>
                                 
									<!-- 토요일 -->
									<c:if test="${i % 7 == 0}">
										<div class="saturday">
											<a href="${pageContext.request.contextPath}/auth/teacher/lecture/${lectureNo}/attendance/attendanceCalendarByDay/default/${currentYear}/${currentMonth}/${i - (firstDayOfWeek - 1)}">${i - (firstDayOfWeek - 1)}</a>
										</div>
									</c:if>
                                 
									<!-- 평일 (월요일 ~ 금요일) -->
									<c:if test="${i % 7 != 1 && i % 7 != 0}">
										<div class="weekday">
											<a href="${pageContext.request.contextPath}/auth/teacher/lecture/${lectureNo}/attendance/attendanceCalendarByDay/default/${currentYear}/${currentMonth}/${i - (firstDayOfWeek - 1)}">${i - (firstDayOfWeek - 1)}</a>
										</div>
									</c:if>
								</td>
							</c:if>
                           
							<c:if test="${i != (lastDay + (firstDayOfWeek - 1))}">
								<c:if test="${i % 7 == 0}">
									</tr><tr>
								</c:if>
							</c:if>
						</c:forEach>
                        
                        <c:if test="${(lastDay + (firstDayOfWeek - 1)) % 7 != 0}">   
							<c:forEach begin="1" end="${7 - ((lastDay + (firstDayOfWeek - 1)) % 7)}" step="1">   
								<td>&nbsp;</td>   
							</c:forEach>   
						</c:if>
					</tr>
				</tbody>
			</table>
		</div>
	</body>
</html>