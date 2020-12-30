<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		
		<title>faqList</title>
		
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
				<jsp:include page="/WEB-INF/view/auth/teacher/include/noLectureMenu.jsp" />
			</div>
					
	    	<!-- 접속자 -->
			<jsp:include page="/WEB-INF/view/auth/teacher/include/connector.jsp" />
			
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
										<h3 class="mb-0">FAQ 목록</h3>
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
											<th width="10%">카테고리</th>
											<th width="40%">제목</th>
											<th width="15%">작성자</th>
											<th width="20%">작성일</th>
											<th width="10%">조회수</th>
										</tr>
									</thead>
									<tbody>
										<c:if test="${faqList[0].faqNo != null}">
											<c:forEach var="fl" items="${faqList}">
												<tr>
													<td>${fl.faqNo}</td>
													<td>${fl.faqCategory}</td>
													<td>
														<a href="${pageContext.request.contextPath}/auth/teacher/faq/faqOne/${fl.faqNo}">${fl.faqTitle}</a>
													</td>
													<td>${fl.faqWriter}</td>
													<td>${fl.faqCreatedate}</td>
													<td>${fl.faqCount}</td>
												</tr>
											</c:forEach>
										</c:if>
										<c:if test="${faqList[0].faqNo == null}">
											<tr>
												<td colspan="6">(등록된 LMS 시스템 FAQ가 없습니다)</td>
											</tr>
										</c:if>
									</tbody>
								</table>
							</div>
							
							<div class="card-footer py-4">
								<!-- 페이지 내비게이션 -->
								<ul class="pagination justify-content-center">
									<!-- 처음으로 버튼 -->
									<c:choose>
										<c:when test="${currentPage > 1}">
											<li class="page-item">
												<a class="page-link" href="${pageContext.request.contextPath}/auth/teacher/faq/faqList/1?searchCategory=${searchCategory}&searchOption=${searchOption}&searchText=${searchText}">
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
												<a class="page-link" href="${pageContext.request.contextPath}/auth/teacher/faq/faqList/${prePage}?searchCategory=${searchCategory}&searchOption=${searchOption}&searchText=${searchText}">
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
														<a class="page-link" href="${pageContext.request.contextPath}/auth/teacher/faq/faqList/${i}?searchCategory=${searchCategory}&searchOption=${searchOption}&searchText=${searchText}">${i}</a>
													</li>
												</c:otherwise>
											</c:choose>
										</c:if>
									</c:forEach>
									
									<!-- 다음 버튼 -->
									<c:choose>
										<c:when test="${currentPage < lastPage}">
											<li class="page-item">
												<a class="page-link" href="${pageContext.request.contextPath}/auth/teacher/faq/faqList/${nextPage}?searchCategory=${searchCategory}&searchOption=${searchOption}&searchText=${searchText}">
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
												<a class="page-link" href="${pageContext.request.contextPath}/auth/teacher/faq/faqList/${lastPage}?searchCategory=${searchCategory}&searchOption=${searchOption}&searchText=${searchText}">
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
								<form method="get" action="${pageContext.request.contextPath}/auth/teacher/faq/faqList/1" class="form-inline">
									<div class="input-group" style="width: 70%; margin: auto;">
										<div class="input-group-prepend">
											<span class="input-group-text">카테고리</span>
										</div>
										
										<select class="form-control" name="searchCategory">
											<c:if test="${searchCategory == ''}">
												<option value="" selected="selected">== 카테고리 선택 ==</option>
											</c:if>
											<c:if test="${searchCategory != ''}">
												<option value="">== 카테고리 선택 ==</option>
											</c:if>
											<c:if test="${searchCategory == '과제 제출'}">
												<option value="과제 제출" selected="selected">과제 제출</option>
											</c:if>
											<c:if test="${searchCategory != '과제 제출'}">
												<option value="과제 제출">과제 제출</option>
											</c:if>
											<c:if test="${searchCategory == '정보 확인'}">
												<option value="정보 확인" selected="selected">정보 확인</option>
											</c:if>
											<c:if test="${searchCategory != '정보 확인'}">
												<option value="정보 확인">정보 확인</option>
											</c:if>
										</select>
										
										<div class="input-group-prepend">
											<span class="input-group-text">검색</span>
										</div>
										
										<select class="form-control" name="searchOption">
											<c:if test="${searchOption == 'titleContent'}">
												<option value="titleContent" selected="selected">제목 + 내용</option>
											</c:if>
											<c:if test="${searchOption != 'titleContent'}">
												<option value="titleContent">제목 + 내용</option>
											</c:if>
											<c:if test="${searchOption == 'title'}">
												<option value="title" selected="selected">제목</option>
											</c:if>
											<c:if test="${searchOption != 'title'}">
												<option value="title">제목</option>
											</c:if>
											<c:if test="${searchOption == 'content'}">
												<option value="content" selected="selected">내용</option>
											</c:if>
											<c:if test="${searchOption != 'content'}">
												<option value="content">내용</option>
											</c:if>
										</select>
										
										<input type="text" class="form-control" name="searchText" value="${searchText}">
										
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