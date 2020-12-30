<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>QnAOne</title>
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
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<script>			
			// 다운로드 횟수 증가 시키기
			function fileDownloadCount(paramUuid){
				let fileId = paramUuid.split('.')[0];
				$.ajax({
					url: '${pageContext.request.contextPath}/auth/student/lecture/qna/studentQnaFileCount/' + paramUuid,
					type:'post',
					success: function(data){
						let html = '다운 횟수 : ' + data + '회';
						$('#fileCount' + fileId).html(html)
					}
				});
			}
		</script>
</head>
	<body>
		<!-- 메인 Navbar -->
		
		<nav class="navbar navbar-vertical fixed-left navbar-expand-md navbar-light bg-white" id="sidenav-main">
			<div class="container-fluid">
				<jsp:include page="/WEB-INF/view/auth/student/include/menu.jsp" />
		    </div>	
		</nav>   		
		<div class="main-content">
			<!-- 상단 Navbar -->
			<div class="container-fluid">
				<jsp:include page="/WEB-INF/view/auth/student/include/topMenu.jsp" />
	    	</div>
			<!-- 강좌 Navbar -->
			<div class="container-fluid">
				<jsp:include page="/WEB-INF/view/auth/student/include/lectureMenu.jsp" />
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
												<h5 class="card-title text-uppercase text-muted mb-0">접속자 현황</h5>
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
											<span class="text-nowrap">누적 접속자</span>
											<span class="text-success mr-2">1,000,000,000</span> 
										</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		<div class="container-fluid mt--7">
			<div class="card shadow">
				<div class="card-header border-0">
					<div class="row align-items-center">
						<div class="col">
							<h3 class="mb-0">질문 상세보기</h3>
						</div>
					</div>
				</div>	
			<div class="row align-items-center">
				<div class="col-12">
					<table class="table">
						<tr>
							<td>질문 번호</td>
							<td>${question.questionNo}</td>
						</tr>
						<tr>
							<td>작성자</td>
							<td>${question.questionWriter}</td>
						</tr>
						<tr>
							<td>제목</td>
							<td>${question.questionTitle}</td>
						</tr>
						<tr>
							<td>내용</td>
							<td>${question.questionContent}</td>
						</tr>
						<tr>
							<td>작성일</td>
							<td>${question.questionCreatedate}</td>
						</tr>
						<tr>
							<td>수정일</td>
							<td>${question.questionUpdatedate}</td>
						</tr>
						<tr>
							<td>조회수</td>
							<td>${question.questionCount}</td>
						</tr>
					</table>
				</div>
			</div>
			<hr>
				<div class="card-header border-0">
					<div class="row align-items-center">
						<div class="col">
							<h3 class="mb-0">첨부파일 상세보기</h3>
						</div>
					</div>
				</div>	
				<div class="row align-items-center">
					<div class="col-12">
						<c:forEach var="qfl" items="${question.questionFileList}">
						<!-- 태그 id에 . 이 있으면 안되므로 uuid에서 확장자를 제외한 이름만 id로 지정해줌 -->
		   				<c:set var="uuid">${qfl.questionFileUuid}</c:set>
							<table class="table">
								<tr>
									<td>파일 이름</td>
									<td><a onclick="fileDownloadCount('${qfl.questionFileUuid}','${qfl.questionFileCount}')" download="${qfl.questionFileOriginal}" href="${pageContext.request.contextPath}/resource/questionFile/${qfl.questionFileUuid}">${qfl.questionFileOriginal}</a></td>
								</tr>
								<tr>
									<td>파일 사이즈</td>
									<!-- 파일 사이즈 -->
									<td>
				    					<c:choose>
				    						<c:when test="${qfl.questionFileSize >= (1024 * 1024)}">
				    							<fmt:formatNumber value="${qfl.questionFileSize/(1024*1024)}" type="pattern" pattern="0.00" />MB					
				    						</c:when>
				    						<c:when test="${qfl.questionFileSize >= 1024}">
				    							<fmt:formatNumber value="${qfl.questionFileSize/1024}" type="pattern" pattern="0.00" />B 
				    						</c:when>
				    						<c:otherwise>
				    							<fmt:formatNumber value="${qfl.questionFileSize}" type="pattern" pattern="0.00" />KB 	
				    						</c:otherwise>
				    					</c:choose>
				    				</td>
								</tr>
								<tr>
									<td>파일 타입</td>
									<td>${qfl.questionFileType}</td>
								</tr>
								<tr>
									<td>파일 다운로드 횟수</td>
									<td id="fileCount${fn:split(uuid ,'.')[0]}">다운 횟수 : ${qfl.questionFileCount}회</td>
								</tr>
								<tr>
									<td>파일 업로드 날짜</td>
									<td>${qfl.questionFileCreatedate}</td>
								</tr>
							</table>
						</c:forEach>
					</div>
				</div>
				<div style="text-align: right;">
					<c:if test="${accountId == accountId}">
						<a class="btn btn-outline-primary" href="${pageContext.request.contextPath}/auth/student/lecture/${lectureNo}/qna/updateQna/${question.questionNo}/${questionPassword}">질문 수정</a>
						<a class="btn btn-outline-primary" href="${pageContext.request.contextPath}/auth/student/lecture/${lectureNo}/qna/deleteQuestion/${question.questionNo}">삭제</a>
					</c:if>
				</div>
			<hr>
				<div class="card-header border-0">
					<div class="row align-items-center">
						<div class="col">
							<h3 class="mb-0">댓글</h3>
						</div>
					</div>
				</div>	
				<div class="row align-items-center">
					<div class="col-12">
						<table class="table">
							<c:forEach var="qc" items="${questionComment}">
								<tr>
									<td>${qc.questionCommentNo}</td>
									<td>${qc.questionCommentWriter}</td>
									<td>${qc.questionCommentContent}</td>
									<td>${qc.questionCommentCreatedate}</td>
									<td>${qc.questionCommentUpdatedate}</td>
										<c:if test="${accountId == qc.accountId}">
											<td><a href="${pageContext.request.contextPath}/auth/student/lecture/${lectureNo}/qna/qnaOne/${questionNo}/updateQuestionComment/${qc.questionCommentNo}">수정</a></td>
											<td><a href="${pageContext.request.contextPath}/auth/student/lecture/${lectureNo}/qna/qnaOne/${questionNo}/deleteQuestionComment/${qc.questionCommentNo}">삭제</a></td>
										</c:if>
								</tr>
							</c:forEach>
						</table>
					</div>
				</div>
				</br>
					<form action="${pageContext.request.contextPath}/auth/student/lecture/${lectureNo}/qna/qnaOne/${questionNo}/insertStduentQuestionComment" method="post">
					<div>
						<div>
							<textarea style="width: 100%;" rows="8px" name="questionCommentContent" class="form-control"></textarea>
						</div>
						<div style="float: right"><button class="btn btn-outline-primary" style="text-align: right; margin-right: 10%;" type="submit">댓글입력</button></div>
					</div>
				</form>
						<div class="row align-items-center mt-5">	
					<div class="col-12">		
					<!-- 페이지 네비게이션 -->
					<ul class="pagination justify-content-center">
						<!-- 처음으로 버튼 -->
						<c:choose>
							<c:when test="${currentPage > 1}">
								<li class="page-item">
									<a class="page-link" href="${pageContext.request.contextPath}/auth/student/lecture/${lectureNo}/qna/qnaOne/${questionNo}/1">
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
									<a class="page-link" href="${pageContext.request.contextPath}/auth/student/lecture/${lectureNo}/qna/qnaOne/${questionNo}/${prePage}">
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
												<a class="page-link" href="${pageContext.request.contextPath}/auth/student/lecture/${lectureNo}/qna/qnaOne/${questionNo}/${i}">${i}</a>
											</li>
										</c:otherwise>
									</c:choose>
								</c:if>
							</c:forEach>
							
							<!-- 다음 버튼 -->
							<c:choose>
								<c:when test="${currentPage < lastPage}">
									<li class="page-item">
										<a class="page-link" href="${pageContext.request.contextPath}/auth/student/lecture/${lectureNo}/qna/qnaOne/${questionNo}/${nextPage}">
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
										<a class="page-link" href="${pageContext.request.contextPath}/auth/student/lecture/${lectureNo}/qna/qnaOne/${questionNo}/${lastPage}">
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
									<button type="button" class="btn-outline-primary">
										${currentPage} / ${lastPage} 페이지
									</button>
								</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
			<!-- Footer -->
			<jsp:include page="/WEB-INF/view/auth/include/footer.jsp"></jsp:include>
		</div>
	</div>
	</body>
</html>
