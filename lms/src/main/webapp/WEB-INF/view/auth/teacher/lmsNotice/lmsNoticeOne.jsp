<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>lmsNoticeOne</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<!-- textArea자동조절 라이브러리 -->
	<script src="https://rawgit.com/jackmoore/autosize/master/dist/autosize.min.js"></script>
	<script>
		$(document).ready(function(){
			//textarea 크기 자동 조정
			autosize($("textArea"));
		});
	</script>
</head>
<body>
	<div>
		<jsp:include page="/WEB-INF/view/auth/teacher/include/menu.jsp" />
	</div>
	<h1>공지사항 상세보기</h1>
	<div>
		${lmsNotice.lmsNoticeTitle}
	</div>
	<div>${lmsNotice.lmsNoticeWriter}</div>
	<div><span>${lmsNotice.lmsNoticeCreatedate}</span><span style="margin-left: 20px;">조회 ${lmsNotice.lmsNoticeCount}</span></div>
	<hr>
	<div><textarea rows="20px" cols="100px" readonly="readonly" disabled>${lmsNotice.lmsNoticeContent}</textarea> </div>
</body>
</html>