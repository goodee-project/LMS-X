<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>reportOne</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<script>
			// 다운로드 횟수 증가 시키기
			function fileDownloadCount(paramUuid){
				$.ajax({
					url: '${pageContext.request.contextPath}/auth/student/lecture/report/reportSubmitFileCount/' + paramUuid,
					type:'post',
					success: function(data){
						let html = '다운 횟수 : ' + data + '회';
						$('#fileCount').html(html)
					}
				});
			}
		</script>
	</head>
	<body>
		<h1>과제 상세보기</h1>
		<div>
			<jsp:include page="/WEB-INF/view/auth/student/include/menu.jsp" />
	    </div>
		<div>
			<jsp:include page="/WEB-INF/view/auth/student/include/lectureMenu.jsp" />
	    </div>
	    
	    <!-- 과제 내용 -->
	    <div>
	    	<table border="1">
	    		<tr>
	    			<th>제목</th>
	    			<td>${report.reportTitle}</td>
	    		</tr>
	    		<tr>
	    			<th>제출 기간</th>
	    			<td>${report.reportStartdate} ~ ${report.reportEnddate}</td>
	    		</tr>
	    		<tr>
	    			<th>내용</th>
	    			<td>${report.reportContent}</td>
	    		</tr>
	    	</table>
	    </div>
	    
	    <!-- 과제 점수, 피드백 -->
	    <div>
	    	<table border="1">
	    		<tr>
	    			<th>점수</th>
	    			<td>
	    				<c:if test="${reportSubmit.reportSubmitPoint != -1}">
	    					${reportSubmit.reportSubmitPoint}점
	    				</c:if>
	    			</td>
	    		</tr>
	    		<tr>
	    			<th>피드백</th>
	    			<td>${reportSubmit.reportSubmitFeedback}</td>
	    		</tr>
	    	</table>
	    </div>
	    
	    <!-- 제출된 과제 내용  -->
	    <div>
	    	<!-- 내용 -->
	    	<table border="1">
	    		<tr>
	    			<th>제목</th>
	    			<td>${reportSubmit.reportSubmitTitle}</td>
	    		</tr>
	    		<tr>
	    			<th>내용</th>
	    			<td>${reportSubmit.reportSubmitContent}</td>
	    		</tr>
	    	</table>
	    	<!-- 첨부파일 -->
	    	<table border="1">
	    		<tr>
	    			<th colspan="3">첨부파일</th>
	    		</tr>
	    		<c:forEach items="${reportSubmit.reportSubmitFileList}" var="rsf">
	    			<tr>
	    				<td><a onclick="fileDownloadCount('${rsf.reportSubmitFileUuid}','${rsf.reportSubmitFileCount}')" download="${rsf.reportSubmitFileOriginal}" href="${pageContext.request.contextPath}/resource/reportSubmitFile/${rsf.reportSubmitFileUuid}">${rsf.reportSubmitFileOriginal}</a></td>
	    				<td>
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
	    					</c:choose>
	    				</td>
	    				<td id="fileCount">다운 횟수 : ${rsf.reportSubmitFileCount}회</td>
	    			</tr>
	    		</c:forEach>
	    	</table>
	    	<a href="${pageContext.request.contextPath}/auth/student/lecture/${lectureNo}/report/updateReport/${reportSubmit.reportNo}">수정</a>
	    	<a href="">삭제</a>
	    </div>    
	</body>
</html>