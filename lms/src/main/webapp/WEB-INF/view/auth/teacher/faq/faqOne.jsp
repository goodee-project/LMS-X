<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>faqOne</title>
		
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
	
		<!-- 상단 인터페이스 -->
		<div class="jumbotron jumbotron-fluid">
			<div class="container">
				<h1>LMS 시스템 FAQ 조회</h1>
				<p>자주 묻는 질문에 대한 내용을 조회합니다.</p>
			</div>
		</div>
		
		<!-- 본문 -->
		<div class="container">
			<h3>LMS 시스템 FAQ 조회</h3>
			
			<br>
			
			<button type="button" class="btn btn-sm btn-dark" onclick="location.href='${pageContext.request.contextPath}/auth/teacher/faq/faqList/1'">목록</button>
			
			<br><br>
			
			<table class="table">
				<tr>
					<td width="30%">번호</td>
					<td width="70%">${faq.faqNo}</td>
				</tr>
				<tr>
					<td>카테고리</td>
					<td>${faq.faqCategory}</td>
				</tr>
				<tr>
					<td>작성자</td>
					<td>${faq.faqWriter}</td>
				</tr>
				<tr>
					<td>조회수</td>
					<td>${faq.faqCount}</td>
				</tr>
				<tr>
					<td>작성일시</td>
					<td>${faq.faqCreatedate}</td>
				</tr>
				<tr>
					<td>수정일시</td>
					<td>${faq.faqUpdatedate}</td>
				</tr>
				<tr>
					<td>제목</td>
					<td>${faq.faqTitle}</td>
				</tr>
				<tr>
					<td>내용</td>
					<td>${faq.faqContent}</td>
				</tr>
			</table>
		</div>
		
		<br><br>
	</body>
</html>