<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>testOne</title>
		
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
				<h1>시험 정보 입력</h1>
				<p>시험 정보를 입력하는 메뉴입니다.</p>
			</div>
		</div>
		
		<!-- 본문 -->
		<div class="container">			
			<h3>강좌 정보</h3>
			
			<br>
			
			<table class="table">
				<thead>
					<th>과목</th>
					<th>강좌</th>
					<th>강사</th>
					<th>개강일</th>
					<th>종강일</th>
				</thead>
				<tbody>
					<tr>
						<td>${lecture.subject.subjectName}</td>
						<td>${lecture.lectureName}</td>
						<td>${lecture.teacherName}</td>
						<td>${lecture.lectureStartdate}</td>
						<td>${lecture.lectureEnddate}</td>
					</tr>
				</tbody>
			</table>
			
			<br>
			
			<div>
				<h3>시험 정보</h3>
				<c:if test="${test.testContent == null}">
					<button type="button" class="btn btn-sm btn-success" style="float: right;" onclick="location.href='${pageContext.request.contextPath}/auth/teacher/lecture/${lectureNo}/test/insertTest'">작성</button>
				</c:if>
				<c:if test="${test.testContent != null}">
					<button type="button" class="btn btn-sm btn-primary" style="float: right;" onclick="location.href='${pageContext.request.contextPath}/auth/teacher/lecture/${lectureNo}/test/updateTest'">수정</button>
				</c:if>
			</div>
			
			<br><br>
			
			<c:if test="${test.testStartdate != null}">
				<table class="table">
					<tr>
						<td width="30%">시험 시작</td>
						<td width="70%">${test.testStartdate}</td>
					</tr>
					<tr>
						<td>시험 종료</td>
						<td>${test.testEnddate}</td>
					</tr>
					<tr>
						<td>시험 제목</td>
						<td>${test.testContent}</td>
					</tr>
					<tr>
						<td>정보 최초 입력</td>
						<td>${test.testCreatedate}</td>
					</tr>
					<tr>
						<td>정보 최종 수정</td>
						<td>${test.testUpdatedate}</td>
					</tr>
				</table>
			</c:if>
			<c:if test="${test.testStartdate == null}">
				<table class="table">
					<tr>
						<td>
							(시험 정보가 없습니다. 정보를 입력해주세요.)
						</td>
					</tr>
				</table>
			</c:if>
		</div>
		
		<br><br>
	</body>
</html>