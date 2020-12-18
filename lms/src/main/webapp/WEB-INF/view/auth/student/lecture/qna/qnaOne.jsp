<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>QnAOne</title>
</head>
	<body>
		<h1>공지사항 상세보기</h1>
		<div>
			<jsp:include page="/WEB-INF/view/auth/student/include/menu.jsp" />
		</div>
			<div>
				<table border="1">
					<tr>
						<td>질문 번호</td>
						<td>${question.questionNo}</td>
					</tr>
					<tr>
						<td>작성자</td>
						<td>${question.questionWriter}</td>
					</tr>
					<tr>
						<td>제목</td>
						<td>${question.questionTitle}</td>
					</tr>
					<tr>
						<td>내용</td>
						<td>${question.questionContent}</td>
					</tr>
					<tr>
						<td>작성일</td>
						<td>${question.questionCreatedate}</td>
					</tr>
					<tr>
						<td>수정일</td>
						<td>${question.questionUpdatedate}</td>
					</tr>
					<tr>
						<td>조회수</td>
						<td>${question.questionCount}</td>
					</tr>
				</table>
			</div>
		<hr>
			<h3>첨부 파일 리스트</h3>
			<c:forEach var="qfl" items="${question.questionFileList}">
				<table border="1">
					<tr>
						<td>파일 이름</td>
						<td><a href="${pageContext.request.contextPath}/resource/questionFile/${qfl.questionFileUuid}">${qfl.questionFileOriginal}</a></td>
					</tr>
					<tr>
						<td>파일 사이즈</td>
						<td>${qfl.questionFileSize}</td>
					</tr>
					<tr>
						<td>파일 타입</td>
						<td>${qfl.questionFileType}</td>
					</tr>
					<tr>
						<td>파일 다울로드 횟수</td>
						<td>${qfl.questionFileCount}</td>
					</tr>
					<tr>
						<td>파일 업로드 날짜</td>
						<td>${qfl.questionFileCreatedate}</td>
					</tr>
				</table>
			</c:forEach>
	</body>
</html>