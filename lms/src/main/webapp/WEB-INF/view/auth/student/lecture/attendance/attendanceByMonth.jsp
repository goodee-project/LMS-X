<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>attendanceByMonth</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<link href="${pageContext.request.contextPath}/resources/cash.css" rel="stylesheet" type="text/css" />
		<script>
			$(document).ready(function(){
				for(let i = 1; i <= ${lastDay+(firstDayOfWeek-1)}; i++){
					if(i%7 == 1){
						$('#day' + i).css('color', '#FF0000');
					}else if(i%7 == 0){
						$('#day' + i).css('color', '#0000FF');
					}
				}
			});
		
		</script>
	</head>
	<body>
	<h1>강좌 - 출석 현황</h1>
	<!-- 메뉴 -->
	<div>
		<jsp:include page="/WEB-INF/view/auth/student/include/menu.jsp" />
    </div>
	<div>
		<jsp:include page="/WEB-INF/view/auth/student/include/lectureMenu.jsp" />
    </div>
	<!-- 본문 -->
	<div class="container-fluit main-content" id="main-content">
		
		<div style="width:250px; margin:0 auto">
			<div class="ml-a pastel-peach-250">
				<div class="row">
				<div class=""><h3><a class="color-red" href="${pageContext.request.contextPath}/auth/student/lecture/${lectureNo}/attendance/attendanceByMonth/pre/${currentYear}/${currentMonth}">-</a></h3></div>
				<div class="ml-a"><h3>&nbsp; ${currentYear}년 ${currentMonth} 월 &nbsp;</h3></div>
				<div class="ml-a"><h3><a class="color-red" href="${pageContext.request.contextPath}/auth/student/lecture/${lectureNo}/attendance/attendanceByMonth/next/${currentYear}/${currentMonth}">+</a></h3></div>
				</div>
			</div>
		</div>
		<div>
			<table class="table">
				<thead>
					<tr>
						<th style="color:#FF0000">일</th>
						<th>월</th>
						<th>화</th>
						<th>수</th>
						<th>목</th>
						<th>금</th>
						<th style="color:#0000FF">토</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<c:forEach var="i" begin="1" end="${lastDay+(firstDayOfWeek-1)}" step="1">
							<c:if test="${i-(firstDayOfWeek-1) < 1}">
								<td>&nbsp;</td>
							</c:if>						
											
							<c:if test="${i-(firstDayOfWeek-1) > 0}">
								<td style="width:14%;">
									<div>
										<p id="day${i}">${i-(firstDayOfWeek-1)}</p>
									</div>
									<c:forEach var="a" items="${attendanceList}">
										<c:if test="${(i-(firstDayOfWeek-1)) == (fn:substring(a.attendanceDay,8,10))}">
											${a.attendanceState} 
											<c:if test="${a.attendanceRemark == ''}">
												: ${a.attendanceRemark}
											</c:if>
										</c:if>									
									</c:forEach>
								</td>
							</c:if>
							<c:if test="${i%7 == 0}">
								</tr><tr>
							</c:if>
						</c:forEach>
						
						<c:if test="${(lastDay+(firstDayOfWeek-1)) % 7 != 0}">
							<c:forEach begin="1" end="${7- ((lastDay+(firstDayOfWeek-1)) % 7)}" step="1">
								<td>&nbsp;</td>
							</c:forEach>
						</c:if>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>