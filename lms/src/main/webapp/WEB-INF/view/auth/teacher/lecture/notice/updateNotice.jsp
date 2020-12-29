<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		
		<title>updateNotice</title>
		
		<!-- Favicon -->
		<link href="${pageContext.request.contextPath}/assets/img/brand/favicon.png" rel="icon" type="image/png">
		
		<!-- Fonts -->
		<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
		
		<!-- Icons -->
		<link href="${pageContext.request.contextPath}/assets/js/plugins/nucleo/css/nucleo.css" rel="stylesheet" />
		<link href="${pageContext.request.contextPath}/assets/js/plugins/@fortawesome/fontawesome-free/css/all.min.css" rel="stylesheet" />
		
		<!-- CSS Files -->
		<link href="${pageContext.request.contextPath}/assets/css/argon-dashboard.css?v=1.1.2" rel="stylesheet" />
		
		<!-- jQuery library -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		
		<!-- Bootstrap 4 Icons -->
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
		
		<!-- jQuery library -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		
		<!-- NAVER SmartEditor2 스크립트 -->
		<script src="${pageContext.request.contextPath}/smarteditor2/js/HuskyEZCreator.js"></script>
		<script>
			$(document).ready(function() {
				$('#updateBtn').click(function() {
					// 스마트 에디터 내용 적용
					oEditors.getById["lectureNoticeContent"].exec("UPDATE_CONTENTS_FIELD", []);
					if ($('#noticeTitleText').val().length <= 0) {
						alert('제목을 입력해주세요.');
						return;
					}
					if ($('#lectureNoticeContent').val().length <= 0) {
						alert('내용을 입력해주세요.');
						return;
					}
					$('#updateNoticeForm').submit();
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
	
	<body>
		<!-- 내비게이션 메인 메뉴 -->
		<jsp:include page="/WEB-INF/view/auth/teacher/include/menu.jsp" />
		
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
												<h5 class="card-title text-uppercase text-muted mb-0">접속자 현황</h5>
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
			
			<!-- Page content -->
			<div class="container-fluid mt--7">
				<!-- Form -->
				<form method="post"
					action="${pageContext.request.contextPath}/auth/teacher/lecture/${lectureNo}/notice/updateNotice/${lectureNoticeNo}"
					id="updateNoticeForm">
					<!-- Table -->
					<div class="row">
						<div class="col">
							<div class="card shadow">
								<div class="card-header bg-white border-0">
									<div class="row align-items-center">
										<br>
										<div class="col-8">
											<h3 class="mb-0">공지사항 수정</h3>
										</div>
										<div class="col-4 text-right">
											<button type="button" class="btn btn-sm btn-dark" onclick="location.href='${pageContext.request.contextPath}/auth/teacher/lecture/${lectureNo}/notice/noticeOne/${lectureNoticeNo}'">목록</button>
											<button type="button" class="btn btn-sm btn-success" id="updateBtn">수정</button>
										</div>
										<br>
									</div>
								</div>
								<div class="table-responsive">
									<table class="table align-items-center table-flush">
										<tr>
											<td width="20%">번호</td>
											<td width="80%">
												<input type="text" class="form-control" value="${lectureNotice.lectureNoticeNo}" readonly="readonly">
											</td>
										</tr>
										<tr>
											<td>제목</td>
											<td>
												<input type="text" class="form-control" value="${lectureNotice.lectureNoticeTitle}" name="lectureNoticeTitle" id="noticeTitleText">
											</td>
										</tr>
										<tr>
											<td>내용</td>
											<td>
												<textarea class="form-control" rows="22" name="lectureNoticeContent" id="lectureNoticeContent" style="width:100%">
													${lectureNotice.lectureNoticeContent}
												</textarea>
											</td>
										</tr>
									</table>
								</div>
							</div>
						</div>
					</div>
				</form>
				
				<!-- Footer -->
				<jsp:include page="/WEB-INF/view/auth/include/footer.jsp"></jsp:include>
			</div>
		</div>
		<!--   Core   -->
		<script src="${pageContext.request.contextPath}/assets/js/plugins/jquery/dist/jquery.min.js"></script>
		<script
			src="${pageContext.request.contextPath}/assets/js/plugins/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
		<!--   Optional JS   -->
		<script src="${pageContext.request.contextPath}/assets/js/plugins/chart.js/dist/Chart.min.js"></script>
		<script src="${pageContext.request.contextPath}/assets/js/plugins/chart.js/dist/Chart.extension.js"></script>
		<!--   Argon JS   -->
		<script src="${pageContext.request.contextPath}/assets/js/argon-dashboard.min.js?v=1.1.2"></script>
		<script src="https://cdn.trackjs.com/agent/v3/latest/t.js"></script>
		<script>
	    window.TrackJS &&
	      TrackJS.install({
	        token: "ee6fab19c5a04ac1a32a645abde4613a",
	        application: "argon-dashboard-free"
	      });
	  </script>
	</body>
</html>