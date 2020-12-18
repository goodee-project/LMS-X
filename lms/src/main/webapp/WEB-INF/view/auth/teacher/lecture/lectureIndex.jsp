<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>lectureIndex</title>
		
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
				<h1>강좌</h1>
				<p>${lecture.lectureName}</p>
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
				<h3>강좌 공지사항</h3>
				<button type="button" class="btn btn-sm btn-dark" style="float: right;" onclick="location.href='${pageContext.request.contextPath}/auth/teacher/lecture/${lectureNo}/notice/noticeList/1'">더 보기</button>
			</div>
			
			<br><br>
			
			<table class="table">
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성일시</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${lectureNoticeList[0].lectureNoticeNo != null}">
						<c:forEach var="lnl" items="${lectureNoticeList}">
							<tr>
								<td width="15%">${lnl.lectureNoticeNo}</td>
								<td width="45%">
									<a href="${pageContext.request.contextPath}/auth/teacher/lecture/${lnl.lectureNo}/notice/noticeOne/${lnl.lectureNoticeNo}">${lnl.lectureNoticeTitle}</a>
								</td>
								<td width="20%">${lnl.lectureNoticeCreatedate}</td>
								<td width="20%">${lnl.lectureNoticeCount}</td>
							</tr>
						</c:forEach>
					</c:if>
					<c:if test="${lectureNoticeList[0].lectureNoticeNo == null}">
						<tr>
							<td colspan="7">(공지사항이 없습니다)</td>
						</tr>
					</c:if>
				</tbody>
			</table>
			
			<br><br>
		</div>
	</body>
</html>