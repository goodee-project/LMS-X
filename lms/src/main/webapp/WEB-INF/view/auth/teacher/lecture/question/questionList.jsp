<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		
		<title>questionList</title>
		
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
			}
		</style>
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
				<!-- Table -->
				<div class="row">
					<div class="col">
						<div class="card shadow">
							<div class="card-header bg-white border-0">
								<div class="row align-items-center">
									<br>
									<div class="col-8">
										<h3 class="mb-0">질문 목록</h3>
									</div>
									<div class="col-4 text-right">
									</div>
									<br>
								</div>
							</div>
							
							<div class="table-responsive">
								<table class="table align-items-center table-flush">
									<thead class="thead-light">
										<tr>
											<th width="10%">번호</th>
											<th width="45%">제목</th>
											<th width="15%">작성자</th>
											<th width="20%">작성일시</th>
											<th width="10%">조회수</th>
										</tr>
									</thead>
									<tbody>
										<c:if test="${!empty teacherQuestList}">
											<c:forEach items="${teacherQuestList}" var="q">
												<tr>
													<td>${q.questionNo}</td>
													<td><a href="${pageContext.request.contextPath}/auth/teacher/lecture/${lectureNo}/question/questionOne/${q.questionNo}/1">${q.questionTitle}</a></td>
													<td>${q.questionWriter}</td>
													<td>${q.questionCreatedate}</td>
													<td>${q.questionCount}</td>
												</tr>
											</c:forEach>
										</c:if>
										<c:if test="${empty teacherQuestList}">
											<tr>
												<td colspan="5">
													(등록된 질문이 없습니다)
												</td>
											</tr>
										</c:if>
									</tbody>
								</table>
							</div>
							<div class="card-footer py-4">
								<nav aria-label="...">
									<!-- 페이지 내비게이션 -->
									<ul class="pagination justify-content-center">
										<!-- 처음으로 버튼 -->
										<c:choose>
											<c:when test="${currentPage > 1}">
												<li class="page-item"><a class="page-link"
													href="${pageContext.request.contextPath}/auth/teacher/lecture/${lectureNo}/question/questionList/1">
														<i class='fas fa-angle-double-left'></i>
												</a></li>
											</c:when>
											<c:otherwise>
												<li class="page-item disabled"><a class="page-link"
													href="#"> <i class='fas fa-angle-double-left'></i>
												</a></li>
											</c:otherwise>
										</c:choose>
	
										<!-- 이전 버튼 -->
										<c:choose>
											<c:when test="${currentPage > 1}">
												<li class="page-item"><a class="page-link"
													href="${pageContext.request.contextPath}/auth/teacher/lecture/${lectureNo}/question/questionList/${prePage}">
														<i class='fas fa-angle-left'></i>
												</a></li>
											</c:when>
											<c:otherwise>
												<li class="page-item disabled"><a class="page-link"
													href="#"> <i class='fas fa-angle-left'></i>
												</a></li>
											</c:otherwise>
										</c:choose>
	
										<!-- 현재 페이지 표시 -->
										<c:forEach var="i" begin="${navFirstPage}" end="${navLastPage}">
											<c:if test="${i <= lastPage}">
												<c:choose>
													<%-- 현재 페이지 --%>
													<c:when test="${i == currentPage}">
														<li class="page-item active"><a class="page-link"
															href="#">${i}</a></li>
													</c:when>
													<%-- 현재 페이지가 아닌 선택 가능한 페이지 --%>
													<c:otherwise>
														<li class="page-item"><a class="page-link"
															href="${pageContext.request.contextPath}/auth/teacher/lecture/${lectureNo}/question/questionList/${i}">${i}</a>
														</li>
													</c:otherwise>
												</c:choose>
											</c:if>
										</c:forEach>
	
										<!-- 다음 버튼 -->
										<c:choose>
											<c:when test="${currentPage < lastPage}">
												<li class="page-item"><a class="page-link"
													href="${pageContext.request.contextPath}/auth/teacher/lecture/${lectureNo}/question/questionList/${nextPage}">
														<i class='fas fa-angle-right'></i>
												</a></li>
											</c:when>
											<c:otherwise>
												<li class="page-item disabled"><a class="page-link"
													href="#"> <i class='fas fa-angle-right'></i>
												</a></li>
											</c:otherwise>
										</c:choose>
	
										<!-- 마지막으로 버튼 -->
										<c:choose>
											<c:when test="${currentPage < lastPage}">
												<li class="page-item"><a class="page-link"
													href="${pageContext.request.contextPath}/auth/teacher/lecture/${lectureNo}/question/questionList/${lastPage}">
														<i class='fas fa-angle-double-right'></i>
												</a></li>
											</c:when>
											<c:otherwise>
												<li class="page-item disabled"><a class="page-link"
													href="#"> <i class='fas fa-angle-double-right'></i>
												</a></li>
											</c:otherwise>
										</c:choose>
									</ul>
									<!-- 총 페이지 수 출력 -->
									<table style="margin: auto;">
										<tr>
											<td>
												<button type="button" class="btn btn-outline-primary btn-sm">
													${currentPage} / ${lastPage} 페이지
												</button>
											</td>
										</tr>
									</table>
								</nav>
							</div>
						</div>
					</div>
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