<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>lecturNoticeOne</title>
		<!-- Favicon -->
		<link href="${pageContext.request.contextPath}/assets/img/brand/favicon.png" rel="icon" type="image/png">
		<!-- Fonts -->
		<link
			href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700"
			rel="stylesheet">
		<!-- Icons -->
		<link href="${pageContext.request.contextPath}/assets/js/plugins/nucleo/css/nucleo.css" rel="stylesheet" />
		<link
			href="${pageContext.request.contextPath}/assets/js/plugins/@fortawesome/fontawesome-free/css/all.min.css"
			rel="stylesheet" />
		<!-- CSS Files -->
		<link href="${pageContext.request.contextPath}/assets/css/argon-dashboard.css?v=1.1.2" rel="stylesheet" />
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
	<body>
			<!-- 메인 Navbar -->
		
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
	    	
	    	<!-- 접속자 -->
			<jsp:include page="/WEB-INF/view/auth/student/include/connector.jsp" />
			<div class="container-fluid mt--7">
				<div class="card shadow">
					<div class="card-header border-0">
						<div class="row align-items-center">
							<div class="col-8">
								<h3 class="mb-0">공지사항 조회</h3>
							</div>
							<div class="col-4 text-right">
								<a class="btn btn-sm btn-dark" href="${pageContext.request.contextPath}/auth/student/lecture/${lectureNo}/notice/noticeList/1">목록</a>
							</div>
						</div>
					</div>	
					<div class="row align-items-center">
						<div class="col-12">
							<table class="table">
								<tr>
									<th width="10%">번호</th>
									<td width="40%">${lectureNotice.lectureNoticeNo}</td>
									<th width="10%">조회수</th>
									<td width="40%">${lectureNotice.lectureNoticeCount}</td>
								</tr>
								<tr>
									<th>작성일시</th>
									<td >${lectureNotice.lectureNoticeCreatedate}</td>
									<th>수정일시</th>
									<td >${lectureNotice.lectureNoticeUpdatedate}</td>
								</tr>
								<tr>
									<th>제목</th>
									<td colspan="3">${lectureNotice.lectureNoticeTitle}</td>
								</tr>
								<tr>
									<th>내용</th>
									<td colspan="3">${lectureNotice.lectureNoticeContent}</td>
								</tr>
							</table>
						</div>
					</div>
				</div>
				<!-- Footer -->
				<jsp:include page="/WEB-INF/view/auth/include/footer.jsp"></jsp:include> 
			</div>
		</div>
	</body>
</html>