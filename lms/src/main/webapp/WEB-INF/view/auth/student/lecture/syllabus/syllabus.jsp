<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<script>			
			// 다운로드 횟수 증가 시키기
			function fileDownloadCount(paramUuid){
				let fileId = paramUuid.split('.')[0];
				$.ajax({
					url: '${pageContext.request.contextPath}/auth/student/lecture/syllabus/studentSyllabusFileCount/' + paramUuid,
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
		<h1>강의 계획서</h1>
		<div>
			<jsp:include page="/WEB-INF/view/auth/student/include/menu.jsp" />
		</div>

			<h3>강의 첨부 파일</h3>
			<c:forEach var="sy" items="${syllabus}">
			<!-- 태그 id에 . 이 있으면 안되므로 uuid에서 확장자를 제외한 이름만 id로 지정해줌 -->
	   			<c:set var="uuid">${sy.syllabusFileUuid}</c:set>
				<table border="1">
					<tr>
						<td>파일 이름</td>
						<td><a onclick="fileDownloadCount('${sy.syllabusFileUuid}','${sy.syllabusFileCount}')" download="${sy.syllabusFileOriginal}" href="${pageContext.request.contextPath}/resource/syllabusFile/${sy.syllabusFileUuid}">${sy.syllabusFileOriginal}</a></td>
					</tr>
					<tr>
						<td>파일 사이즈</td>
						<!-- 파일 사이즈 -->
						<td>
	    					<c:choose>
	    						<c:when test="${sy.syllabusFileSize >= (1024 * 1024)}">
	    							<fmt:formatNumber value="${sy.syllabusFileSize/(1024*1024)}" type="pattern" pattern="0.00" />MB					
	    						</c:when>
	    						<c:when test="${sy.syllabusFileSize >= 1024}">
	    							<fmt:formatNumber value="${sy.syllabusFileSize/1024}" type="pattern" pattern="0.00" />B 
	    						</c:when>
	    						<c:otherwise>
	    							<fmt:formatNumber value="${sy.syllabusFileSize}" type="pattern" pattern="0.00" />KB 	
	    						</c:otherwise>
	    					</c:choose>
	    				</td>
					</tr>
					<tr>
						<td>파일 타입</td>
						<td>${sy.syllabusFileType}</td>
					</tr>
					<tr>
						<td>파일 다운로드 횟수</td>
						<td id="fileCount${fn:split(uuid ,'.')[0]}">다운 횟수 : ${sy.syllabusFileCount}회</td>
					</tr>
					<tr>
						<td>파일 업로드 날짜</td>
						<td>${sy.syllabusFileCreatedate}</td>
					</tr>
				</table>
			</c:forEach>
	</body>
</html>