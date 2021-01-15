<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>qnaPassword</title>
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
		<script>
			$(document).ready(function(){
				$('#questionPasswordBtn').click(function(){
					// 비밀번호가 맞는지 확인
					$.ajax({
						url: '${pageContext.request.contextPath}/auth/student/lecture/qna/checkQnaPassword/' +  ${questionNo},
						type:'post',
						success: function(data){
							console.log(data);
							// 제출기간이 아닐경우
							if(data != $('#questionPassword').val()){
								alert('비밀번호가 다릅니다.');
								document.getElementById('questionPassword').value = '';
								return;
							}
							$(location).attr('href', '${pageContext.request.contextPath}/auth/student/lecture/' + ${lectureNo} + '/qna/qnaOne/' + ${questionNo} + '/1/' + $('#questionPassword').val());
						}
					});
				})
			})
		</script>
	</head>
	<body class="">
		<!-- 메인 Navbar -->	
		<jsp:include page="/WEB-INF/view/auth/student/include/menu.jsp" />
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
   			<div class="container-fluid mt--7" style="width:50%">
				<div class="card shadow">
					<div class="card-header border-0">
						<div class="row align-items-center">
							<div class="col">
							</div>
						</div>
					</div>
					<div class="row align-items-center">
						<div class="col-12 align-items-center">
							<table class="table table-borderless" style="text-align:center;">
								<tr>
									<th><h2>비밀글입니다</h2></th>
								</tr>
								<tr>
			    					<td><input class="form-control" id="questionPassword" type="password" name="questionPassword"></td>
								</tr>
								<tr>
			    					<td><button id="questionPasswordBtn" type="button" class="btn btn-outline-primary">확인</button></td>
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
</html>