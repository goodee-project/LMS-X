<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>noteDispatchList</title>
</head>
<body>
	<!-- 홈으로 -->
	<div><a href="${pageContext.request.contextPath}/auth/manager/index">홈으로</a></div>
	<!-- 메뉴 -->
	<div>
		<a href="${pageContext.request.contextPath}/auth/manager/note/noteReceiveList/1">수신함</a>
			
		<a href="${pageContext.request.contextPath}/auth/manager/note/noteDispatchList/1">발신함</a>
			
		<a href="${pageContext.request.contextPath}/auth/manager/note/insertNote">쪽지 작성</a>
	</div>
	<table border="1">
		<thead>
			<tr>
				<td>상태</td>
				<td>제목</td>
				<td>받는 사람</td>
				<td>날짜</td>
			</tr>
		</thead>
		<tbody>
			<c:if test="${!empty noteList[0].noteNo}">
					<c:forEach var="nl" items="${noteList}">
						<tr>
							<td>
								<c:if test="${nl.noteIsRead == 'Y'}">
									읽음
								</c:if>
								<c:if test="${nl.noteIsRead == 'N'}">
									!
								</c:if>
							</td>
							<td><a href="${pageContext.request.contextPath}/auth/manager/note/noteDispatchOne/${nl.noteNo}">${nl.noteTitle}</a></td>
							<td>${nl.noteReceiverName}(${nl.noteReceiverName})</td>
							<td>${nl.noteSendDate}</td>
						</tr>
					</c:forEach>
				</c:if>
				<c:if test="${empty noteList[0].noteNo}">
					<tr>
						<td colspan="4">(현재 받은 쪽지가 없습니다.)</td>
					</tr>
				</c:if>
		</tbody>
	</table>
</body>
</html>