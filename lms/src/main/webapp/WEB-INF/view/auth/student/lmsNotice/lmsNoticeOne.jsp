<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>lmsNoticeOne</title>
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
		<!-- textArea자동조절 라이브러리 -->
		<script src="https://rawgit.com/jackmoore/autosize/master/dist/autosize.min.js"></script>
		<script>
			$(document).ready(function(){
				//textarea 크기 자동 조정
				autosize($("textArea"));
			});
		</script>
	</head>
	<body class="">
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
	    	
			
	    	<!-- 접속자 -->
			<jsp:include page="/WEB-INF/view/auth/student/include/connector.jsp" />
   			<div class="container-fluid mt--7">
				<div class="card shadow">
					<div class="card-header border-0">
						<div class="row align-items-center">
							<div class="col">
								<h3 class="mb-0">LMS 공지사항</h3>
							</div>
						</div>
					</div>
					<div class="row align-items-center">
						<div class="col-12">
							<table class="table">
								<tr>
									<td width="20%">제목</td>
									<td>${lmsNotice.lmsNoticeTitle}</td>
								</tr>
								<tr>
									<td>작성자</td>
									<td>${lmsNotice.lmsNoticeWriter}</td>
								</tr>	
								<tr>
									<td>작성일</td>
									<td>${lmsNotice.lmsNoticeCreatedate}}</td>
								</tr>	
								<tr>
									<td>조회수</td>
									<td>${lmsNotice.lmsNoticeCount}</td>
								</tr>	
								<tr>
									<td>내용</td>
									<td><textarea rows="20px" cols="100px" readonly="readonly" style="background-color:white; border-color:white" disabled>${lmsNotice.lmsNoticeContent}</textarea></td>
								</tr>	
							</table>
						</div>
					</div>	
				</div>
				<!-- Footer -->
				<jsp:include page="/WEB-INF/view/auth/include/footer.jsp"></jsp:include>		
			</div>
		</div>
		<!--   Core   -->
		<script src="${pageContext.request.contextPath}/assets/js/plugins/jquery/dist/jquery.min.js"></script>
		<script src="${pageContext.request.contextPath}/assets/js/plugins/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
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