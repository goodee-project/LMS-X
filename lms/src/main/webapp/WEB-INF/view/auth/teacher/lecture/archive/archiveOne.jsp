<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>archiveOne</title>
		
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
		
		<script>
			// 다운로드 횟수 증가 시키기
			function fileDownloadCount(paramUuid){
				let fileId = paramUuid.split('.')[0];
				$.ajax({
					url: '${pageContext.request.contextPath}/auth/teacher/lecture/${lectureNo}/archive/archiveSubmitFileCount/' + paramUuid,
					type:'post',
					success: function(data){
						let html = '다운로드 횟수 : ' + data + '회';
						$('#fileCount' + fileId).html(html);
					}
				});
			}
		</script>
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
			<jsp:include
				page="/WEB-INF/view/auth/teacher/include/lectureMenu.jsp" />
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
									<h3 class="mb-0">&nbsp;&nbsp;&nbsp;자료 조회</h3>
								</div>
								<div class="col-4 text-right">
									<div style="float: right;">
										<button type="button" class="btn btn-sm btn-dark" onclick="location.href='${pageContext.request.contextPath}/auth/teacher/lecture/${lectureNo}/archive/archiveList/1'">목록</button>
										<button type="button" class="btn btn-sm btn-primary" onclick="location.href='${pageContext.request.contextPath}/auth/teacher/lecture/${lectureNo}/archive/updateArchive/${archiveNo}'">수정</button>
										<button type="button" class="btn btn-sm btn-danger" onclick="location.href='${pageContext.request.contextPath}/auth/teacher/lecture/${lectureNo}/archive/deleteArchive/${archiveNo}'">삭제</button>
									</div>
								</div>
							</div>
						</div>
						<div class="table-responsive">
							<table class="table align-items-center table-flush">
								<tr>
									<td>게시글 번호</td>
									<td>${archiveNo}</td>
								</tr>
								<tr>
									<td>작성자</td>
									<td>${lectureArchive[0].lectureArchiveWriter}</td>
								</tr>
								<tr>
									<td>조회수</td>
									<td>${lectureArchive[0].lectureArchiveCount}</td>
								</tr>
								<tr>
									<td>작성일시</td>
									<td>${lectureArchive[0].lectureArchiveCreatedate}</td>
								</tr>
								<tr>
									<td>수정일시</td>
									<td>${lectureArchive[0].lectureArchiveUpdatedate}</td>
								</tr>
								<tr>
									<td>제목</td>
									<td>${lectureArchive[0].lectureArchiveTitle}</td>
								</tr>
								<tr>
									<td>내용</td>
									<td>${lectureArchive[0].lectureArchiveContent}</td>
								</tr>
								<tr>
									<td>첨부파일</td>
									<td>
										<c:forEach var="laf" items="${lectureArchive[0].lectureArchiveFileList}">
											<!-- 태그 id에 . 이 있으면 안되므로 uuid에서 확장자를 제외한 이름만 id로 지정해줌 -->
											<c:set var="uuid">${laf.lectureArchiveFileUuid}</c:set>
											<c:if test="${lectureArchive[0].lectureArchiveFileList[0].lectureArchiveFileOriginal != null}">
												<div>
													<a 
														onclick="fileDownloadCount('${laf.lectureArchiveFileUuid}','${laf.lectureArchiveFileCount}')"
														href="${pageContext.request.contextPath}/resource/archiveFile/${laf.lectureArchiveFileUuid}" download="${laf.lectureArchiveFileOriginal}">
														${laf.lectureArchiveFileOriginal}
													</a>
													&nbsp;(${laf.lectureArchiveFileType}, ${laf.lectureArchiveFileSize}KByte, <div id="fileCount${fn:split(uuid, '.')[0]}" style="display: inline;">다운로드 횟수 : ${laf.lectureArchiveFileCount}</div>)
												</div>
											</c:if>
											<c:if test="${lectureArchive[0].lectureArchiveFileList[0].lectureArchiveFileOriginal == null}">
												(첨부파일이 없습니다)	
											</c:if>
										</c:forEach>
									</td>
								</tr>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</body>
</html>