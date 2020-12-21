<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>reportOne</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<script>			
			// 다운로드 횟수 증가 시키기
			function fileDownloadCount(paramUuid){
				let fileId = paramUuid.split('.')[0];
				$.ajax({
					url: '${pageContext.request.contextPath}/auth/student/lecture/archive/archiveFileCount/' + paramUuid,
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
		<h1>자료실 상세보기</h1>
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
	    			<td>${archive.lectureArchiveTitle}</td>
	    			<th>조회수</th>
	    			<td>${archive.lectureArchiveCount}</td>
	    		</tr>
	    		<tr>
	    			<th>작성자</th>
	    			<td>${archive.lectureArchiveWriter}</td>
	    			<th>작성일</th>
	    			<td>${archive.lectureArchiveCreatedate}</td>
	    		</tr>
	    		<tr>
	    			<th>내용</th>
	    			<td colspan="3">${archive.lectureArchiveContent}</td>
	    		</tr>
	    	</table>
	    </div>
	    <div>
	    	<!-- 첨부파일 -->
	    	<table border="1">
	    		<tr>
	    			<th colspan="3">첨부파일</th>
	    		</tr>
	    		<c:forEach items="${archive.lectureArchiveFileList}" var="laf">
	    			<!-- 태그 id에 . 이 있으면 안되므로 uuid에서 확장자를 제외한 이름만 id로 지정해줌 -->
	   				<c:set var="uuid">${laf.lectureArchiveFileUuid}</c:set>
	    			<tr>
	    				<td><a onclick="fileDownloadCount('${laf.lectureArchiveFileUuid}','${laf.lectureArchiveFileCount}')" download="${laf.lectureArchiveFileOriginal}" href="${pageContext.request.contextPath}/resource/archiveFile/${laf.lectureArchiveFileUuid}">${laf.lectureArchiveFileOriginal}</a></td>
	    				<td>
	    					<!-- 파일 사이즈 -->
	    					<c:choose>
	    						<c:when test="${laf.lectureArchiveFileSize >= (1024 * 1024)}">
	    							<fmt:formatNumber value="${laf.lectureArchiveFileSize/(1024*1024)}" type="pattern" pattern="0.00" />MB					
	    						</c:when>
	    						<c:when test="${laf.lectureArchiveFileSize >= 1024}">
	    							<fmt:formatNumber value="${laf.lectureArchiveFileSize/1024}" type="pattern" pattern="0.00" />B 
	    						</c:when>
	    						<c:otherwise>
	    							<fmt:formatNumber value="${laf.lectureArchiveFileSize}" type="pattern" pattern="0.00" />KB 	
	    						</c:otherwise>
	    					</c:choose>
	    				</td>
	    				<td id="fileCount${fn:split(uuid ,'.')[0]}">다운 횟수 : ${laf.lectureArchiveFileCount}회</td>
	    			</tr>
	    		</c:forEach>
	    	</table>
	    </div>    
	</body>
</html>