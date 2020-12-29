<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>insertNotice</title>
		<!-- Bootstrap Framework 사용 -->
		
		<!-- Latest compiled and minified CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
		
		<!-- jQuery library -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		
		<!-- CSS Files -->
		<link
			href="${pageContext.request.contextPath}/assets/css/argon-dashboard.css?v=1.1.2"
			rel="stylesheet" />
		<!-- Icons -->
		<link
			href="${pageContext.request.contextPath}/assets/js/plugins/nucleo/css/nucleo.css"
			rel="stylesheet" />
	
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
		<!-- NAVER SmartEditor2 스크립트 -->
		<script src="${pageContext.request.contextPath}/smarteditor2/js/HuskyEZCreator.js"></script>
		<script>
			$(document).ready(function(){
				$('#insertBtn').click(function(){
					if($('#noticeTitleText').val().length <= 0){
						alert('제목을 입력해주세요.');
						return;
						}
					if($('#lectureNoticeContent').val().length <= 0){
						alert('내용을 입력해주세요.');
						return;
						}
					$('#insertNoticeForm').submit();
					});
					// NAVER SmartEditor2 적용 코드
					let oEditors = [];				
					nhn.husky.EZCreator.createInIFrame({
						oAppRef : oEditors,
						elPlaceHolder : 'lectureNoticeContent',
						sSkinURI : '${pageContext.request.contextPath}/smarteditor2/SmartEditor2Skin.html',
						fCreator : 'createSEditor2'
					});
				});
		</script>
	</head>
	<body class="">
		<nav
			class="navbar navbar-vertical fixed-left navbar-expand-md navbar-light bg-white"
			id="sidenav-main">
			<div class="container-fluid">
				<!-- 내비게이션 메인 메뉴 -->
				<jsp:include page="/WEB-INF/view/auth/teacher/include/menu.jsp" />
			</div>
		</nav>
		<div class="main-content">
			<!-- 내비게이션 상단 메뉴 -->
			<div class="container-fluid">
				<jsp:include page="/WEB-INF/view/auth/teacher/include/lectureMenu.jsp" />
			</div>
			<!-- Header -->
			<div class="header bg-gradient-primary pb-8 pt-5 pt-md-8">
				<div class="container-fluid">
					<div class="header-body">
						<!-- Card stats -->
						<div class="row">
							<div class="col-xl-3 col-lg-6">
								<div class="card card-stats mb-4 mb-xl-0">
									<div class="card-body">
										<div class="row">
											<div class="col">
												<h5 class="card-title text-uppercase text-muted mb-0">접속자
													현황</h5>
												<span class="h2 font-weight-bold mb-0">350,897</span>
											</div>
											<div class="col-auto">
												<div
													class="icon icon-shape bg-danger text-white rounded-circle shadow">
													<i class="fas fa-chart-bar"></i>
												</div>
											</div>
										</div>
										<p class="mt-3 mb-0 text-muted text-sm">
											<span class="text-nowrap">누적 접속자</span> <span
												class="text-success mr-2">1,000,000,000</span>
										</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="container-fluid mt--7">
				<!-- Form -->
				<form method="post" action="${PageContext.request.contextPath}/auth/teacher/lecture/${lectureNo}/notice/insertNotice" id="insertNoticeForm">
					<!-- Table -->
					<div class="row">
						<div class="col">
							<div class="card shadow">
								<div class="card-header bg-white border-0">
									<div class="row align-items-center">
										<br>
										<div class="col-8">
											<h3 class="mb-0">공지사항 작성</h3>
										</div>
										<div class="col-4 text-right">
											<button type="button" class="btn btn-sm btn-success" style="float: right;" id="insertBtn">입력</button>
										</div>
										<br>
									</div>
								</div>
								<div class="table-responsive">
									<table class="table align-items-center table-flush">
										<tbody>
											<tr>
												<td>제목</td>
												<td>
													<input type="text" class="form-control" name="lectureNoticeTitle" id="noticeTitleText">
												</td>
											</tr>
											<tr>
												<td>내용</td>
												<td>
													<textarea rows="22" class="form-control" name="lectureNoticeContent" id="lectureNoticeContent" style="width:100%"></textarea>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</body>
</html>