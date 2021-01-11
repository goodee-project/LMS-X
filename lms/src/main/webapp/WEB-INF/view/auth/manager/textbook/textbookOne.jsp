<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>textbookOne</title>
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
								<br>
								<div class="col-8">
									<h3 class="mb-0">교재 정보 조회</h3>
								</div>
								<div class="col-4 text-right">
									<button type="button" class="btn btn-sm btn-dark"  onclick="location.href='${pageContext.request.contextPath}/auth/manager/textbook/textbookList/1'">목록</button>
									<button type="button" class="btn btn-sm btn-primary" onclick="location.href='${pageContext.request.contextPath}/auth/manager/textbook/updateTextbook/${textbook.textbookIsbn}'">수정</button>
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
													<p>교재를 삭제하시겠습니까?</p>
												</div>
							
											</div>
							
											<div class="modal-footer">
												<button type="button" class="btn btn-white" data-dismiss="modal">취소</button>
												<button type="button" class="btn btn-link text-white ml-auto" onclick="location.href='${pageContext.request.contextPath}/auth/manager/textbook/deleteTextbook/${textbook.textbookIsbn}'">삭제</button>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>	
							<div class="table-responsive">
								<table class="table align-items-center table-flush">
									<tr>
										<th width="10%">교재 번호</th>
										<td width="40%">${textbook.textbookIsbn}</td>
										<th width="10%">교재 출판사</th>
										<td width="40%">${textbook.textbookPublisher}</td>
									</tr>
									<tr>
										<th>교재 이름</th>
										<td>${textbook.textbookTitle}</td>
										<th>교재 저자</th>
										<td>${textbook.textbookWriter}</td>
									</tr>
									<tr>
										<th>교재 출판일</th>
										<td>${textbook.textbookPublishdate}</td>
										<th>교재 가격</th>
										<td>${textbook.textbookPrice}원</td>
									</tr>
									<tr>
										<th>교재 정보</th>
										<td colspan="3">${textbook.textbookInfo}</td>
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