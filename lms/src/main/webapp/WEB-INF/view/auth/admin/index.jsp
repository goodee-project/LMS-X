<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>index</title>
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
	<jsp:include page="/WEB-INF/view/auth/admin/include/menu.jsp" />
	<div class="main-content">
		<div class="container-fluid">
			<jsp:include page="/WEB-INF/view/auth/admin/include/noLectureMenu.jsp" />
		</div>
		<!-- Header -->
		<div class="header bg-gradient-primary pt-5 pt-md-8" >
		</div>

		<div class="container-fluid mt--5">
			<!-- Table -->
			<div class="row">
				<div class="col">
					<div class="card shadow">
						<div class="card-header bg-white border-0">
							<div class="row align-items-center">
								<div class="col-6">
									<h3 class="mb-0">운영자 목록</h3>
								</div>
								<div class="col-6 text-right">
									<form method="get" action="${pageContext.request.contextPath}/auth/admin/index/1">
										<div class="input-group">
											<select class="form-control" name="managerPosition">
												<c:if test="${manager.managerPosition == null}">
													<option value="" selected="selected">==전체==</option>
													<option value="사원">사원</option>
													<option value="대리">대리</option>
													<option value="팀장">팀장</option>
												</c:if>
												<c:if test="${manager.managerPosition == '사원'}">
													<option value="">==전체==</option>
													<option value="사원" selected="selected">사원</option>
													<option value="대리">대리</option>
													<option value="팀장">팀장</option>
												</c:if>
												<c:if test="${manager.managerPosition == '대리'}">
													<option value="">==전체==</option>
													<option value="사원">사원</option>
													<option value="대리" selected="selected">대리</option>
													<option value="팀장">팀장</option>
												</c:if>
												<c:if test="${manager.managerPosition == '팀장'}">
													<option value="" selected="selected">==전체==</option>
													<option value="사원">사원</option>
													<option value="대리">대리</option>
													<option value="팀장" selected="selected">팀장</option>
												</c:if>
											</select>
											
											<input type="text" class="form-control" name="managerName" placeholder="이름을 검색해주세요." value="${manager.managerName}">
											
											<div class="input-group-append" style="z-index:0;">
												<button type="submit" class="btn btn-primary">검색</button>
											</div>
										</div>
									</form>
								</div>
							</div>
						</div>
						
						<div class="table-responsive" style="min-height: 480px;">
							<table class="table align-items-center table-flush text-center">
								<thead class="thead-light">
									<tr>
										<th width="15%">아이디</th>
										<th width="8%">직책</th>
										<th width="10%">이름</th>
										<th width="7%" >성별</th>
										<th width="11%" >생일</th>
										<th width="18%">이메일</th>
										<th width="13%">연락처</th>
										<th width="13%">승인날짜</th>
										<th width="8%">탈퇴</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="m" items="${managerList}">
										<tr>
											<td><a href="${pageContext.request.contextPath}/auth/admin/managerOne/${m.managerId}">${m.managerId}</a></td>
											<td>${m.managerPosition}</td>
											<td>${m.managerName}</td>
											<td>${m.managerGender}</td>
											<td>${m.managerBirth}</td>
											<td>${m.managerEmail}</td>
											<td>${m.managerPhone}</td>
											<td>${m.managerAccessdate}</td>
											<td>
												<!-- ALERT -->
												<div>
													<button type="button" class="btn btn-sm btn-danger"
														data-toggle="modal" data-target="#modal-notification-${m.managerId}">탈퇴</button>
													<div class="modal fade" id="modal-notification-${m.managerId}" tabindex="-1"
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
																		<h4 class="heading mt-4">탈퇴 처리 확인</h4>
																		<p>${m.managerId} 운영자를 탈퇴처리하시겠습니까?</p>
																	</div>
												
																</div>
												
																<div class="modal-footer">
																	<button type="button" class="btn btn-white" data-dismiss="modal">취소</button>
																	<button type="button" class="btn btn-link text-white ml-auto" onclick="location.href='${pageContext.request.contextPath}/auth/admin/deleteManager/${currentPage}/${m.managerId}?managerPosition=${managerSearch.managerPosition}&managerName=${managerSearch.managerName}'">탈퇴</button>
																</div>
															</div>
														</div>
													</div>
												</div>
											</td>
										</tr>
									</c:forEach>
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
											<a class="page-link" href="${pageContext.request.contextPath}/auth/admin/index/1?managerPosition=${managerSearch.managerPosition}&managerName=${managerSearch.managerName}">
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
											<a class="page-link" href="${pageContext.request.contextPath}/auth/admin/index/${prePage}?managerPosition=${managerSearch.managerPosition}&managerName=${managerSearch.managerName}">
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
													<a class="page-link" href="${pageContext.request.contextPath}/auth/admin/index/${i}?managerPosition=${managerSearch.managerPosition}&managerName=${managerSearch.managerName}">${i}</a>
												</li>
											</c:otherwise>
										</c:choose>
									</c:if>
								</c:forEach>
						
								<!-- 다음 버튼 -->
								<c:choose>
									<c:when test="${currentPage < lastPage}">
										<li class="page-item">
											<a class="page-link" href="${pageContext.request.contextPath}/auth/admin/index/${nextPage}?managerPosition=${managerSearch.managerPosition}&managerName=${managerSearch.managerName}">
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
											<a class="page-link" href="${pageContext.request.contextPath}/auth/admin/index/${lastPage}?managerPosition=${managerSearch.managerPosition}&managerName=${managerSearch.managerName}">
												<i class='fas fa-angle-double-right'></i>
											</a>
										</li>
									</c:when>
									<c:otherwise>
										<li class="page-item disabled">
											<a class="page-link"  href="#" >
												<i class='fas fa-angle-double-right'></i>
											</a>
										</li>
									</c:otherwise>
								</c:choose>
							</ul>
							
							<!-- 총 페이지 수 출력 -->
							<table style="margin: auto; margin-top: 20px;">
								<tr>
									<td>
										<button type="button" class="btn btn-sm btn-outline-primary">
											${currentPage} / ${lastPage} 페이지</button>
									</td>
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