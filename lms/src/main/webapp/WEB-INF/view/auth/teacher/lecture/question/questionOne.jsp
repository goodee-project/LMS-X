<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>questionOne</title>
		<!-- Bootstrap Framework 사용 -->
		
		<!-- Latest compiled and minified CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
		
		<!-- jQuery library -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		
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
			$(document).ready(function(){
				$('#insertBtn').click(function(){
					if($('#insertCommentText').val().length <= 0){
						alert('댓글을 입력해주세요.');
						return;
						}
					$('#insertCommentForm').submit();
					});
				});
			// 다운로드 횟수 증가 시키기
			function fileDownloadCount(paramUuid){
				let fileId = paramUuid.split('.')[0];
				$.ajax({
					url: '${pageContext.request.contextPath}/auth/teacher/lecture/${lectureNo}/question/questionSubmitFileCount/' + paramUuid,
					type:'post',
					success: function(data){
						let html = '다운로드 횟수 : ' + data + '회';
						$('#fileCount' + fileId).html(html);
					}
				});
			}
		</script>
	</head>
	<body>
		<!-- 내비게이션 메인 메뉴 -->
		<jsp:include page="/WEB-INF/view/auth/teacher/include/menu.jsp" />
		
		<!-- 내비게이션 서브 메뉴 -->
		<jsp:include page="/WEB-INF/view/auth/teacher/include/lectureMenu.jsp" />
	
		<!-- 상단 인터페이스 -->
		<div class="jumbotron jumbotron-fluid">
			<div class="container">
				<h1>QnA 게시판</h1>
				<p>강좌 QnA 게시판입니다.</p>
			</div>
		</div>
		
		<!-- 본문 -->
		<div class="container">
			<button type="button" class="btn btn-sm btn-dark" onclick="location.href='${pageContext.request.contextPath}/auth/teacher/lecture/${lectureNo}/question/questionList/1'">목록</button>
			<br><br>
			<table class="table">
				<tr>
					<td>
						번호:${questionNo}
					</td>
				</tr>
				<tr>
					<td>
						${question[0].questionTitle}
					</td>
				</tr>
				<tr>
				</tr>
				<tr>
					<td>${question[0].questionWriter}</td>
				</tr>
				<tr>
					<td>조회수:${question[0].questionCount}</td>
				</tr>
				<tr>
					<td>작성일:${question[0].questionCreatedate}</td>
				</tr>
				<tr>
					<td>수정일:${question[0].questionUpdatedate}</td>
				</tr>
				<tr>
					<td colspan="2">
						<c:forEach var="qfl" items="${question[0].questionFileList}">
						<!-- 태그 id에 .이 있으면 안되므로 uuid에서 확장자를 제외한 이름만 id로 지정해줌 -->
						<c:set var="uuid">${qfl.questionFileUuid}</c:set>
						<c:if test="${!empty question[0].questionFileList[0].questionFileOriginal}">
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
						<c:if test="${empty question[0].questionFileList[0].questionFileOriginal}">
							<p>(첨부파일이 없습니다.)</p>
						</c:if>
					</td>
				</tr>
				<tr>
					<td colspan="2">조회수:${question[0].questionCount}</td>
				</tr>
				<tr>
					<td colspan="2">
						<textarea class="form-control">${question[0].questionContent}</textarea>
					</td>
				</tr>
			</table>
			<!-- 댓글 리스트 -->
			<table class="table">
				<c:forEach var="qc" items="${questionComment}">
					<c:if test="${!empty qc.questionCommentNo}">
						<tr>
							<td>${qc.questionCommentNo}</td>
							<td>${qc.questionCommentWriter}</td>
							<td>${qc.questionCommentContent}</td>
							<td>작성일 : ${qc.questionCommentCreatedate}</td>
							<td>수정일 : ${qc.questionCommentUpdatedate}</td>
							<td>
								<button type="button" class="btn btn-sm btn-dark" onclick="location.href='${pageContext.request.contextPath}/auth/teacher/lecture/${lectureNo}/question/questionOne/${questionNo}/updateQuestionComment/${qc.questionCommentNo}'">수정</button>
								&nbsp;
								<button type="button" class="btn btn-sm btn-danger" onclick="location.href='${pageContext.request.contextPath}/auth/teacher/lecture/${lectureNo}/question/questionOne/${questionNo}/deleteQuestionComment/${qc.questionCommentNo}'">삭제</button>
							</td>
						</tr>
					</c:if>
					<c:if test="${empty qc.questionCommentNo}">
						<tr>
							<td>
								<p>(댓글이 없습니다.)</p>
							</td>
						</tr>
					</c:if>
				</c:forEach>
			</table>
			<form action="${pageContext.request.contextPath}/auth/teacher/lecture/${lectureNo}/question/questionOne/${questionNo}/insertTeacherQuestionComment" method="post" id="insertCommentForm">
				<div>
					<div>
						<textarea rows="3" cols="50" name="questionCommentContent" class="form-control" id="insertCommentText"></textarea>
					</div>
					<br><br>
					<button type="button" class="btn btn-sm btn-primary" style="float:right" id="insertBtn">댓글입력</button>
					<br><br>
				</div>
			</form>
		<!-- 페이지 내비게이션 -->
		<ul class="pagination justify-content-center">
			<!-- 처음으로 버튼 -->
			<c:choose>
				<c:when test="${currentPage > 1}">
					<li class="page-item">
						<a class="page-link" href="${pageContext.request.contextPath}/auth/teacher/lecture/question/questionOne/${questionNo}/1">
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
						<a class="page-link" href="${pageContext.request.contextPath}/auth/teacher/lecture/${lectureNo}/question/questionOne/${questionNo}/${prePage}">
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
								<a class="page-link" href="${pageContext.request.contextPath}/auth/teacher/lecture/${lectureNo}/question/questionOne/${questionNo}/${i}">${i}</a>
							</li>
						</c:otherwise>
					</c:choose>
				</c:if>
			</c:forEach>
			
			<!-- 다음 버튼 -->
			<c:choose>
				<c:when test="${currentPage < lastPage}">
					<li class="page-item">
						<a class="page-link" href="${pageContext.request.contextPath}/auth/teacher/lecture/question/questionOne/${questionNo}/${nextPage}">
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
						<a class="page-link" href="${pageContext.request.contextPath}/auth/teacher/lecture/${lectureNo}/question/questionOne/${questionNo}/${lastPage}">
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
					<button type="button" class="btn btn-outline-dark btn-sm">
						${currentPage} / ${lastPage} 페이지
					</button>
				</td>
			</tr>
		</table>
		</div>
	</body>
</html>