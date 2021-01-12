<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		
		<title>updateMultiplechoice</title>
		
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
		<script>
			$(document).ready(function(){
				$('#multiplechoiceQuestion').focus();		// 시작 시 폼 커서를 multiplechoiceQuestion쪽으로 이동
				
				// 버튼 클릭시 폼 내용의 유효성 검사를 수행
				$("#submitBtn").click(function() {
					if ($("#multiplechoiceQuestion").val().replace(/(\s*)/g, "") == "") {	// multiplechoiceQuestion이 공백인 경우 수행
						$("#modal-notification-question").modal("show");
						
						return;
					}
					
					if ($("#multiplechoiceScore").val().replace(/(\s*)/g, "") == "") {		// multiplechoiceScore이 공백인 경우 수행
						$("#modal-notification-score").modal("show");
					
						return;
					}
					
					let submitCk = true;
					$('.multiplechoiceExampleContent').each(function(index, item){
						if($(item).val().length < 1 && submitCk){
							$("#modal-notification-content").modal("show");
							
							submitCk = false;
							return;
						} 
					});
					
					if (submitCk) {
						$('#submitForm').submit();
					}
				});
			});
		</script>
	</head>
	
	<body>
		<!-- 내비게이션 메인 메뉴 -->
		<jsp:include page="/WEB-INF/view/auth/teacher/include/menu.jsp" />
		
		<div class="main-content">
			<!-- 내비게이션 상단 메뉴 -->
			<div class="container-fluid">
				<jsp:include page="/WEB-INF/view/auth/teacher/include/lectureMenu.jsp" />
			</div>
			
			<!-- 접속자 -->
			<jsp:include page="/WEB-INF/view/auth/teacher/include/connector.jsp" />
			
			<!-- Page content -->
			<div class="container-fluid mt--7">
				<!-- Table -->
				<div class="row">
					<div class="col">
						<div class="card shadow">
							<form method="post" action="${pageContext.request.contextPath}/auth/teacher/lecture/${lectureNo}/test/updateMultiplechoice/${multiplechoiceNo}" id="submitForm">
								<div class="card-header bg-white border-0">
									<div class="row align-items-center">
										<div class="col-8">
											<h3 class="mb-0">문제/보기 수정</h3>
										</div>
										<div class="col-4 text-right">
											<button type="button" class="btn btn-sm btn-dark" onclick="location.href='${pageContext.request.contextPath}/auth/teacher/lecture/${lectureNo}/test/multiplechoiceList/1'">목록</button>
											<button type="button" class="btn btn-sm btn-primary" id="submitBtn">수정</button>									
										</div>
										<div class="modal fade" id="modal-notification-question" tabindex="-1"
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
															<h4 class="heading mt-4">유효성 확인</h4>
															<p>문제를 입력하세요</p>
														</div>
									
													</div>
									
													<div class="modal-footer">
														<button type="button" class="btn btn-white ml-auto" data-dismiss="modal">확인</button>
													</div>
												</div>
											</div>
										</div>
										<div class="modal fade" id="modal-notification-score" tabindex="-1"
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
															<h4 class="heading mt-4">유효성 확인</h4>
															<p>점수를 입력하세요</p>
														</div>
									
													</div>
									
													<div class="modal-footer">
														<button type="button" class="btn btn-white ml-auto" data-dismiss="modal">확인</button>
													</div>
												</div>
											</div>
										</div>
										<div class="modal fade" id="modal-notification-content" tabindex="-1"
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
															<h4 class="heading mt-4">유효성 확인</h4>
															<p>보기를 입력하세요</p>
														</div>
									
													</div>
									
													<div class="modal-footer">
														<button type="button" class="btn btn-white ml-auto" data-dismiss="modal">확인</button>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								
								<div class="table-responsive">
									<table class="table align-items-center table-flush">
										<thead class="thead-light">
											<tr>
												<th width="10%"><input type="hidden" name="multiplechoiceId" class="form-control" value="${exampleList.multiplechoiceId}">객관식 문제 ${exampleList.multiplechoiceId}번.</th>
												<th width="50%" style="text-align:left">문제<input type="text" class="form-control" name="multiplechoiceQuestion" id="multiplechoiceQuestion" value="${exampleList.multiplechoiceQuestion}"></th>
												<th style="text-align:left">
													정답
													<select class="form-control" name="multiplechoiceAnswer" readonly="readonly">
														<c:if test="${exampleList.multiplechoiceAnswer == 1}">
															<option value="1" selected="selected">1</option>
														</c:if>
														<c:if test="${exampleList.multiplechoiceAnswer != 1}">
															<option value="1">1</option>
														</c:if>
														<c:if test="${exampleList.multiplechoiceAnswer == 2}">
															<option value="2" selected="selected">2</option>
														</c:if>
														<c:if test="${exampleList.multiplechoiceAnswer != 2}">
															<option value="2">2</option>
														</c:if>
														<c:if test="${exampleList.multiplechoiceAnswer == 3}">
															<option value="3" selected="selected">3</option>
														</c:if>
														<c:if test="${exampleList.multiplechoiceAnswer != 3}">
															<option value="3">3</option>
														</c:if>
														<c:if test="${exampleList.multiplechoiceAnswer == 4}">
															<option value="4" selected="selected">4</option>
														</c:if>
														<c:if test="${exampleList.multiplechoiceAnswer != 4}">
															<option value="4">4</option>
														</c:if>
														<c:if test="${exampleList.multiplechoiceAnswer == 5}">
															<option value="5" selected="selected">5</option>
														</c:if>
														<c:if test="${exampleList.multiplechoiceAnswer != 5}">
															<option value="5">5</option>
														</c:if>
													</select>
												</th>
												<th style="text-align:left">점수<input type="number" name="multiplechoiceScore" id="multiplechoiceScore" class="form-control" value="${exampleList.multiplechoiceScore}"></th>
											</tr>
										</thead>
										<c:forEach var="me" items="${exampleList.multiplechoiceExampleList}">
											<tr>
												<th>
													<input type="hidden" name="multiplechoiceExampleId" class="form-control multiplechoiceExampleId" value="${me.multiplechoiceExampleId}">
													${me.multiplechoiceExampleId}
												</th>
												<td colspan="3">
													<input type="text" name="multiplechoiceExampleContent" class="form-control multiplechoiceExampleContent" value="${me.multiplechoiceExampleContent}">
												</td>
											</tr>
										</c:forEach>
									</table>
								</div>
							</form>
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