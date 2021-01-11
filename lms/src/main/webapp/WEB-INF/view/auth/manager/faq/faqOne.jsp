<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>FaqOne</title>
		
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
	</head>
	
	<body>
		<!-- 내비게이션 메인 메뉴 -->
		<jsp:include page="/WEB-INF/view/auth/manager/include/menu.jsp" />
		<div class="main-content">
			<!-- 내비게이션 상단 메뉴 -->
			<div class="container-fluid">
				<jsp:include page="/WEB-INF/view/auth/manager/include/topMenu.jsp" />
			</div>
	
			<!-- 접속자 -->
			<jsp:include page="/WEB-INF/view/auth/manager/include/connector.jsp" />
	
			<!-- Page content -->
			<div class="container-fluid mt--7">
				<!-- Table -->
				<div class="row">
					<div class="col">
						<div class="card shadow">
							<div class="card-header bg-white border-0">
								<div class="row align-items-center">
									<div class="col-8">
										<h3 class="mb-0">FAQ 조회</h3>
									</div>
									<div class="col-4 text-right">
										<button type="button" class="btn btn-sm btn-dark" onclick="location.href='${pageContext.request.contextPath}/auth/manager/faq/faqList/1'">목록</button>
										<button type="button" class="btn btn-sm btn-primary" onclick="location.href='${pageContext.request.contextPath}/auth/manager/faq/updateFaq/${faq.faqNo}'">수정</button>
										<button type="button" class="btn btn-sm btn-danger" data-toggle="modal" data-target="#modal-notification">삭제</button>
									</div>
									<div class="modal fade" id="modal-notification" tabindex="-1"
										role="dialog" aria-labelledby="modal-notification" aria-hidden="true">
										<div class="modal-dialog modal-danger modal-dialog-centered modal-"
											role="document">
											<div class="modal-content bg-gradient-danger">
								
												<div class="modal-header">
													<h6 class="modal-title" id="modal-title-notification">경고</h6>
													<button type="button" class="close" data-dismiss="modal"
														aria-label="Close">
														<span aria-hidden="true">×</span>
													</button>
												</div>
								
												<div class="modal-body">
								
													<div class="py-3 text-center">
														<i class="ni ni-bell-55 ni-3x"></i>
														<h4 class="heading mt-4">삭제 확인</h4>
														<p>게시물을 삭제하시겠습니까?</p>
													</div>
								
												</div>
								
												<div class="modal-footer">
													<button type="button" class="btn btn-white" data-dismiss="modal">취소</button>
													<button type="button" class="btn btn-link text-white ml-auto" onclick="location.href='${pageContext.request.contextPath}/auth/manager/faq/deleteFaq/${faq.faqNo}'">삭제</button>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
	
							<div class="table-responsive">
								<table class="table align-items-center table-flush">
									<tr>
										<th width="10%">번호</th>
										<td width="40%">${faq.faqNo}</td>
										<th width="10%">카테고리</th>
										<td width="40%">${faq.faqCategory}</td>
									</tr>
									<tr>
										<th>작성자</th>
										<td>${faq.faqWriter}</td>
										<th>조회수</th>
										<td>${faq.faqCount}</td>
									<tr>
									<tr>
										<th>작성일시</th>
										<td>${faq.faqCreatedate}</td>
										<th>수정일시</th>
										<td>${faq.faqUpdatedate}</td>
									</tr>
									<tr>
										<th>제목</th>
										<td colspan="3">${faq.faqTitle}</td>
									</tr>
									<tr>
										<th>내용</th>
										<td colspan="3">${faq.faqContent}</td>
									</tr>
								</table>
							</div>
						</div>
					</div>
				</div>
				<!-- Footer -->
				<jsp:include page="/WEB-INF/view/auth/include/footer.jsp"></jsp:include>
			</div>
		</div>
		<!--   Core   -->
		<script
			src="${pageContext.request.contextPath}/assets/js/plugins/jquery/dist/jquery.min.js"></script>
		<script
			src="${pageContext.request.contextPath}/assets/js/plugins/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
		<!--   Optional JS   -->
		<script
			src="${pageContext.request.contextPath}/assets/js/plugins/chart.js/dist/Chart.min.js"></script>
		<script
			src="${pageContext.request.contextPath}/assets/js/plugins/chart.js/dist/Chart.extension.js"></script>
		<!--   Argon JS   -->
		<script
			src="${pageContext.request.contextPath}/assets/js/argon-dashboard.min.js?v=1.1.2"></script>
		<script src="https://cdn.trackjs.com/agent/v3/latest/t.js"></script>
		<script>
			window.TrackJS && TrackJS.install({
				token : "ee6fab19c5a04ac1a32a645abde4613a",
				application : "argon-dashboard-free"
			});
		</script>
	</body>
</html>