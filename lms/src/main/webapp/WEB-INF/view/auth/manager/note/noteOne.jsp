<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>noteOne</title>
	</head>
	<body>
		<h1>쪽지 상세보기</h1>
		<!-- 홈으로 -->
		<div><a href="${pageContext.request.contextPath}/auth/manager/index">홈으로</a></div>
		<!-- 메뉴 -->
		<div>
		<a href="${pageContext.request.contextPath}/auth/manager/note/noteReceiveList/1">수신함</a>
			
		<a href="${pageContext.request.contextPath}/auth/manager/note/noteDispatchList/1">발신함</a>
			
		<a href="${pageContext.request.contextPath}/auth/manager/note/insertNote">쪽지 작성</a>
	</div>
	
	<!-- 본문 -->
	<table border="1">
		<tr>
			<th>제목</th>
			<td colspan="3">${note.noteTitle}</td>
		</tr>
		<tr>
			<th>보낸 사람</th>
			<td>${note.noteDispatcherName} (${note.noteDispatcherId})</td>
			<th>날짜</th>
			<td>${note.noteSendDate}</td>
		</tr>
		<tr>
			<th>받는 사람</th>
			<td colspan="3">${note.noteReceiverName} (${note.noteReceiverId})</td>
		</tr>
		<tr>
			<th>내용</th>
			<td colspan="3">${note.noteContent}</td>
		</tr>
	</table>
	<a href="${pageContext.request.contextPath}/auth/manager/note/deleteNote/${note.noteNo}/${note.noteDelete}">삭제</a>
	</body>
</html>