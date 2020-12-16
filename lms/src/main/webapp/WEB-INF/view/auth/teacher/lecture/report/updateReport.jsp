<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>updateReport</title>
		
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
				<h1>과제 수정</h1>
				<p>학생들에게 출제한 과제 정보를 수정하는 메뉴입니다.</p>
			</div>
		</div>
		
		<!-- 본문 -->
		<div class="container">
			<form method="post" action="${pageContext.request.contextPath}/auth/teacher/lecture/${lectureNo}/report/insertReport">
				<div>
					<h3>과제 정보</h3>
					<button type="submit" class="btn btn-sm btn-success" style="float: right;">입력</button>
				</div>
				
				<br><br>
				
				<!-- 강좌 고유번호 -->
				<input type="hidden" name="lectureNo" value="${lectureNo}">
				
				<table class="table">
					<tr>
						<td>과제 출제번호</td>
						<td>
							<input type="text" class="form-control" name="reportNo" value="${report.reportNo}" readonly="readonly">
						</td>
					</tr>
					<tr>
						<td>과제 이름</td>
						<td>
							<input type="text" class="form-control" name="reportTitle" value="${report.reportTitle}">
						</td>
					</tr>
					<tr>
						<td>과제 내용</td>
						<td>
							<textarea class="form-control" name="reportContent">${report.reportContent}</textarea>
						</td>
					</tr>
					<tr>
						<td>과제 시작일시</td>
						<td>
							<input type="datetime-local" class="form-control" name="reportStartdate" id="reportStartdate">
							<script>
								let rStartdate = "${report.reportStartdate}";
								document.getElementById('reportStartdate').value = rStartdate;
							</script>
						</td>
					</tr>
					<tr>
						<td>과제 종료일시</td>
						<td>
							<input type="datetime-local" class="form-control" name="reportEnddate" id="reportEnddate">
							<script>
								let rEnddate = "${report.reportEnddate}";
								$('#reportEnddate').val(rEnddate);
							</script>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</body>
</html>