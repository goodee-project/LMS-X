<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		
		<title>qnaOne</title>
		
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
		
		<style>
			.commentTable {
				text-align: center;
			}
			
			.commentTable td {
				vertical-align: middle;
			}
			
			.commentTable th {
				text-align: center;
			}
		</style>
		
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
			//댓글 작성
			$(document).ready(function(){
				var qcc = $("questionCommentContent").val();
				//댓글 작성 버튼
				$('#insertCommentBtn').click(function(){
					if($('#questionCommentContent').val().length < 1) {
						alert('댓글 내용을 입력해주세요.');
						return;
					}
					$('#insertCommentForm').submit();
				});
			});
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
										<h3 class="mb-0">질문 조회</h3>
									</div>
									<div class="col-4 text-right">
										<a class="btn btn-sm btn-dark" href="${pageContext.request.contextPath}/auth/student/lecture/${lectureNo}/qna/qnaList/1">목록</a>
										<c:if test="${sessionScope.loginId == question.questionWriter}">
											<a class="btn btn-sm btn-primary" href="${pageContext.request.contextPath}/auth/student/lecture/${lectureNo}/qna/updateQna/${question.questionNo}/${questionPassword}">수정</a>
											<a class="btn btn-sm btn-danger" href="${pageContext.request.contextPath}/auth/student/lecture/${lectureNo}/qna/deleteQuestion/${question.questionNo}/${questionPassword}">삭제</a>
										</c:if>
									</div>
								</div>
							</div>
							
							<div class="table-responsive">
								<table class="table align-items-center table-flush">
									<tr>
										<th width="10%">작성자</th>
										<td width="40%">${question.questionWriter}</td>
										<th width="10%">조회수</th>
										<td width="40%">${question.questionCount}</td>
									</tr>
									<tr>
										<th>작성일시</th>
										<td>${question.questionCreatedate}</td>
										<th>수정일시</th>
										<td>${question.questionUpdatedate}</td>
									</tr>
									<tr>
										<th>제목</th>
										<td colspan="3">${question.questionTitle}</td>
									</tr>
									<tr>
										<th>내용</th>
										<td colspan="3">${question.questionContent}</td>
									</tr>
									<tr>
										<th>첨부파일</th>
										<td colspan="3">
											<c:forEach var="qfl" items="${question.questionFileList}">
											<!-- 태그 id에 .이 있으면 안되므로 uuid에서 확장자를 제외한 이름만 id로 지정해줌 -->
											<c:set var="uuid">${qfl.questionFileUuid}</c:set>
											<c:if test="${!empty question.questionFileList}">
												<a
													onclick="fileDownloadCount('${qfl.questionFileUuid}','${qfl.questionFileCount}')"
													href="${pageContext.request.contextPath}/resource/questionFile/${qfl.questionFileUuid}" download="${qfl.questionFileOriginal}">
													${qfl.questionFileOriginal}
												</a>
												
												<!-- 파일 사이즈 -->
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
					                            <div id="fileCount${fn:split(uuid, '.')[0]}" style="display: inline;">다운로드 횟수 : ${qfl.questionFileCount}회</div>
											</c:if>
											<br>
											</c:forEach>
											<c:if test="${empty question.questionFileList}">
												(첨부파일이 없습니다)
											</c:if>
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
									<thead class="thead-light">
										<tr>
											<th width="10%">번호</th>
											<th width="10%">작성자</th>
											<th width="24%">내용</th>
											<th width="15%">작성일시</th>
											<th width="15%">수정일시</th>
											<th width="8%">수정</th>
											<th width="8%">삭제</th>
										</tr>
									</thead>
									<tbody>
										<c:if test="${!empty questionComment}">
											<c:forEach var="qc" items="${questionComment}">					
													<tr>
														<td>${qc.questionCommentNo}</td>
														<td>${qc.questionCommentWriter}</td>
														<td>${qc.questionCommentContent}</td>
														<td>${qc.questionCommentCreatedate}</td>
														<td>${qc.questionCommentUpdatedate}</td>
														
														<c:if test="${sessionScope.loginId == qc.accountId}">
															<td>
																<button type="button" class="btn btn-sm btn-primary" onclick="location.href='${pageContext.request.contextPath}/auth/student/lecture/${lectureNo}/qna/qnaOne/${questionNo}/updateQuestionComment/${qc.questionCommentNo}/${questionPassword}'">수정</button>														
															</td>
															<td>
																<button type="button" class="btn btn-sm btn-danger" onclick="location.href='${pageContext.request.contextPath}/auth/student/lecture/${lectureNo}/qna/qnaOne/${questionNo}/deleteQuestionComment/${qc.questionCommentNo}/${questionPassword}'">삭제</button>
															</td>
														</c:if>
														<c:if test="${sessionScope.loginId != qc.accountId}">
															<td colspan="2"></td>
														</c:if>
													</tr>
											</c:forEach>
										</c:if>
										<c:if test="${empty questionComment}">
											<tr>
												<td colspan="7">
													(댓글이 없습니다)
												</td>
											</tr>
										</c:if>
									</tbody>
								</table>
							</div>
							
							<div class="card-footer py-4">
								<nav aria-label="...">
									<!-- 페이지 네비게이션 -->
									<ul class="pagination justify-content-center">
										<!-- 처음으로 버튼 -->
										<c:choose>
											<c:when test="${currentPage > 1}">
												<li class="page-item">
													<a class="page-link" href="${pageContext.request.contextPath}/auth/student/lecture/${lectureNo}/qna/qnaOne/${questionNo}/1/${questionPassword}">
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
													<a class="page-link" href="${pageContext.request.contextPath}/auth/student/lecture/${lectureNo}/qna/qnaOne/${questionNo}/${prePage}/${questionPassword}">
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
															<a class="page-link" href="${pageContext.request.contextPath}/auth/student/lecture/${lectureNo}/qna/qnaOne/${questionNo}/${i}/${questionPassword}">${i}</a>
														</li>
													</c:otherwise>
												</c:choose>
											</c:if>
										</c:forEach>
											
										<!-- 다음 버튼 -->
										<c:choose>
											<c:when test="${currentPage < lastPage}">
												<li class="page-item">
													<a class="page-link" href="${pageContext.request.contextPath}/auth/student/lecture/${lectureNo}/qna/qnaOne/${questionNo}/${nextPage}/${questionPassword}">
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
													<a class="page-link" href="${pageContext.request.contextPath}/auth/student/lecture/${lectureNo}/qna/qnaOne/${questionNo}/${lastPage}/${questionPassword}">
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
							
							<div class="card-footer py-4">
								<nav aria-label="...">
									<form action="${pageContext.request.contextPath}/auth/student/lecture/${lectureNo}/qna/qnaOne/${questionNo}/insertStduentQuestionComment/${questionPassword}" method="post" id="insertCommentForm">
										<div>
											<div>
												<textarea rows="3" cols="50" name="questionCommentContent" class="form-control" id="questionCommentContent"></textarea>
											</div>
											<br>
											<button type="button" class="btn btn-sm btn-success" style="float:right" id="insertCommentBtn">댓글 입력</button>
										</div>
									</form>
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