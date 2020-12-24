<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>QnAOne</title>
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
		<h1>질문 상세보기</h1>
		<div>
			<jsp:include page="/WEB-INF/view/auth/student/include/menu.jsp" />
		</div>
		<div>
         <jsp:include page="/WEB-INF/view/auth/student/include/lectureMenu.jsp" />
        </div>
			<div>
				<table border="1">
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
		<hr>
			<h3>첨부 파일 리스트</h3>
			<c:forEach var="qfl" items="${question.questionFileList}">
			<!-- 태그 id에 . 이 있으면 안되므로 uuid에서 확장자를 제외한 이름만 id로 지정해줌 -->
	   			<c:set var="uuid">${qfl.questionFileUuid}</c:set>
				<table border="1">
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
			
			<c:if test="${accountId == accountId}">
				<td><a href="${pageContext.request.contextPath}/auth/student/lecture/${lectureNo}/qna/updateQna/${question.questionNo}">질문 수정</a></td>
				<td><a href="${pageContext.request.contextPath}/auth/student/lecture/${lectureNo}/qna/deleteQuestion/${question.questionNo}">삭제</a></td>
			</c:if>
			
		<hr>
			<h3>댓글 리스트</h3>
			<table border="1" >
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
			<form action="${pageContext.request.contextPath}/auth/student/lecture/${lectureNo}/qna/qnaOne/${questionNo}/insertStduentQuestionComment" method="post">
			<div>
				<div>
					<textarea rows="3" cols="50" name="questionCommentContent"></textarea>
				</div>
				<button type="submit">댓글입력</button>
			</div>
		</form>
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
						<li>
							<a href="${pageContext.request.contextPath}/auth/student/lecture/${lectureNo}/qna/qnaOne/${questionNo}/${prePage}">
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
						<li >
							<a href="${pageContext.request.contextPath}/auth/student/lecture/${lectureNo}/qna/qnaOne/${questionNo}/${nextPage}">
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
					<button type="button" class="btn btn-outline-dark btn-sm">
						${currentPage} / ${lastPage} 페이지
					</button>
				</td>
			</tr>
		</table>
	</body>
</html>
