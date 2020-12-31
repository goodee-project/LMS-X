<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		
		<title>reportSubmitOne</title>
		
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
				<!-- Table 1 -->
				<div class="row">
					<div class="col">
						<div class="card shadow">
							<div class="card-header bg-white border-0">
								<div class="row align-items-center">
									<br>
									<div class="col-8">
										<h3 class="mb-0">학생 과제 제출 조회</h3>
									</div>
									<div class="col-4 text-right">
											<button type="button" class="btn btn-sm btn-dark"
												onclick="location.href='${pageContext.request.contextPath}/auth/teacher/lecture/${lectureNo}/report/reportOne/${reportNo}'">목록</button>
										</div>
									<br>
								</div>
							</div>
							
							<div class="table-responsive">
								<table class="table align-items-center table-flush">
									<tr>
										<th width="10%">제출 시간</th>
										<td width="40%">${reportSubmit[0].reportSubmitCreatedate}</td>
										<th width="10%">수정 시간</th>
										<td width="40%">${reportSubmit[0].reportSubmitUpdatedate}</td>
									</tr>
									<tr>
										<th>제출 학생</th>
										<td colspan="3">${reportSubmit[0].reportSubmitWriter}&#40;${reportSubmit[0].accountId}&#41;</td>
									</tr>
									<tr>
										<th>제목</th>
										<td colspan="3">${reportSubmit[0].reportSubmitTitle}</td>
									</tr>
									<tr>
										<th>내용</th>
										<td colspan="3">${reportSubmit[0].reportSubmitContent}</td>
									</tr>
									<tr>
										<th>첨부파일</th>
										<td colspan="3">
											<c:forEach var="rsf" items="${reportSubmit[0].reportSubmitFileList}">
												<div>
													<c:if test="${reportSubmit[0].reportSubmitFileList[0].reportSubmitFileOriginal != null}">
														<a href="${pageContext.request.contextPath}/resource/reportSubmitFile/${rsf.reportSubmitFileUuid}" download="${rsf.reportSubmitFileOriginal}">${rsf.reportSubmitFileOriginal}</a>
														&nbsp;(${rsf.reportSubmitFileType}, ${rsf.reportSubmitFileSize}KByte)
													</c:if>
													<c:if test="${reportSubmit[0].reportSubmitFileList[0].reportSubmitFileOriginal == null}">
														(첨부파일이 없습니다)	
													</c:if>
												</div>
											</c:forEach>
										</td>
									</tr>
								</table>
							</div>
						</div>
					</div>
				</div>
				
				<!-- Table 2 -->
				<div class="row mt-5">
					<div class="col">
						<div class="card shadow">
							<div class="card-header bg-white border-0">
								<div class="row align-items-center">
									<div class="col-8">
										<h3 class="mb-0">과제 평가</h3>
									</div>
									<div class="col-4 text-right">
										<!-- 점수 입력이 되지 않은 경우 -->
										<c:if test="${reportSubmit[0].reportSubmitPoint == -1}">
											<button type="button" class="btn btn-sm btn-success" style="float: right;" onclick="location.href='${pageContext.request.contextPath}/auth/teacher/lecture/${lectureNo}/report/reportOne/${reportNo}/insertReportSubmit/${reportSubmit[0].reportSubmitNo}'">평가 입력</button>
										</c:if>
										
										<!-- 점수 입력이 되어 있는 경우 -->
										<c:if test="${reportSubmit[0].reportSubmitPoint != -1}">
											<button type="button" class="btn btn-sm btn-primary" style="float: right;" onclick="location.href='${pageContext.request.contextPath}/auth/teacher/lecture/${lectureNo}/report/reportOne/${reportNo}/updateReportSubmit/${reportSubmit[0].reportSubmitNo}'">평가 수정</button>
										</c:if>
									</div>
								</div>
							</div>
							
							<div class="table-responsive">
								<table class="table align-items-center table-flush">
									<tr>
										<th width="20%">점수</th>
										<!-- 점수 입력이 되지 않은 경우 -->
										<c:if test="${reportSubmit[0].reportSubmitPoint == -1}">
											<td width="80%">(미입력)</td>
										</c:if>
										<!-- 점수 입력이 되어 있는 경우 -->
										<c:if test="${reportSubmit[0].reportSubmitPoint != -1}">
											<td width="80%">${reportSubmit[0].reportSubmitPoint}</td>
										</c:if>
									</tr>
									<tr>
										<th>평가 내용</th>
										<!-- 평가 내용 입력이 되지 않은 경우 -->
										<c:if test="${reportSubmit[0].reportSubmitFeedback == null}">
											<td>(평가 내용이 없습니다)</td>
										</c:if>
										<!-- 평가 내용 입력이 되어 있는 경우 -->
										<c:if test="${reportSubmit[0].reportSubmitFeedback != null}">
											<td>${reportSubmit[0].reportSubmitFeedback}</td>
										</c:if>
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