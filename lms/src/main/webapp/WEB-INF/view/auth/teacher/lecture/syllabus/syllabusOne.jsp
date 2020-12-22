<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>syllabusOne</title>
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
			// 다운로드 횟수 증가 시키기
			function fileDownloadCount(paramUuid){
				let fileId = paramUuid.split('.')[0];
				$.ajax({
					url: '${pageContext.request.contextPath}/auth/teacher/lecture/${lectureNo}/syllabus/syllabusSubmitFileCount/' + paramUuid,
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
				<h1>강의 계획서</h1>
				<P>강의 계획서입니다.</P>
			</div>
		</div>
		<!-- 본문 -->
		<div class="container">
			<h3>강의 계획서</h3>
			<c:if test="${empty syllabus.syllabusFileUuid}">
				<button type="button" class="btn btn-sm btn-primary" style="float: right;" onClick="location.href='${pageContext.request.contextPath}/auth/teacher/lecture/${lectureNo}/syllabus/insertSyllabus'">추가</button>
			</c:if>
			<br><br>
			<table class="table">
				<c:set var="uuid">${syllabus.syllabusFileUuid}</c:set>
				<c:if test="${!empty syllabus.syllabusFileUuid}">
					<tr>
						<td>
							${syllabus.syllabusFileCreatedate}
						</td>
						<td colspan="2">
							<div id="fileCount${fn:split(uuid, '.')[0]}" style="display: inline;">다운로드 횟수 : ${syllabus.syllabusFileCount}회</div>
						</td>
					</tr>
					<tr>
						<td>
							<a 
								onclick="fileDownloadCount('${syllabus.syllabusFileUuid}','${syllabus.syllabusFileCount}')"
								href="${pageContext.request.contextPath}/resource/syllabusFile/${syllabus.syllabusFileUuid}"
								download="${syllabus.syllabusFileOriginal}">
								${syllabus.syllabusFileOriginal} 
							</a><br>
						</td>
						<td>
							<!-- 파일 사이즈 -->
                            <c:choose>
                                <c:when test="${syllabus.syllabusFileSize >= (1024 * 1024)}">
                                    <fmt:formatNumber value="${syllabus.syllabusFileSize/(1024*1024)}" type="pattern" pattern="0.00" />MB
                                </c:when>
                                <c:when test="${syllabus.syllabusFileSize >= 1024}">
                                    <fmt:formatNumber value="${syllabus.syllabusFileSize/1024}" type="pattern" pattern="0.00" />B 
                                </c:when>
                                <c:otherwise>
                                    <fmt:formatNumber value="${syllabus.syllabusFileSize}" type="pattern" pattern="0.00" />KB
                                </c:otherwise>
                            </c:choose>
						</td>
						<td>
							<button type="button" class="btn btn-sm btn-danger" onclick="location.href='${pageContext.request.contextPath}/auth/teacher/lecture/${lectureNo}/syllabus/deleteSyllabus'">삭제</button>
						</td>
					</tr>
					<tr>
						
					</tr>
				</c:if>
				<c:if test="${empty syllabus.syllabusFileUuid}">
					<tr>
						<td>
							현재 첨부파일이 없습니다.
						</td>
					</tr>
				</c:if>
			</table>
		</div>
		
	</body>
</html>