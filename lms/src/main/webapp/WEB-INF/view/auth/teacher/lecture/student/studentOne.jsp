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
		<table border="1">
			<thead>
				<th>날짜</th>
				<th>출결 여부</th>
				<th>비고 혹은 사유</th>
			</thead>
			<tbody>
			<c:forEach var="at" items="${attendanceList}">
			<tr>
				<c:if test="${at.attendanceDay != null}">
				<td>${at.attendanceDay}</td>
				</c:if>
				<c:if test="${at.attendanceDay == null}">
					<td style="text-align: center">x</td>
				</c:if>
				
				
				<c:if test="${at.attendanceState != null}">
				<td>${at.attendanceState}</td>
				</c:if>
				<c:if test="${at.attendanceState == null}">
					<td style="text-align: center">x</td>
				</c:if>
				
				<c:if test="${at.attendanceRemark != null}">
					<td>${at.attendanceRemark}</td>
				</c:if>
				<c:if test="${at.attendanceRemark == null}">
					<td style="text-align: center">x</td>
				</c:if>
			</tr>
			</c:forEach>
			</tbody>
		</table>
	</body>
</html>