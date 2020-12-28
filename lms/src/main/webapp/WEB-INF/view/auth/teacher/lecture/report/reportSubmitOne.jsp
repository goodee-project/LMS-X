<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>reportSubmitOne</title>
		
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
	</head>
	<body>
		<!-- 내비게이션 메인 메뉴 -->
		<jsp:include page="/WEB-INF/view/auth/teacher/include/menu.jsp" />
		
		<!-- 내비게이션 서브 메뉴 -->
		<jsp:include page="/WEB-INF/view/auth/teacher/include/lectureMenu.jsp" />
		
		<!-- 상단 인터페이스 -->
		<div class="jumbotron jumbotron-fluid">
			<div class="container">
				<h1>학생 과제 제출 조회</h1>
				<p>학생이 제출한 과제를 조회합니다.</p>
			</div>
		</div>
	
		<!-- 본문 -->
		<div class="container">
			<h3>학생 과제 제출 조회</h3>
			
			<br>
			
			<table class="table">
				<tr>
					<td width="20%">제출 학생</td>
					<td width="80%">${reportSubmit[0].reportSubmitWriter}&#40;${reportSubmit[0].accountId}&#41;</td>
				</tr>
				<tr>
					<td>제출 시간</td>
					<td>${reportSubmit[0].reportSubmitCreatedate}</td>
				</tr>
				<tr>
					<td>수정 시간</td>
					<td>${reportSubmit[0].reportSubmitUpdatedate}</td>
				</tr>
				<tr>
					<td>제목</td>
					<td>${reportSubmit[0].reportSubmitTitle}</td>
				</tr>
				<tr>
					<td>내용</td>
					<td>${reportSubmit[0].reportSubmitContent}</td>
				</tr>
			</table>
			
			<br>
			
			<h3>첨부파일</h3>
			
			<br>
			
			<table class="table">
				<c:forEach var="rsf" items="${reportSubmit[0].reportSubmitFileList}">
					<tr>
						<td>
							<c:if test="${reportSubmit[0].reportSubmitFileList[0].reportSubmitFileOriginal != null}">
								<a href="${pageContext.request.contextPath}/resource/reportSubmitFile/${rsf.reportSubmitFileUuid}" download="${rsf.reportSubmitFileOriginal}">${rsf.reportSubmitFileOriginal}</a>
								&nbsp;(${rsf.reportSubmitFileType}, ${rsf.reportSubmitFileSize}KByte)
							</c:if>
							<c:if test="${reportSubmit[0].reportSubmitFileList[0].reportSubmitFileOriginal == null}">
								(첨부파일이 없습니다)	
							</c:if>
						</td>
					</tr>
				</c:forEach>
			</table>
			
			<br>
			
			<div>
				<h3>과제 평가</h3>
				<!-- 점수 입력이 되지 않은 경우 -->
				<c:if test="${reportSubmit[0].reportSubmitPoint == -1}">
					<button type="button" class="btn btn-sm btn-success" style="float: right;" onclick="location.href='${pageContext.request.contextPath}/auth/teacher/lecture/${lectureNo}/report/reportOne/insertReportSubmit/${reportSubmit[0].reportSubmitNo}'">평가 입력</button>
				</c:if>
				<!-- 점수 입력이 되어 있는 경우 -->
				<c:if test="${reportSubmit[0].reportSubmitPoint != -1}">
					<button type="button" class="btn btn-sm btn-primary" style="float: right;" onclick="location.href='${pageContext.request.contextPath}/auth/teacher/lecture/${lectureNo}/report/reportOne/updateReportSubmit/${reportSubmit[0].reportSubmitNo}'">평가 수정</button>
				</c:if>
			</div>
			
			<br><br>
			
			<table class="table">
				<tr>
					<td>점수</td>
					<!-- 점수 입력이 되지 않은 경우 -->
					<c:if test="${reportSubmit[0].reportSubmitPoint == -1}">
						<td>(미입력)</td>
					</c:if>
					<!-- 점수 입력이 되어 있는 경우 -->
					<c:if test="${reportSubmit[0].reportSubmitPoint != -1}">
						<td>${reportSubmit[0].reportSubmitPoint}</td>
					</c:if>
				</tr>
				<tr>
					<td>평가 내용</td>
					<!-- 평가 내용 입력이 되지 않은 경우 -->
					<c:if test="${reportSubmit[0].reportSubmitFeedback == null}">
						<td>(평가 내용이 없습니다)</td>
					</c:if>
					<!-- 평가 내용 입력이 되어 있는 경우 -->
					<c:if test="${reportSubmit[0].reportSubmitFeedback != null}">
						<td>${reportSubmit[0].reportSubmitFeedback}</td>
					</c:if>
				</tr>
			
			
				<c:if test="${reportSubmit[0].reportSubmitNo != null}">
					<tr>
						<td></td>
					</tr>
				</c:if>
				<c:if test="${reportSubmit[0].reportSubmitNo == null}">
					<tr>
						<td colspan="7">(평가 내용이 없습니다)</td>
					</tr>
				</c:if>
			</table>
			
		</div>
		
		<br><br>
	</body>
</html>