<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>noticeOne</title>
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
				<h1>강좌</h1>
				<p>공지사항 상세보기입니다.</p>
			</div>
		</div>
		<!-- 본문 -->
		<div class="container">
			<table class=table>
				<tr>
					<td width="20%">번호</td>
					<td width="80%">${lectureNoticeNo}</td>
				</tr>
				<tr>
					<td>제목</td>
					<td>${lectureNotice.lectureNoticeTitle}</td>
				</tr>
				<tr>
					<td>내용</td>
					<td>${lectureNotice.lectureNoticeContent}</td>
				</tr>
				<tr>
					<td>작성일</td>
					<td>${lectureNotice.lectureNoticeCreatedate}</td>
				</tr>
				<tr>
					<td>수정일</td>
					<td>${lectureNotice.lectureNoticeUpdatedate}</td>				
				</tr>
				<tr>
					<td>조회수</td>
					<td>${lectureNotice.lectureNoticeCount}</td>
				</tr>
			</table>
		</div>
	</body>
</html>