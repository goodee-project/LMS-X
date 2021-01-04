<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	//다운로드 횟수 증가 시키기
	function fileDownloadCount(paramUuid) {
		let fileId = paramUuid.split('.')[0];
		$
				.ajax({
					url : '${pageContext.request.contextPath}/auth/manager/lecture/${lectureNo}/question/questionSubmitFileCount/'
							+ paramUuid,
					type : 'post',
					success : function(data) {
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
									<h3 class="mb-0">질문 목록</h3>
								</div>
								<div class="col-4 text-right">
									<button type="button" class="btn btn-sm btn-dark"
										onclick="location.href='${pageContext.request.contextPath}/auth/manager/lecture/${lectureNo}/question/questionList/1'">추가</button>
									<button type="button" class="btn btn-sm btn-danger"
										onclick="location.href='${pageContext.request.contextPath}/auth/manager/lecture/${lectureNo}/question/deleteQuestion/${question.questionNo}'">삭제</button>
								</div>
								<br>
							</div>
						</div>

						<div class="table-responsive">
							<table class="table align-items-center table-flush">
								<tr>
									<td>질문 번호</td>
									<td>${question.questionNo}</td>
								<tr>
								<tr>
									<td>강의 번호</td>
									<td>${question.lectureNo}</td>
								</tr>
								<tr>
									<td>계정 번호</td>
									<td>${question.accountId}</td>
								</tr>
								<tr>
									<td>질문 작성자</td>
									<td>${question.questionWriter}</td>
								</tr>
								<tr>
									<td>질문 제목</td>
									<td>${question.questionTitle}</td>
								</tr>
								<tr>
									<td>질문 내용</td>
									<td>${question.questionContent}</td>
								</tr>
								<tr>
									<td>질문 작성날짜</td>
									<td>${question.questionCreatedate}</td>
								</tr>
								<tr>
									<td>질문 수정날짜</td>
									<td>${question.questionUpdatedate}</td>
								</tr>
								<tr>
									<td>질문 조회수</td>
									<td>${question.questionCount}</td>
								</tr>
								<tr>
									<td>첨부파일</td>
									<td><c:forEach var="qfl"
											items="${question.questionFileList}">
											<!-- 태그 id에 .이 있으면 안되므로 uuid에서 확장자를 제외한 이름만 id로 지정해줌 -->
											<c:set var="uuid">${qfl.questionFileUuid}</c:set>
											<c:if test="${!empty question.questionFileList[0].questionFileOriginal}">
												<div>
													<a onclick="fileDownloadCount('${qfl.questionFileUuid}','${qfl.questionFileCount}')" href="${pageContext.request.contextPath}/resource/questionFile/${qfl.questionFileUuid}" download="${qfl.questionFileOriginal}"> ${qfl.questionFileOriginal} </a>
													<!-- 다운 횟수 -->
													<div id="fileCount${fn:split(uuid, '.')[0]}"
														style="display: inline;">다운로드 횟수 :
														${qfl.questionFileCount}회</div>
												</div>
											</c:if>
											<c:if
												test="${empty question.questionFileList[0].questionFileOriginal}">
												<p>(첨부파일이 없습니다.)</p>
											</c:if>
										</c:forEach></td>
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
								<br>
								<div class="col-8">
									<h3 class="mb-0">댓글 목록</h3>
									<br>
								</div>
								<div class="col-4 text-right">
								</div>
								<br>
							</div>
						</div>

						<div class="table-responsive">
							<table class="table commentTable align-items-center table-flush">
								<c:if test="${!empty questionComment[0].questionCommentNo}">
									<c:forEach var="qc" items="${questionComment}">
										<tr>
											<td>${qc.questionCommentNo}</td>
											<td>${qc.questionCommentWriter}</td>
											<td>${qc.questionCommentContent}</td>
											<td>작성일 : ${qc.questionCommentCreatedate}</td>
											<td>수정일 : ${qc.questionCommentUpdatedate}</td>
											<td>
												<button type="button" class="btn btn-sm btn-danger"
													onclick="location.href='${pageContext.request.contextPath}/auth/manager/lecture/${lectureNo}/question/questionOne/${questionNo}/deleteQuestionComment/${qc.questionCommentNo}'">삭제</button>
											</td>
										</tr>
									</c:forEach>
								</c:if>
								<c:if test="${empty questionComment[0].questionCommentNo}">
									<tr>
										<td>
											<p>(댓글이 없습니다.)</p>
										</td>
									</tr>
								</c:if>
							</table>
						</div>

						<div class="card-footer py-4">
							<nav aria-label="...">
								<!-- 페이지 내비게이션 -->
								<ul class="pagination justify-content-center">
									<!-- 처음으로 버튼 -->
									<c:choose>
										<c:when test="${currentPage > 1}">
											<li class="page-item"><a class="page-link"
												href="${pageContext.request.contextPath}/auth/manager//lecture/${lectureNo}/question/questionOne/${questionNo}/1">
													<i class='fas fa-angle-double-left'></i>
											</a></li>
										</c:when>
										<c:otherwise>
											<li class="page-item disabled"><a class="page-link"
												href="#"> <i class='fas fa-angle-double-left'></i>
											</a></li>
										</c:otherwise>
									</c:choose>

									<!-- 이전 버튼 -->
									<c:choose>
										<c:when test="${currentPage > 1}">
											<li class="page-item"><a class="page-link"
												href="${pageContext.request.contextPath}/auth/manager/lecture/${lectureNo}/question/questionOne/${questionNo}/${prePage}">
													<i class='fas fa-angle-left'></i>
											</a></li>
										</c:when>
										<c:otherwise>
											<li class="page-item disabled"><a class="page-link"
												href="#"> <i class='fas fa-angle-left'></i>
											</a></li>
										</c:otherwise>
									</c:choose>

									<!-- 현재 페이지 표시 -->
									<c:forEach var="i" begin="${navFirstPage}" end="${navLastPage}">
										<c:if test="${i <= lastPage}">
											<c:choose>
												<%-- 현재 페이지 --%>
												<c:when test="${i == currentPage}">
													<li class="page-item active"><a class="page-link"
														href="#">${i}</a></li>
												</c:when>
												<%-- 현재 페이지가 아닌 선택 가능한 페이지 --%>
												<c:otherwise>
													<li class="page-item"><a class="page-link"
														href="${pageContext.request.contextPath}/auth/manager/lecture/${lectureNo}/question/questionOne/${questionNo}/${i}">${i}</a>
													</li>
												</c:otherwise>
											</c:choose>
										</c:if>
									</c:forEach>

									<!-- 다음 버튼 -->
									<c:choose>
										<c:when test="${currentPage < lastPage}">
											<li class="page-item"><a class="page-link"
												href="${pageContext.request.contextPath}/auth/manager/lecture/${lectureNo}/question/questionOne/${questionNo}/${nextPage}">
													<i class='fas fa-angle-right'></i>
											</a></li>
										</c:when>
										<c:otherwise>
											<li class="page-item disabled"><a class="page-link"
												href="#"> <i class='fas fa-angle-right'></i>
											</a></li>
										</c:otherwise>
									</c:choose>

									<!-- 마지막으로 버튼 -->
									<c:choose>
										<c:when test="${currentPage < lastPage}">
											<li class="page-item"><a class="page-link"
												href="${pageContext.request.contextPath}/auth/manager/lecture/${lectureNo}/question/questionOne/${questionNo}/${lastPage}">
													<i class='fas fa-angle-double-right'></i>
											</a></li>
										</c:when>
										<c:otherwise>
											<li class="page-item disabled"><a class="page-link"
												href="#"> <i class='fas fa-angle-double-right'></i>
											</a></li>
										</c:otherwise>
									</c:choose>
								</ul>

								<!-- 총 페이지 수 출력 -->
								<table style="margin: auto;">
									<tr>
										<td>
											<button type="button" class="btn btn-sm btn-outline-primary">
												${currentPage} / ${lastPage} 페이지</button>
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