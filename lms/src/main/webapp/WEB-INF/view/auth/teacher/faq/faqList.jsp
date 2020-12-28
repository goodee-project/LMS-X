<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>faqList</title>
		
		<!-- Bootstrap Framework 사용 -->
		
		<!-- Latest compiled and minified CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
		
		<!-- jQuery library -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		
		<!-- CSS Files -->
		<link
			href="${pageContext.request.contextPath}/assets/css/argon-dashboard.css?v=1.1.2"
			rel="stylesheet" />
		
		<!-- Icons -->
		<link
			href="${pageContext.request.contextPath}/assets/js/plugins/nucleo/css/nucleo.css"
			rel="stylesheet" />
		
		<!-- Popper JS -->
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
		
		<!-- Latest compiled JavaScript -->
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
		
		<!-- Bootstrap 4 Icons -->
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
		
		<style>
			.center {
				margin: auto;
				text-align: center;
			}
		
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
				background-color: #F9F9FB;
			}
		</style>
	</head>
	<body class="">
		<nav
			class="navbar navbar-vertical fixed-left navbar-expand-md navbar-light bg-white"
			id="sidenav-main">
			<div class="container-fluid">
				<!-- 내비게이션 메인 메뉴 -->
				<jsp:include page="/WEB-INF/view/auth/teacher/include/menu.jsp" />
			</div>
		</nav>
		<div class="main-content">
			<!-- 내비게이션 상단 메뉴 -->
			<div class="container-fluid">
				<jsp:include page="/WEB-INF/view/auth/teacher/include/noLectureMenu.jsp" />
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
												<h5 class="card-title text-uppercase text-muted mb-0">접속자
													현황</h5>
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
			<div class="container-fluid mt--7"> 
				<!-- Table -->
				<div class="row">
					<div class="col">
						<div class="card shadow">
							<div class="card-header bg-white border-0">
								<div class="row align-items-center">
									<br>
									<div class="col-8">
										<h3 class="mb-0">&nbsp;&nbsp;&nbsp;공지사항 목록</h3>
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
											<th>번호</th>
											<th>카테고리</th>
											<th>제목</th>
											<th>작성자</th>
											<th>작성일</th>
											<th>조회수</th>
										</tr>
									</thead>
									<tbody>
										<c:if test="${faqList[0].faqNo != null}">
											<c:forEach var="fl" items="${faqList}">
												<tr>
													<td width="10%">${fl.faqNo}</td>
													<td width="15%">${fl.faqCategory}</td>
													<td width="30%">
														<a href="${pageContext.request.contextPath}/auth/teacher/faq/faqOne/${fl.faqNo}">${fl.faqTitle}</a>
													</td>
													<td width="15%">${fl.faqWriter}</td>
													<td width="20%">${fl.faqCreatedate}</td>
													<td width="10%">${fl.faqCount}</td>
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
											<button type="button" class="btn btn-outline-dark btn-sm">
												${currentPage} / ${lastPage} 페이지
											</button>
										</td>
									</tr>
								</table>
							</div>
							<div class="card-footer py-4">
								<!-- 검색 -->
								<form method="get" action="${pageContext.request.contextPath}/auth/teacher/faq/faqList/1" class="form-inline">
									<div class="input-group mb-3 center" style="width: 70%;">
										<div class="input-group-prepend">
											<span class="input-group-text">
												<label class="form-check-label">
													카테고리
												</label>
											</span>
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
											<span class="input-group-text">
												<label class="form-check-label">
													검색
												</label>
											</span>
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
											<button type="submit" class="btn btn-secondary">검색</button>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>