<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Update Question Comment</title>
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
		<script>
			$(document).ready(function() {
				// 댓글 수정 버튼
				$('#updateBtn').click(function(){
					if($('#qnaCommentContent').val().length < 1){
						alert('내용을 입력해 주세요.');
						return;
					}
					$('#updateCommentForm').submit();
				});
			});
		</script>
</head>
<body>
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
			
			<div class="container-fluid mt--7">
				<div class="card shadow">
					<div class="card-header border-0">
						<div class="row align-items-center">
							<div class="col-8">
								<h3 class="mb-0">댓글 수정</h3>
							</div>
							<div class="col-4 text-right">
								<a class="btn btn-sm btn-dark" href="${pageContext.request.contextPath}/auth/student/lecture/${lectureNo}/notice/noticeList/1">목록</a>
							</div>
						</div>
					</div>	

		<form method="post" id="updateCommentForm" action="${pageContext.request.contextPath}/auth/student/lecture/${lectureNo}/qna/qnaOne/${questionNo}/updateStduentQuestionComment/${questionPassword}">
		<input type="hidden" name="questionNo" value="${questionComment.questionNo}">
		<input type="hidden" name="questionCommentNo" value="${questionComment.questionCommentNo}" readonly="readonly"  class="form-control">
		<input type="hidden" name="questionCommentWriter" value="${questionComment.questionCommentWriter}" readonly="readonly" class="form-control">
			<table class="table">
				<tr>
					<td><textarea rows="22px" style="width:100%;" name="questionCommentContent" id="qnaCommentContent" class="form-control">${questionComment.questionCommentContent}</textarea></td>
				</tr>
			</table>
			 <div style="text-align: right;"><button type="button" id="updateBtn" class="btn btn-outline-primary">댓글입력</button></div>
		</form>
		</div>
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