<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Update Question Comment</title>
	<!-- Favicon -->
	<link href="${pageContext.request.contextPath}/assets/img/brand/favicon.png" rel="icon" type="image/png">
	<!-- Fonts -->
	<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
	<!-- Icons -->
	<link href="${pageContext.request.contextPath}/assets/js/plugins/nucleo/css/nucleo.css" rel="stylesheet" />
	<link
	href="${pageContext.request.contextPath}/assets/js/plugins/@fortawesome/fontawesome-free/css/all.min.css"
	rel="stylesheet" />
	<!-- CSS Files -->
	<link href="${pageContext.request.contextPath}/assets/css/argon-dashboard.css?v=1.1.2" rel="stylesheet" />
</head>
<body>

	<nav class="navbar navbar-vertical fixed-left navbar-expand-md navbar-light bg-white" id="sidenav-main">
		<div class="container-fluid">
			<jsp:include page="/WEB-INF/view/auth/student/include/menu.jsp" />
	    </div>	
	</nav>   		
	<div class="main-content">
		<!-- 상단 Navbar -->
		<div class="container-fluid">
			<jsp:include page="/WEB-INF/view/auth/student/include/topMenu.jsp" />
    	</div>
		<!-- 강좌 Navbar -->
		<div class="container-fluid">
			<jsp:include page="/WEB-INF/view/auth/student/include/lectureMenu.jsp" />
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
											<span class="text-nowrap">누적 접속자</span>
											<span class="text-success mr-2">1,000,000,000</span> 
										</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		<h1>댓글 수정</h1>
		<form method="post" action="${pageContext.request.contextPath}/auth/student/lecture/${lectureNo}/qna/qnaOne/${questionNo}/updateStduentQuestionComment">
		<input type="hidden" name="questionNo" value="${questionComment.questionNo}"> 
			<table class="table">
				<tr>
					<td>번호</td>
					<td><input type="text" name="questionCommentNo" value="${questionComment.questionCommentNo}" readonly="readonly"  class="form-control"></td>
				</tr>
				<tr>
					<td>작성자</td>
					<td><input type="text" name="questionCommentWriter" value="${questionComment.questionCommentWriter}" readonly="readonly" class="form-control"></td>
				</tr>
				<tr>
					<td>댓글 내용</td>
					<td><textarea rows="22px" style="width:100%;" name="questionCommentContent">${questionComment.questionCommentContent}</textarea></td>
				</tr>
			</table>
			<button type="submit" class="btn btn-outline-primary">댓글입력</button>
		</form>
</body>
</html>