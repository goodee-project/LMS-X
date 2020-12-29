<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
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
		<title>noticeDispatchList</title>
	</head>
	<body class="">
		<!-- 메인 Navbar -->	
		<jsp:include page="/WEB-INF/view/auth/student/include/menu.jsp" />
		<div class="main-content">
			<!-- 상단 Navbar -->
			<div class="container-fluid">
				<jsp:include page="/WEB-INF/view/auth/student/include/topMenu.jsp" />
	    	</div>
			<!-- 쪽지 Navbar -->
			<div class="container-fluid">
				<jsp:include page="/WEB-INF/view/auth/student/include/noteMenu.jsp" />
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
												<div class="icon icon-shape bg-danger text-white rounded-circle shadow">
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
   			<div class="container-fluid mt--7">
				<div class="card shadow">
					<div class="card-header border-0">
						<div class="row align-items-center">
							<div class="col">
								<h3 class="mb-0">발신함</h3>
							</div>
						</div>
					</div>
					<div class="row align-items-center">
						<div class="col-12">
							<table class="table">
								<thead class="thead-light">
									<tr>
										<th>상태</th>
										<th>제목</th>
										<th>받는 사람</th>
										<th>보낸 날짜</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="nl" items="${noteList}">
										<tr>
											<td>
												<c:if test="${nl.noteIsRead == 'Y'}">
													읽음
												</c:if>
												<c:if test="${nl.noteIsRead == 'N'}">
													!
												</c:if>
											</td>
											<td><a href="${pageContext.request.contextPath}/auth/student/note/noteDispatchOne/${nl.noteNo}">${nl.noteTitle}</a></td>
											<td>${nl.noteReceiverName}(${nl.noteReceiverId})</td>
											<td>${nl.noteSendDate}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
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
											<a class="page-link" href="${pageContext.request.contextPath}/auth/student/note/noteDispatchList/1">
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
											<a class="page-link" href="${pageContext.request.contextPath}/auth/student/note/noteDispatchList/${prePage}">
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
													<a class="page-link" href="${pageContext.request.contextPath}/auth/student/note/noteDispatchList/${i}">${i}</a>
												</li>
											</c:otherwise>
										</c:choose>
									</c:if>
								</c:forEach>
								
								<!-- 다음 버튼 -->
								<c:choose>
									<c:when test="${currentPage < lastPage}">
										<li class="page-item">
											<a class="page-link" href="${pageContext.request.contextPath}/auth/student/note/noteDispatchList/${nextPage}">
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
											<a class="page-link" href="${pageContext.request.contextPath}/auth/student/note/noteDispatchList/${lastPage}">
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
										<button type="button" class="btn btn-outline-primary btn-sm">
											${currentPage} / ${lastPage} 페이지
										</button>
									</td>
								</tr>
							</table>
							<!-- 검색 -->
							<div class="card-footer py-4 form-group">
								<form method="get" action="${pageContext.request.contextPath}/auth/student/note/noteDispatchList/1">
									<div class="input-group input-group-prepend" style="width: 70%; margin: auto;">
										<div class="input-group">
											<input type="text" class="form-control" id="searchText" name="searchText">
											<button type="submit" class="btn btn-outline-primary">검색</button>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>		
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