<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>lectureIndex</title>
		
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
		
		<!-- Google Web Fonts -->
		<link rel="preconnect" href="https://fonts.gstatic.com">
		<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
		<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
		<link href="https://fonts.googleapis.com/css2?family=Righteous&display=swap" rel="stylesheet">
	
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
		<div class="container">
			<h1>강의실</h1>
			
			<div>
				<a href="${pageContext.request.contextPath}/auth/teacher/index/1">홈</a>
			</div>
			
			<div>
				<a href="${pageContext.request.contextPath}/auth/logout">로그아웃</a>
			</div>
			
			<br>
			
			<table class="table">
				<tr>
					<td>과목</td>
					<td>${lecture.subject.subjectName}</td>
				</tr>
				<tr>
					<td>강좌</td>
					<td>${lecture.lectureName}</td>
				</tr>
				<tr>
					<td>강사</td>
					<td>${lecture.teacherName}</td>
				</tr>
				<tr>
					<td>개강일</td>
					<td>${lecture.lectureStartdate}</td>
				</tr>
				<tr>
					<td>종강일</td>
					<td>${lecture.lectureEnddate}</td>
				</tr>
			</table>
		</div>
	</body>
</html>