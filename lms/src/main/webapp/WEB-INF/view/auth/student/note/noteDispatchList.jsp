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
		
		<style>
			.table {
				text-align: center;
			}
			
			.table td {
				vertical-align: middle;
			}
			
			th {
				text-align: center;
			}
		</style>
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
	    	
	    	<!-- 접속자 -->
			<jsp:include page="/WEB-INF/view/auth/student/include/connector.jsp" />
   			<div class="container-fluid mt--7">
   				<!-- Table -->
				<div class="row">
					<div class="col">
						<div class="card shadow">
							<div class="card-header border-0">
								<div class="row align-items-center">
									<div class="col">
										<h3 class="mb-0">쪽지 발신함</h3>
									</div>
								</div>
							</div>
							
							<div class="table-responsive">
								<table class="table align-items-center table-flush">
									<thead class="thead-light">
										<tr>
											<th width="20%">받는사람</th>
											<th width="50%">제목</th>
											<th width="10%">읽음여부</th>
											<th width="20%">날짜</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="nl" items="${noteList}">
											<tr>
												<td>${nl.noteReceiverName}(${nl.noteReceiverId})</td>
												<td><a href="${pageContext.request.contextPath}/auth/student/note/noteDispatchOne/${nl.noteNo}">${nl.noteTitle}</a></td>
												<td>
													<c:if test="${nl.noteIsRead == 'Y'}">
														읽음
													</c:if>
													<c:if test="${nl.noteIsRead == 'N'}">
														!
													</c:if>
													
												</td>
												<td>${nl.noteSendDate}</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>		
												
							<div class="card-footer py-4">			
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
							</div>
							
							<div class="card-footer py-4">
								<!-- 검색 -->
								<form method="get" action="${pageContext.request.contextPath}/auth/student/note/noteDispatchList/1">
									<div class="input-group" style="width: 40%; margin: auto;">
										<input type="text" class="form-control" id="searchText" name="searchText">
										
										<div class="input-group-append">
											<button type="submit" class="btn btn-primary">검색</button>
										</div>
									</div>
								</form>
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