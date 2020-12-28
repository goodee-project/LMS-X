<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>answersheetOne</title>
		
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
				<h1>학생 답안지 조회</h1>
				<p>학생이 제출한 답안지를 조회합니다.</p>
			</div>
		</div>
	
		<!-- 본문 -->
		<div class="container">
			<h3>학생 답안지 조회</h3>
			
			<br>
			
			<button class="btn btn-sm btn-dark" onclick="location.href='${pageContext.request.contextPath}/auth/teacher/lecture/${lectureNo}/test/answersheetList'">목록</button>
			
			<br><br>
			
			<c:forEach var="mcl" items="${multiplechoiceList}">
				<table class="table">
					<thead>
						<tr>
							<th width="30%">${mcl.multiplechoiceId}</th>
							<th width="70%">${mcl.multiplechoiceQuestion}</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="mcel" items="${mcl.multiplechoiceExampleList}">
							<tr>
								<td>
									<c:if test="${mcel.multiplechoiceExampleId == 1}">①</c:if>
									<c:if test="${mcel.multiplechoiceExampleId == 2}">②</c:if>
									<c:if test="${mcel.multiplechoiceExampleId == 3}">③</c:if>
									<c:if test="${mcel.multiplechoiceExampleId == 4}">④</c:if>
									<c:if test="${mcel.multiplechoiceExampleId == 5}">⑤</c:if>
								</td>
								<td>
									${mcel.multiplechoiceExampleContent}
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</c:forEach>
		</div>
	</body>
</html>