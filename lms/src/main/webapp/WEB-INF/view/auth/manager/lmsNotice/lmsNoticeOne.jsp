<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>lmsNoticeOne</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
	<h1>공지사항 상세보기</h1>
	<c:if test="${lmsNotice.accountId == sessionScope.loginId}">
		<a href="${pageContext.request.contextPath}/auth/manager/lmsNotice/updateLmsNoticeOne/${lmsNotice.lmsNoticeNo}">수정</a>
	</c:if>
	<div>
		${lmsNotice.lmsNoticeTitle}
	</div>
	<div>${lmsNotice.lmsNoticeWriter}</div>
	<div><span>${lmsNotice.lmsNoticeCreatedate}</span><span style="margin-left: 20px;">조회 ${lmsNotice.lmsNoticeCount}</span></div>
	<hr>
	<div><textarea rows="20px" cols="100px" readonly="readonly">${lmsNotice.lmsNoticeContent}</textarea> </div>
</body>
</html>