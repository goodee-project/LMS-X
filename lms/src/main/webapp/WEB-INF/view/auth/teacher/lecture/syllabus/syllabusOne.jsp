<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
				<c:if test="${!empty syllabus.syllabusFileUuid}">
					<tr>
						<td>
							<a href="${pageContext.request.contextPath}/resource/archiveFile/${syllabus.syllabusFileUuid}">${syllabus.syllabusFileOriginal}</a><br>
						</td>
						<td>
							<button type="button" class="btn btn-sm btn-dark" onclick="location.href='${pageContext.request.contextPath}/auth/teacher/lecture/${lectureNo}/syllabus/deleteFile">삭제</button>
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