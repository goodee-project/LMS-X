<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>reportList</title>
		
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
				<h1>과제 관리</h1>
				<p>학생들에게 출제한 과제를 관리하는 메뉴입니다.</p>
			</div>
		</div>
	
		<!-- 본문 -->
		<div class="container">
			<h3>과제 목록</h3>
			
			<br>
			
			<table class="table">
				<thead>
					<tr>
						<th>과제 번호</th>
						<th>과제 제목</th>
						<th>과제 출제일</th>
						<th>과제 마감일</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${teacherReportList[0].reportNo != null}">
						<c:forEach var="trl" items="${teacherReportList}">
							<tr>
								<td>${trl.reportNo}</td>
								<td>${trl.reportTitle}</td>
								<td>${trl.reportStartdate}</td>
								<td>${trl.reportEnddate}</td>
							</tr>
						</c:forEach>
					</c:if>
					<c:if test="${teacherReportList[0].reportNo == null}">
						<tr>
							<td colspan="7">(출제한 과제가 없습니다)</td>
						</tr>
					</c:if>
				</tbody>
			</table>
		</div>
	</body>
</html>