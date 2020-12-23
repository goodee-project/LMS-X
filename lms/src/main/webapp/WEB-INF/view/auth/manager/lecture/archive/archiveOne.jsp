<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>자료실 상세 페이지</h1>
	<table border="1">
		<tr>
			<td>게시글 번호</td>
			<td>${archiveNo}</td>
		</tr>
		<tr>
			<td>작성자</td>
			<td>${lectureArchive[0].lectureArchiveWriter}</td>
		</tr>
		<tr>
			<td>조회수</td>
			<td>${lectureArchive[0].lectureArchiveCount}</td>
		</tr>
		<tr>
			<td>작성일시</td>
			<td>${lectureArchive[0].lectureArchiveCreatedate}</td>
		</tr>
		<tr>
			<td>수정일시</td>
			<td>${lectureArchive[0].lectureArchiveUpdatedate}</td>
		</tr>
		<tr>
			<td>제목</td>
			<td>${lectureArchive[0].lectureArchiveTitle}</td>
		</tr>
		<tr>
			<td>내용</td>
			<td>${lectureArchive[0].lectureArchiveContent}</td>
		</tr>
	</table>
</body>
</html>