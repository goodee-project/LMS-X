<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		
		<title>reportOne</title>
		
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
				// 과제가 제출기간이 맞는지 확인
				$.ajax({
					url: '${pageContext.request.contextPath}/auth/student/lecture/report/checkReportSubmitDate/' + ${report.reportNo},
					type:'post',
					success: function(data){
						// 제출기간이 아닐경우 수정, 삭제 버튼 제거
						if(!data){
							$('#navDiv').remove();
							let submitTitle;
							return;
						}
					}
				});
			})
			
			// 다운로드 횟수 증가 시키기
			function fileDownloadCount(paramUuid){
				let fileId = paramUuid.split('.')[0];
				$.ajax({
					url: '${pageContext.request.contextPath}/auth/student/lecture/report/reportSubmitFileCount/' + paramUuid,
					type:'post',
					success: function(data){
						let html = '다운로드 : ' + data + '회';
						$('#fileCount' + fileId).html(html)
					}
				});
			}
		</script>
	</head>
	
	<body>
		<!-- 메인 Navbar -->
		<jsp:include page="/WEB-INF/view/auth/student/include/menu.jsp" />
		
		<div class="main-content">
			<!-- 상단 Navbar -->
			<div class="container-fluid">
				<jsp:include page="/WEB-INF/view/auth/student/include/topMenu.jsp" />
	    	</div>
		    
		    <!-- 강좌 Navbar -->
			<div class="container-fluid">
				<jsp:include page="/WEB-INF/view/auth/student/include/lectureMenu.jsp" />
	    	</div>
		    
			<!-- 접속자 -->
			<jsp:include page="/WEB-INF/view/auth/student/include/connector.jsp" />
			
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
										<h3 class="mb-0">과제</h3>
									</div>
									<div class="col-4 text-right">
										<button type="button" class="btn btn-sm btn-dark" onclick="location.href='${pageContext.request.contextPath}/auth/student/lecture/${lectureNo}/report/reportList/1'">목록</button>
									</div>
									<br>
								</div>
							</div>
							
							<div class="table-responsive">
								<table class="table align-items-center table-flush">
									<tr>
						    			<th width="20%">제출 기간</th>
						    			<td>${report.reportStartdate} ~ ${report.reportEnddate}</td>
						    		</tr>
									<tr>
						    			<th>제목</th>
						    			<td>${report.reportTitle}</td>
						    		</tr>
						    		<tr>
						    			<th>내용</th>
						    			<td>${report.reportContent}</td>
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
										<h3 class="mb-0">과제 제출</h3>
									</div>
									<div class="col-4 text-right">
										<div id="navDiv">
											<button type="button" class="btn btn-sm btn-primary" onclick="location.href='${pageContext.request.contextPath}/auth/student/lecture/${lectureNo}/report/updateReport/${reportSubmit.reportNo}'">수정</button>
											<button type="button" class="btn btn-sm btn-danger" onclick="location.href='${pageContext.request.contextPath}/auth/student/lecture/${lectureNo}/report/${reportSubmit.reportNo}/deleteReport/${reportSubmit.reportSubmitNo}'">삭제</button>
										</div>
									</div>
								</div>
							</div>
							
							<div class="table-responsive">
								<table class="table align-items-center table-flush">
									<tr>
										<th width="10%">제출 시간</th>
										<td width="40%">${reportSubmit.reportSubmitCreatedate}</td>
										<th width="10%">수정 시간</th>
										<td width="40%">${reportSubmit.reportSubmitUpdatedate}</td>
									</tr>
									<tr>
										<th>제목</th>
										<td colspan="3">${reportSubmit.reportSubmitTitle}</td>
									</tr>
									<tr>
										<th>내용</th>
										<td colspan="3">${reportSubmit.reportSubmitContent}</td>
									</tr>
									<tr>
										<th>첨부파일</th>
										<td colspan="3">
											<c:forEach var="rsf" items="${reportSubmit.reportSubmitFileList}">
												<!-- 태그 id에 . 이 있으면 안되므로 uuid에서 확장자를 제외한 이름만 id로 지정해줌 -->
					   							<c:set var="uuid">${rsf.reportSubmitFileUuid}</c:set>
												<div class="row">
													<c:if test="${reportSubmit.reportSubmitFileList[0].reportSubmitFileOriginal != null}">
														<a onclick="fileDownloadCount('${rsf.reportSubmitFileUuid}','${rsf.reportSubmitFileCount}')" download="${rsf.reportSubmitFileOriginal}" href="${pageContext.request.contextPath}/resource/reportSubmitFile/${rsf.reportSubmitFileUuid}">${rsf.reportSubmitFileOriginal}</a>
														&nbsp;(														
								    					<!-- 파일 사이즈 -->
								    					<c:choose>
								    						<c:when test="${rsf.reportSubmitFileSize >= (1024 * 1024)}">
								    							<fmt:formatNumber value="${rsf.reportSubmitFileSize/(1024*1024)}" type="pattern" pattern="0.00" />MB					
								    						</c:when>
								    						<c:when test="${rsf.reportSubmitFileSize >= 1024}">
								    							<fmt:formatNumber value="${rsf.reportSubmitFileSize/1024}" type="pattern" pattern="0.00" />B 
								    						</c:when>
								    						<c:otherwise>
								    							<fmt:formatNumber value="${rsf.reportSubmitFileSize}" type="pattern" pattern="0.00" />KB 	
								    						</c:otherwise>
								    					</c:choose>,
														 &nbsp;
														<div id="fileCount${fn:split(uuid ,'.')[0]}">다운로드 : ${rsf.reportSubmitFileCount}회</div>)
													</c:if>
													<c:if test="${reportSubmit.reportSubmitFileList[0].reportSubmitFileOriginal == null}">
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
				
				<!-- Table 3 -->
				<div class="row mt-5">
					<div class="col">
						<div class="card shadow">
							<div class="card-header bg-white border-0">
								<div class="row align-items-center">
									<div class="col-8">
										<h3 class="mb-0">과제 평가</h3>
									</div>
									<div class="col-4 text-right">
									</div>
								</div>
							</div>
							
							<div class="table-responsive">
								<table class="table align-items-center table-flush">
									<tr>
										<th width="20%">점수</th>
										<!-- 점수 입력이 되지 않은 경우 -->
										<c:if test="${reportSubmit.reportSubmitPoint == -1}">
											<td id="resultPoint" width="80%">(미입력)</td>
										</c:if>
										<!-- 점수 입력이 되어 있는 경우 -->
										<c:if test="${reportSubmit.reportSubmitPoint != -1}">
											<td id="resultPoint" width="80%">${reportSubmit.reportSubmitPoint}</td>
										</c:if>
									</tr>
									<tr>
										<th>평가 내용</th>
										<!-- 평가 내용 입력이 되지 않은 경우 -->
										<c:if test="${reportSubmit.reportSubmitFeedback == null}">
											<td id="resultFeedback">(평가 내용이 없습니다)</td>
										</c:if>
										<!-- 평가 내용 입력이 되어 있는 경우 -->
										<c:if test="${reportSubmit.reportSubmitFeedback != null}">
											<td id="resultFeedback">${reportSubmit.reportSubmitFeedback}</td>
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