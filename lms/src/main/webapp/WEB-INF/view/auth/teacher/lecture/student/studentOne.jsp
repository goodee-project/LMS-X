<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>student One</title>
</head>
<body>
	<h1>학생 정보</h1>
	<!-- 내비게이션 메인 메뉴 -->
	<jsp:include page="/WEB-INF/view/auth/teacher/include/menu.jsp" />
	
	<!-- 내비게이션 서브 메뉴 -->
	<jsp:include page="/WEB-INF/view/auth/teacher/include/lectureMenu.jsp" />
		<table border="1">
			<tr>
				<td>강좌 번호</td>
				<td>${LASACR.lecture.lectureNo}</td>
			</tr>
			<tr>
				<td>학생 ID</td>
				<td>${LASACR.classRegistration.accountId}</td>
			</tr>
			<tr>
				<td>이름</td>
				<td>${LASACR.student.studentName}</td>
			</tr>
			<tr>
				<td>이메일</td>
				<td>${LASACR.student.studentEmail}</td>
			</tr>
			<tr>
				<td>성별</td>
				<td>${LASACR.student.studentGender}</td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td>${LASACR.student.studentPhone}</td>
			</tr>
			<tr>
				<td>생년월일</td>
				<td>${LASACR.student.studentBirth}</td>
			</tr>
			<tr>
				<td>주소</td>
				<td>${LASACR.student.studentAddressMain}</td>
			</tr>
			<tr>
				<td>상세주소</td>
				<td>${LASACR.student.studentAddressSub}</td>
			</tr>
		</table>
		
		<h2>출결 정보</h2>
		
				<!-- 날짜 출력 및 이동 -->
            <table class="attendanceTableMenu">
               <tr>
                  <td width="35%" style="text-align: right;">
                     <button type="button" class="btn btn-secondary" onclick="location.href='${pageContext.request.contextPath}/auth/teacher/lecture/${LASACR.lecture.lectureNo}/student/studentOne/${LASACR.classRegistration.accountId}/${currentYear}/${currentMonth - 1}'">
                        <i class='fas fa-angle-double-left' style='font-size:36px'></i>
                     </button>
                  </td>
                  <td width="30%">
                     <h3>${currentYear}년 ${currentMonth}월</h3>
                  </td>
                  <td width="35%" style="text-align: left;">
                     <button type="button" class="btn btn-secondary" onclick="location.href='${pageContext.request.contextPath}/auth/teacher/lecture/${LASACR.lecture.lectureNo}/student/studentOne/${LASACR.classRegistration.accountId}/${currentYear}/${currentMonth + 1}'">
                        <i class='fas fa-angle-double-right' style='font-size:36px'></i>
                     </button>
                  </td>
               </tr>
            </table>
			
			<button type="button" class="btn btn-sm btn-success" style="float: right;" onclick="location.href='${pageContext.request.contextPath}/auth/teacher/lecture/${LASACR.lecture.lectureNo}/student/studentOne/${LASACR.classRegistration.accountId}/attendanceToday'">오늘 날짜 이동</button>
			
			<br><br>
			
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
											<a href="${pageContext.request.contextPath}/auth/teacher/lecture/${LASACR.lecture.lectureNo}/student/${LASACR.student.studentId}/studentAttendanceByDay/default/${currentYear}/${currentMonth}/${i - (firstDayOfWeek - 1)}">${i - (firstDayOfWeek - 1)}</a>
										</div>
									</c:if>
                                 
									<!-- 토요일 -->
									<c:if test="${i % 7 == 0}">
										<div class="saturday">
											<a href="${pageContext.request.contextPath}/auth/teacher/lecture/${LASACR.lecture.lectureNo}/student/${LASACR.student.studentId}/studentAttendanceByDay/default/${currentYear}/${currentMonth}/${i - (firstDayOfWeek - 1)}">${i - (firstDayOfWeek - 1)}</a>
										</div>
									</c:if>
                                 
									<!-- 평일 (월요일 ~ 금요일) -->
									<c:if test="${i % 7 != 1 && i % 7 != 0}">
										<div class="weekday">
											<a href="${pageContext.request.contextPath}/auth/teacher/lecture/${LASACR.lecture.lectureNo}/student/${LASACR.student.studentId}/studentAttendanceByDay/default/${currentYear}/${currentMonth}/${i - (firstDayOfWeek - 1)}">${i - (firstDayOfWeek - 1)}</a>
										</div>
									</c:if>
									
								<!-- 출결현황이 있는 날짜를 리스트에서 검색  -->
								<c:forEach var="a" items="${attendanceList}">
									<c:if test="${i-(firstDayOfWeek-1)== a.attendenceDay }">
										<c:if test="${a.attendanceState == '출석' }">
											<div>출석 : ${a.attendanceRemark}</div>
										</c:if>
										<c:if test="${a.attendanceState == '결석' }">
											<div>결석 : ${a.attendanceRemark}</div>
										</c:if>
										<c:if test="${a.attendanceState == '외출' }">
											<div>외출 : ${a.attendanceRemark}</div>
										</c:if>
										<c:if test="${a.attendanceState == '조퇴' }">
											<div>조퇴 : ${a.attendanceRemark}</div>
										</c:if>								
										<c:if test="${a.attendanceState == '지각' }">
											<div>지각 : ${a.attendanceRemark}</div>
										</c:if>
									</c:if>
								</c:forEach>
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