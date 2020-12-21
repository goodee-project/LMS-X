<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>updateNotice</title>
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
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<script>
			$(document).ready(function(){
				$('#updateBtn').click(function(){
					if($('#noticeTitleText').val().length <= 0){
						alert('제목을 입력해주세요.');
						return;
						}
					if($('#noticeContentText').val().length <= 0){
						alert('내용을 입력해주세요.');
						return;
						}
					$('#updateNoticeForm').submit();
					});
				});
		</script>
	</head>
	<body>
		<!-- 내비게이션 메인 메뉴 -->
		<jsp:include page="/WEB-INF/view/auth/teacher/include/menu.jsp" />
		
		<!-- 내비게이션 서브 메뉴 -->
		<jsp:include page="/WEB-INF/view/auth/teacher/include/lectureMenu.jsp" />
	
		<!-- 상단 인터페이스 -->
		<div class="jumbotron jumbotron-fluid">
			<div class="container">
				<h1>강좌 공지사항</h1>
				<p>강좌 공지사항입니다.</p>
			</div>
		</div>
		
		<!-- 본문 -->
		<div class="container">
			<h3>공지사항</h3>
			<button type="button" class="btn btn-sm btn-dark" style="float: left;" onclick="location.href='${pageContext.request.contextPath}/auth/teacher/lecture/${lectureNo}/notice/noticeOne/${lectureNoticeNo}'">목록</button>
			<form method="post" action="${pageContext.request.contextPath}/auth/teacher/lecture/${lectureNo}/notice/updateNotice/${lectureNoticeNo}" id="updateNoticeForm">
				<button type="button" class="btn btn-sm btn-success" style="float: right" id="updateBtn">입력</button>
				<br><br>
				<table class="table">
					<tr>
						<td style="width:20%">번호</td>
						<td style="width:80%"><input type="text" class="form-control" value="${lectureNotice.lectureNoticeNo}"readonly="readonly"></td>
					</tr>
					<tr>
						<td>제목</td>
						<td><input type="text" class="form-control" value="${lectureNotice.lectureNoticeTitle}" name="lectureNoticeTitle" id="noticeTitleText"></td>
					</tr>
					<tr>
						<td>내용</td>
						<td>
							<textarea class="form-control" name="lectureNoticeContent" id="noticeContentText">${lectureNotice.lectureNoticeContent}</textarea>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</body>
</html>