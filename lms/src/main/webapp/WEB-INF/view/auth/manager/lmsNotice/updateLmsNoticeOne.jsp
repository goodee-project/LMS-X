<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
	<h1>공지사항 수정</h1>
	<form method="post" action="${pageContext.request.contextPath}/auth/manager/lmsNotice/updateLmsNoticeOne">
		<button type="submit">수정</button>
		<table class="table table-bordered">
			<tr>
				<td>공지 번호</td>
				<td><input type="text" value="${lmsNotice.lmsNoticeNo}" name="lmsNoticeNo" hidden="hidden">${lmsNotice.lmsNoticeNo}</td>
			</tr>
			<tr>
				<td>작성자</td>
				<td>${lmsNotice.lmsNoticeWriter}(${lmsNotice.accountId})</td>
			</tr>
			<tr>
				<td>공지 제목</td>
				<td><input type="text" value="${lmsNotice.lmsNoticeTitle}" name="lmsNoticeTitle"></td>
			</tr>
			<tr>
				<td>공지 내용</td>
				<td><textarea rows="20px;" cols="70px;" name="lmsNoticeContent">${lmsNotice.lmsNoticeContent}</textarea>
			</tr>
		</table>
	</form>
</body>
</html>