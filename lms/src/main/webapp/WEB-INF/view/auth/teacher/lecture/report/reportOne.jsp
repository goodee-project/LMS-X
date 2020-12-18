<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>reportOne</title>
		
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
				background-color: #F9F9FB;
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
				<h1>과제 조회</h1>
				<p>학생들에게 출제한 과제 정보를 확인하는 메뉴입니다.</p>
			</div>
		</div>
		
		<!-- 본문 -->
		<div class="container">
			<h3>과제 정보</h3>
				
			<br>
			
			<button type="button" class="btn btn-sm btn-dark" onclick="location.href='${pageContext.request.contextPath}/auth/teacher/lecture/${lectureNo}/report/reportList/1'">목록</button>
			<button type="button" class="btn btn-sm btn-primary" style="float: right;" onclick="location.href='${pageContext.request.contextPath}/auth/teacher/lecture/${lectureNo}/report/updateReport/${reportNo}'">수정</button>
			
			<br><br>
			
			<table class="table">
				<tr>
					<td width="30%">과제 번호</td>
					<td width="70%">${report.reportNo}</td>
				</tr>
				<tr>
					<td>강좌 번호</td>
					<td>${report.lectureNo}</td>
				</tr>
				<tr>
					<td>과제 제목</td>
					<td>${report.reportTitle}</td>
				</tr>
				<tr>
					<td>과제 내용</td>
					<td>${report.reportContent}</td>
				</tr>
				<tr>
					<td>과제 출제일시</td>
					<td>${report.reportCreatedate}</td>
				</tr>
				<tr>
					<td>과제 수정일시</td>
					<td>${report.reportUpdatedate}</td>
				</tr>
				<tr>
					<td>과제 시작일시</td>
					<td>${report.reportStartdate}</td>
				</tr>
				<tr>
					<td>과제 마감일시</td>
					<td>${report.reportEnddate}</td>
				</tr>
			</table>
			
			<br>
			
			<h3>학생 과제 제출 목록</h3>
			
			<br>
			
			<table class="table">
				<thead>
					<tr>
						<th width="15%">학생 아이디</th>
						<th width="15%">학생 이름</th>
						<th width="55%">과제 이름</th>
						<th width="15%">과제 점수</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${reportSubmitList[0].reportSubmitNo != null}">
						<c:forEach var="rsl" items="${reportSubmitList}">
							<tr>
								<td>${rsl.accountId}</td>
								<td>${rsl.student.studentName}</td>
								<td>
									<a href="${pageContext.request.contextPath}/auth/teacher/lecture/${lectureNo}/report/reportOne/${reportNo}/reportSubmitOne/${rsl.reportSubmitNo}">${rsl.reportSubmitTitle}</a>
								</td>
								
								<td>${rsl.reportSubmitPoint}</td>
							</tr>
						</c:forEach>
					</c:if>
					<c:if test="${reportSubmitList[0].reportSubmitNo == null}">
						<tr>
							<td colspan="7">(학생들이 제출한 과제가 없습니다)</td>
						</tr>
					</c:if>
				</tbody>
			</table>
		</div>
		
		<br><br>
	</body>
</html>