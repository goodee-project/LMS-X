<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>updateReportSubmit</title>
		
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
				<h1>과제 평가 수정</h1>
				<p>학생들의 과제에 대한 점수와 평가를 수정하는 메뉴입니다.</p>
			</div>
		</div>
		
		<!-- 본문 -->
		<div class="container">
			<form method="post" action="${pageContext.request.contextPath}/auth/teacher/lecture/${lectureNo}/report/reportOne/${reportNo}/updateReportSubmit/${reportSubmitNo}">
				<div>
					<h3>과제 평가 수정</h3>
					<button type="submit" class="btn btn-sm btn-success" style="float: right;">입력</button>
				</div>
				
				<br><br>
				
				<table class="table">
					<tr>
						<td>점수</td>
						<td>
							<input type="text" class="form-control" name="reportSubmitPoint" value="${reportSubmit[0].reportSubmitPoint}">
						</td>
					</tr>
					<tr>
						<td>평가 내용</td>
						<td>
							<input type="text" class="form-control" name="reportSubmitFeedback" value="${reportSubmit[0].reportSubmitFeedback}">
						</td>
					</tr>
				</table>
			</form>
		</div>
	</body>
</html>