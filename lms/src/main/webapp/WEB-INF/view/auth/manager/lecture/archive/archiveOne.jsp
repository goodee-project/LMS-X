<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	// 다운로드 횟수 증가 시키기
	function fileDownloadCount(paramUuid){
		let fileId = paramUuid.split('.')[0];
		$.ajax({
			url: '${pageContext.request.contextPath}/auth/manager/lecture/${lectureNo}/archive/archiveFileCount/' + paramUuid,
			type:'post',
			success: function(data){
				console.log(data);
				let html = '다운로드 횟수 : ' + data + '회';
				$('#fileCount' + fileId).html(html);
			}
		});
	}
</script>
</head>
<body>
	<div>
		<button type="button" onclick="location.href='${pageContext.request.contextPath}/auth/manager/lecture/${lectureNo}/archive/deleteArchive/${archiveNo}'">삭제</button>
	</div>
	<h1>자료실 상세 페이지</h1>
	<table border="1">
		<tr>
			<td>게시글 번호</td>
			<td>${lectureArchive.lectureArchiveNo}</td>
		</tr>
		<tr>
			<td>작성자</td>
			<td>${lectureArchive.lectureArchiveWriter}</td>
		</tr>
		<tr>
			<td>조회수</td>
			<td>${lectureArchive.lectureArchiveCount}</td>
		</tr>
		<tr>
			<td>작성일시</td>
			<td>${lectureArchive.lectureArchiveCreatedate}</td>
		</tr>
		<tr>
			<td>수정일시</td>
			<td>${lectureArchive.lectureArchiveUpdatedate}</td>
		</tr>
		<tr>
			<td>제목</td>
			<td>${lectureArchive.lectureArchiveTitle}</td>
		</tr>
		<tr>
			<td>내용</td>
			<td>${lectureArchive.lectureArchiveContent}</td>
		</tr>
		<tr>
			<td>첨부파일</td>
			<td>
				<c:forEach var="laf" items="${lectureArchive.lectureArchiveFileList}">
					<!-- 태그 id에 . 이 있으면 안되므로 uuid에서 확장자를 제외한 이름만 id로 지정해줌 -->
					<c:set var="uuid">${laf.lectureArchiveFileUuid}</c:set>
					<c:if test="${lectureArchive.lectureArchiveFileList[0].lectureArchiveFileOriginal != null}">
						<div>
							<a
								onclick="fileDownloadCount('${laf.lectureArchiveFileUuid}')"
								href="${pageContext.request.contextPath}/resource/archiveFile/${laf.lectureArchiveFileUuid}" download>
								${laf.lectureArchiveFileOriginal}
							</a>
							&nbsp;(${laf.lectureArchiveFileType}, ${laf.lectureArchiveFileSize}KByte, <div id="fileCount${fn:split(uuid, '.')}" style="display: inline;">다운로드 횟수 : ${laf.lectureArchiveFileCount}</div>
						</div>
					</c:if>
					<c:if test="${lectureArchive.lectureArchiveFileList[0].lectureArchiveFileOriginal == null}">
						(첨부파일이 없습니다)	
					</c:if>
				</c:forEach>
			</td>
		</tr>
	</table>
</body>
</html>