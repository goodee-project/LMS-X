<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>archiveOne</title>
		
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
					url: '${pageContext.request.contextPath}/auth/teacher/lecture/${lectureNo}/archive/archiveSubmitFileCount/' + paramUuid,
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
				<h1>자료실</h1>
				<p>자료 조회 페이지입니다.</p>
			</div>
		</div>
		
		<!-- 본문 -->
		<div class="container">
			<h3>자료 조회</h3>
			
			<br>
			
			<button type="button" class="btn btn-sm btn-dark" onclick="location.href='${pageContext.request.contextPath}/auth/teacher/lecture/${lectureNo}/archive/archiveList/1'">목록</button>
			
			<div class="btn-group" style="float: right;">
				<button type="button" class="btn btn-sm btn-primary" onclick="location.href='${pageContext.request.contextPath}/auth/teacher/lecture/${lectureNo}/archive/updateArchive/${archiveNo}'">수정</button>
				<button type="button" class="btn btn-sm btn-danger" onclick="location.href='${pageContext.request.contextPath}/auth/teacher/lecture/${lectureNo}/archive/deleteArchive/${archiveNo}'">삭제</button>
			</div>
			
			<br><br>
			
			<table class="table">
				<tr>
					<td>게시글 번호</td>
					<td>${archiveNo}</td>
				</tr>
				<tr>
					<td>작성자</td>
					<td>${lectureArchive[0].lectureArchiveWriter}</td>
				</tr>
				<tr>
					<td>조회수</td>
					<td>${lectureArchive[0].lectureArchiveCount}</td>
				</tr>
				<tr>
					<td>작성일시</td>
					<td>${lectureArchive[0].lectureArchiveCreatedate}</td>
				</tr>
				<tr>
					<td>수정일시</td>
					<td>${lectureArchive[0].lectureArchiveUpdatedate}</td>
				</tr>
				<tr>
					<td>제목</td>
					<td>${lectureArchive[0].lectureArchiveTitle}</td>
				</tr>
				<tr>
					<td>내용</td>
					<td>${lectureArchive[0].lectureArchiveContent}</td>
				</tr>
				<tr>
					<td>첨부파일</td>
					<td>
						<c:forEach var="laf" items="${lectureArchive[0].lectureArchiveFileList}">
							<!-- 태그 id에 . 이 있으면 안되므로 uuid에서 확장자를 제외한 이름만 id로 지정해줌 -->
							<c:set var="uuid">${laf.lectureArchiveFileUuid}</c:set>
							<c:if test="${lectureArchive[0].lectureArchiveFileList[0].lectureArchiveFileOriginal != null}">
								<div>
									<a 
										onclick="fileDownloadCount('${laf.lectureArchiveFileUuid}','${laf.lectureArchiveFileCount}')"
										href="${pageContext.request.contextPath}/resource/archiveFile/${laf.lectureArchiveFileUuid}" download="${laf.lectureArchiveFileOriginal}">
										${laf.lectureArchiveFileOriginal}
									</a>
									&nbsp;(${laf.lectureArchiveFileType}, ${laf.lectureArchiveFileSize}KByte, <div id="fileCount${fn:split(uuid, '.')[0]}" style="display: inline;">다운로드 횟수 : ${laf.lectureArchiveFileCount}</div>)
								</div>
							</c:if>
							<c:if test="${lectureArchive[0].lectureArchiveFileList[0].lectureArchiveFileOriginal == null}">
								(첨부파일이 없습니다)	
							</c:if>
						</c:forEach>
					</td>
				</tr>
			</table>
		</div>
		
		<br><br>
	</body>
</html>