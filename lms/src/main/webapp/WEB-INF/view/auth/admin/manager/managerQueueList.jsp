<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>managerQueueList</title>
	<!-- Favicon -->
	<link href="${pageContext.request.contextPath}/assets/img/brand/favicon.png" rel="icon" type="image/png">
	<!-- Fonts -->
	<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
	<!-- Icons -->
	<link href="${pageContext.request.contextPath}/assets/js/plugins/nucleo/css/nucleo.css"	rel="stylesheet" />
	<link href="${pageContext.request.contextPath}/assets/js/plugins/@fortawesome/fontawesome-free/css/all.min.css"	rel="stylesheet" />
	<!-- CSS Files -->
	<link href="${pageContext.request.contextPath}/assets/css/argon-dashboard.css?v=1.1.2" rel="stylesheet" />
	<!-- jQuery / Ajax Google CDN -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/view/auth/admin/include/menu.jsp"/>
	<div class="main-content">
		<div class="container-fluid">
			<jsp:include page="/WEB-INF/view/auth/admin/include/noLectureMenu.jsp" />
		</div>
		<!-- Header -->
		<div class="header bg-gradient-primary  pt-5 pt-md-8" >
		</div>

		<div class=" container-fluid mt--5">
			<!-- Table -->
			<div class="row">
				<div class="col">
					<div class="card shadow" style="margin-top: 10px;">
						<div class="card-header border-0">
							<div class="row align-items-center">
								<div class="col-8">
									<h3 class="mb-0">운영자 승인 목록</h3>
								</div>
								<div class="col-4 text-right">
								</div>
							</div>
						</div>
						
						<div class="table-responsive" style="min-height: 480px;">
							<table class="table align-items-center table-flush text-center">
								<thead class="thead-light">
									<tr>
										<th width="15%">아이디</th>
										<th width="18%">이메일</th>
										<th width="13%">핸드폰번호</th>
										<th width="10%">이름</th>
										<th width="7%">성별</th>
										<th width="11%">생일</th>
										<th width="15%">주소</th>
										<th width="8%">승인</th>
										<th width="8%">거절</th>
									</tr>
								</thead>
								<tbody>
									<c:if test="${!empty managerQueueList}">
										<c:forEach var="mql" items="${managerQueueList}">
											<tr>
												<td style="font-size: 13px;">${mql.managerId}</td>
												<td style="font-size: 13px;">${mql.managerEmail}</td>
												<td style="font-size: 13px;">${mql.managerPhone}</td>
												<td style="font-size: 13px;">${mql.managerName}</td>
												<td style="font-size: 13px;">${mql.managerGender}</td>
												<td style="font-size: 13px;">${mql.managerBirth}</td>
												<td style="font-size: 10px;">${mql.managerAddressMain}<br> ${mql.managerAddressSub}</td>
												<td style="font-size: 13px;">
													<button type="button" class="btn btn-sm btn-success" data-toggle="modal" data-target="#modal-default-${mql.managerId}">승인</button>
													<div class="modal fade" id="modal-default-${mql.managerId}" tabindex="-1"
														role="dialog" aria-labelledby="modal-default" aria-hidden="true">
														<div class="modal-dialog modal- modal-dialog-centered modal-"
															role="document">
															<div class="modal-content">
												
																<div class="modal-header">
																	<h6 class="modal-title" id="modal-title-notification">확인</h6>
																	<button type="button" class="close" data-dismiss="modal"
																		aria-label="Close">
																		<span aria-hidden="true">×</span>
																	</button>
																</div>
												
																<div class="modal-body">
												
																	<div class="py-3 text-center">
																		<i class="ni ni-bell-55 ni-3x"></i>
																		<h4 class="heading mt-4">승인 확인</h4>
																		<p>${mql.managerId} 운영자의 회원가입을 승인하시겠습니까?</p>
																	</div>
												
																</div>
												
																<div class="modal-footer">
																	<button type="button" class="btn btn-link" data-dismiss="modal">취소</button>
																	<button type="button" class="btn btn-primary ml-auto" onclick="location.href='${pageContext.request.contextPath}/auth/admin/accessManager/${currentPage}/${mql.managerId}'">승인</button>
																</div>
															</div>
														</div>
													</div>	
												</td>
												<td style="font-size: 13px;">
													<button type="button" class="btn btn-sm btn-danger" data-toggle="modal" data-target="#modal-notification-${mql.managerId}">거절</button>
													<div class="modal fade" id="modal-notification-${mql.managerId}" tabindex="-1"
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
																		<h4 class="heading mt-4">거절 확인</h4>
																		<p>${mql.managerId} 운영자의 회원가입을 거절하시겠습니까?</p>
																	</div>
												
																</div>
												
																<div class="modal-footer">
																	<button type="button" class="btn btn-white" data-dismiss="modal">취소</button>
																	<button type="button" class="btn btn-link text-white ml-auto" onclick="location.href='${pageContext.request.contextPath}/auth/admin/negativeManager/${currentPage}/${mql.managerId}'">거절</button>
																</div>
															</div>
														</div>
													</div>	
												</td>
											</tr>
										</c:forEach>
									</c:if>
									<c:if test="${empty managerQueueList}">
										<tr>
											<td colspan="9">(승인 대기중인 운영자가 없습니다)</td>
										</tr>
									</c:if>
								</tbody>
							</table>
						</div>
						
						<div class="card-footer py-4">
							<nav>
								<ul class="pagination justify-content-center">
									<!-- 처음으로 버튼 -->
									<c:choose>
										<c:when test="${currentPage > 1}">
											<li class="page-item">
												<a class="page-link" href="${pageContext.request.contextPath}/auth/admin/managerQueue/1">
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
												<a class="page-link" href="${pageContext.request.contextPath}/auth/admin/managerQueue/${prePage}">
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
														<a class="page-link" href="${pageContext.request.contextPath}/auth/admin/managerQueue/${i}">${i}</a>
													</li>
												</c:otherwise>
											</c:choose>
										</c:if>
									</c:forEach>
									
									<!-- 다음 버튼 -->
									<c:choose>
										<c:when test="${currentPage < lastPage}">
											<li class="page-item">
												<a class="page-link" href="${pageContext.request.contextPath}/auth/admin/managerQueue/${nextPage}">
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
												<a class="page-link" href="${pageContext.request.contextPath}/auth/admin/managerQueue/${lastPage}">
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
											<button type="button" class="btn btn-sm btn-outline-primary">
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
	<script	src="${pageContext.request.contextPath}/assets/js/plugins/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
	<!--   Optional JS   -->
	<!--   Argon JS   -->
	<script src="${pageContext.request.contextPath}/assets/js/argon-dashboard.min.js?v=1.1.2"></script>
	<script src="https://cdn.trackjs.com/agent/v3/latest/t.js"></script>
	<script>
		window.TrackJS && TrackJS.install({
			token : "ee6fab19c5a04ac1a32a645abde4613a",
			application : "argon-dashboard-free"
		});
	</script>
</body>
</html>