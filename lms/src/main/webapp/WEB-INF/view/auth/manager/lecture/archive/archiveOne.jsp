<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>archiveOne</title>
<!-- Favicon -->
<link
	href="${pageContext.request.contextPath}/assets/img/brand/favicon.png"
	rel="icon" type="image/png">

<!-- Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700"
	rel="stylesheet">

<!-- Icons -->
<link
	href="${pageContext.request.contextPath}/assets/js/plugins/nucleo/css/nucleo.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/assets/js/plugins/@fortawesome/fontawesome-free/css/all.min.css"
	rel="stylesheet" />

<!-- CSS Files -->
<link
	href="${pageContext.request.contextPath}/assets/css/argon-dashboard.css?v=1.1.2"
	rel="stylesheet" />

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Bootstrap 4 Icons -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
	integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
	crossorigin="anonymous">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

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
}
</style>
<script>
	// 다운로드 횟수 증가 시키기
	function fileDownloadCount(paramUuid) {
		let fileId = paramUuid.split('.')[0];
		console.log(fileId);
		console.log(paramUuid);
		$
				.ajax({
					url : '${pageContext.request.contextPath}/auth/manager/lecture/${lectureNo}/archive/archiveFileCount/'
							+ paramUuid,
					type : 'get',
					success : function(data) {
						console.log(data);
						let html = '다운로드 횟수 : ' + data + '회';
						$('#fileCount' + fileId).html(html);
					}
				});
	}
</script>
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
									<h3 class="mb-0">자료실 상세보기</h3>
								</div>
								<div class="col-4 text-right">
									<button type="button" class="btn btn-sm btn-dark"
										onclick="location.href='${pageContext.request.contextPath}/auth/manager/lecture/${lectureNo}/archive/archiveList/1'">목록</button>
									<button type="button" class="btn btn-sm btn-danger"
										onclick="location.href='${pageContext.request.contextPath}/auth/manager/lecture/${lectureNo}/archive/archiveOne/deleteArchive/${lectureArchiveNo}'">삭제</button>
								</div>
								<br>
							</div>
						</div>

						<div class="table-responsive">
							<table class="table align-items-center table-flush">
								<tr>
									<td>게시글 번호${lectureNo}</td>
									<td>${lectureArchive.lectureArchiveNo}</td>
								</tr>
								<tr>
									<td>작성자</td>
									<td>${lectureArchive.lectureArchiveWriter}</td>
								</tr>
								<tr>
									<td>조회수</td>
									<td>${lectureArchive.lectureArchiveCount}</td>
								</tr>
								<tr>
									<td>작성일시</td>
									<td>${lectureArchive.lectureArchiveCreatedate}</td>
								</tr>
								<tr>
									<td>수정일시</td>
									<td>${lectureArchive.lectureArchiveUpdatedate}</td>
								</tr>
								<tr>
									<td>제목</td>
									<td>${lectureArchive.lectureArchiveTitle}</td>
								</tr>
								<tr>
									<td>내용</td>
									<td>${lectureArchive.lectureArchiveContent}</td>
								</tr>
								<tr>
									<td>첨부파일</td>
									<td><c:forEach var="laf"
											items="${lectureArchive.lectureArchiveFileList}">
											<!-- 태그 id에 . 이 있으면 안되므로 uuid에서 확장자를 제외한 이름만 id로 지정해줌 -->
											<c:set var="uuid">${laf.lectureArchiveFileUuid}</c:set>
											<c:if
												test="${lectureArchive.lectureArchiveFileList[0].lectureArchiveFileOriginal != null}">
												<div>
													<a
														onclick="fileDownloadCount('${laf.lectureArchiveFileUuid}')"
														href="${pageContext.request.contextPath}/resource/archiveFile/${laf.lectureArchiveFileUuid}"
														download="${laf.lectureArchiveFileOriginal}">
														${laf.lectureArchiveFileOriginal} </a>
													&nbsp;(${laf.lectureArchiveFileType},
													${laf.lectureArchiveFileSize}KByte,
													<div id="fileCount${fn:split(uuid, '.')[0]}"
														style="display: inline;">다운로드 횟수 :
														${laf.lectureArchiveFileCount}회</div>
												</div>
											</c:if>
											<c:if
												test="${lectureArchive.lectureArchiveFileList[0].lectureArchiveFileOriginal == null}">
												(첨부파일이 없습니다)	
											</c:if>
										</c:forEach></td>
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