<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>noteOne</title>
	</head>
	<body>
		<h1>쪽지 상세보기</h1>
		<!-- 메뉴 -->
		<div>
			<jsp:include page="/WEB-INF/view/auth/student/include/menu.jsp" />
	    </div>
		<div>
			<a href="${pageContext.request.contextPath}/auth/student/note/noteReceiveList/1">수신함</a>
			
			<a href="${pageContext.request.contextPath}/auth/student/note/noteDispatchList/1">발신함</a>
			
			<a href="${pageContext.request.contextPath}/auth/student/note/insertNote">쪽지 작성</a>
	    </div>
		
		<table border="1">
			<tr>
				<th>제목</th>
				<td colspan="3">${note.noteTitle}</td>
			</tr>
			<tr>
				<th>보낸사람</th>
				<td>${note.noteDispatcherName} (${note.noteDispatcherId})</td>
				<th>보낸날짜</th>
				<td>${note.noteSendDate}</td>
			</tr>
			<tr>
				<th>받는사람</th>
				<td colspan="3">${note.noteReceiverName} (${note.noteReceiverId})</td>
			</tr>
			<tr>
				<th>내용</th>
				<td colspan="3">${note.noteContent}</td>
			</tr>
		</table>
		
	</body>
</html>