<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		
		<title>syllabusOne</title>
		
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
			// 다운로드 횟수 증가 시키기
			function fileDownloadCount(paramUuid) {
				let fileId = paramUuid.split('.')[0];
				$.ajax({
					url : '${pageContext.request.contextPath}/auth/teacher/lecture/${lectureNo}/syllabus/syllabusSubmitFileCount/' + paramUuid,
					type : 'post',
					success : function(data) {
						let html = data + '회';
						$('#fileCount' + fileId).html(html);
					}
				});
			}
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
							<div class="card-header bg-white border-0">
								<div class="row align-items-center">
									<br>
									<div class="col-8">
										<h3 class="mb-0">강의 계획서</h3>
									</div>
									<div class="col-4 text-right">
										<c:if test="${empty syllabus.syllabusFileUuid}">
											<button type="button" class="btn btn-sm btn-primary" onclick="location.href='${pageContext.request.contextPath}/auth/teacher/lecture/${lectureNo}/syllabus/insertSyllabus'">추가</button>
										</c:if>
										<c:if test="${!empty syllabus.syllabusFileUuid}">
											<button type="button" class="btn btn-sm btn-danger" onclick="location.href='${pageContext.request.contextPath}/auth/teacher/lecture/${lectureNo}/syllabus/deleteSyllabus'">삭제</button>
										</c:if>
									</div>
									<br>
								</div>
							</div>
							<div class="table-responsive">
								<table class="table align-items-center table-flush">
									<c:set var="uuid">${syllabus.syllabusFileUuid}</c:set>
									<c:if test="${!empty syllabus.syllabusFileUuid}">
										<tr>
											<th width="15%">업로드 날짜</th>
											<td width="35%">${syllabus.syllabusFileCreatedate}</td>
											<th width="15%">다운로드 횟수</th>
											<td width="35%">
												<div id="fileCount${fn:split(uuid, '.')[0]}" style="display: inline;">${syllabus.syllabusFileCount}회</div>
											</td>
										</tr>
										<tr>
											<th>다운로드</th>
											<td>
												<a onclick="fileDownloadCount('${syllabus.syllabusFileUuid}','${syllabus.syllabusFileCount}')"
													href="${pageContext.request.contextPath}/resource/syllabusFile/${syllabus.syllabusFileUuid}"
													download="${syllabus.syllabusFileOriginal}">
													${syllabus.syllabusFileOriginal}
												</a>
												<br>
											</td>
											<th>파일 크기</th>
											<td>
												<!-- 파일 사이즈 --> <c:choose>
													<c:when test="${syllabus.syllabusFileSize >= (1024 * 1024)}">
														<fmt:formatNumber
															value="${syllabus.syllabusFileSize/(1024*1024)}"
															type="pattern" pattern="0.00" />MB
						                                </c:when>
													<c:when test="${syllabus.syllabusFileSize >= 1024}">
														<fmt:formatNumber value="${syllabus.syllabusFileSize/1024}"
															type="pattern" pattern="0.00" />B 
						                                </c:when>
													<c:otherwise>
														<fmt:formatNumber value="${syllabus.syllabusFileSize}"
															type="pattern" pattern="0.00" />KB
						                                </c:otherwise>
												</c:choose>
											</td>
										</tr>
									</c:if>
									<c:if test="${empty syllabus.syllabusFileUuid}">
										<tr>
											<td>현재 첨부파일이 없습니다.</td>
										</tr>
									</c:if>
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