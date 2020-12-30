<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>QnA</title>
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
			<jsp:include page="/WEB-INF/view/auth/teacher/include/connector.jsp" />
		   	<div class="container-fluid mt--7">
				<div class="card shadow">
					<div class="card-header border-0">
						<div class="row align-items-center">
							<div class="col">
								<h2 class="mb-0">질문 목록</h2>
							</div>
						</div>
					</div>
					<div class="row align-items-center">
						<div class="col-12">
							<table class="table">
								<thead class="thead-light">
									<tr>
										<td>질문 번호</td>
										<td>질문 제목</td>
										<td>작성자</td>
										<td>작성일</td>
										<td>조회수</td>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="q" items="${question}">
										<tr>
											<td>${q.questionNo}</td>
											<td><a href="${pageContext.request.contextPath}/auth/student/lecture/${q.lectureNo}/qna/qnaOne/${q.questionNo}/1/0">${q.questionTitle}</a></td>
											<td>${q.questionWriter}</td>
											<td>${q.questionCreatedate}</td>
											<td>${q.questionCount}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<a class="btn btn-outline-primary" style="text-align: right;" href="${pageContext.request.contextPath}/auth/student/lecture/${lectureNo}/qna/insertQna">질문 작성</a>
						</div>					
					</div>				
					<div class="row align-items-center mt-5">	
						<div class="col-12">
							<!-- 페이지 네비게이션 -->
							<ul class="pagination justify-content-center">
								<!-- 처음으로 버튼 -->
								<c:choose>
									<c:when test="${currentPage > 1}">
										<li class="page-item">
											<a class="page-link" href="${pageContext.request.contextPath}/auth/student/lecture/${lectureNo}/qna/qnaList/1">
												<i class='fas fa-angle-double-left'></i>
											</a>
										</li>
									</c:when>
									<c:otherwise>
										<li class="page-item disabled">
											<a class="page-link" href="#">
												<i class='fas fa-angle-double-left'></i>
											</a>
										</li>
									</c:otherwise>
								</c:choose>
								
								<!-- 이전 버튼 -->
								<c:choose>
									<c:when test="${currentPage > 1}">
										<li class="page-item">
											<a class="page-link" href="${pageContext.request.contextPath}/auth/student/lecture/${lectureNo}/qna/qnaList/${prePage}">
												<i class='fas fa-angle-left'></i>
											</a>
										</li>
									</c:when>
									<c:otherwise>
										<li class="page-item disabled">
											<a class="page-link" href="#">
												<i class='fas fa-angle-left'></i>
											</a>
										</li>
									</c:otherwise>
								</c:choose>
								
								<!-- 현재 페이지 표시 -->
								<c:forEach var="i" begin="${navFirstPage}" end="${navLastPage}">
									<c:if test="${i <= lastPage}">
										<c:choose>
											<%-- 현재 페이지 --%>
											<c:when test="${i == currentPage}">
												<li class="page-item active">
													<a class="page-link" href="#">${i}</a>
												</li>
											</c:when>
											<%-- 현재 페이지가 아닌 선택 가능한 페이지 --%>
											<c:otherwise>
												<li class="page-item">
													<a class="page-link" href="${pageContext.request.contextPath}/auth/student/lecture/${lectureNo}/qna/qnaList/${i}">${i}</a>
												</li>
											</c:otherwise>
										</c:choose>
									</c:if>
								</c:forEach>
								
								<!-- 다음 버튼 -->
								<c:choose>
									<c:when test="${currentPage < lastPage}">
										<li class="page-item">
											<a class="page-link" href="${pageContext.request.contextPath}/auth/student/lecture/${lectureNo}/qna/qnaList/${nextPage}">
												<i class='fas fa-angle-right'></i>
											</a>
										</li>
									</c:when>
									<c:otherwise>
										<li class="page-item disabled">
											<a class="page-link" href="#">
												<i class='fas fa-angle-right'></i>
											</a>
										</li>
									</c:otherwise>
								</c:choose>
								
								<!-- 마지막으로 버튼 -->
								<c:choose>
									<c:when test="${currentPage < lastPage}">
										<li class="page-item">
											<a class="page-link" href="${pageContext.request.contextPath}/auth/student/lecture/${lectureNo}/qna/qnaList/${lastPage}">
												<i class='fas fa-angle-double-right'></i>
											</a>
										</li>
									</c:when>
									<c:otherwise>
										<li class="page-item disabled">
											<a class="page-link" href="#">
												<i class='fas fa-angle-double-right'></i>
											</a>
										</li>
									</c:otherwise>
								</c:choose>
							</ul>
							
							<!-- 총 페이지 수 출력 -->
							<table style="margin: auto;">
								<tr>
									<td>
										<button type="button" class="btn btn-outline-dark btn-sm">
											${currentPage} / ${lastPage} 페이지
										</button>
									</td>
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