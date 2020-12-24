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
			<td>${lectureArchive.lectureArchiveNo}</td>
		</tr>
		<tr>
			<td>작성자</td>
			<td>${lectureArchive.lectureArchiveWriter}</td>
		</tr>
		<tr>
			<td>조회수</td>
			<td>${lectureArchive.lectureArchiveCount}</td>
		</tr>
		<tr>
			<td>작성일시</td>
			<td>${lectureArchive.lectureArchiveCreatedate}</td>
		</tr>
		<tr>
			<td>수정일시</td>
			<td>${lectureArchive.lectureArchiveUpdatedate}</td>
		</tr>
		<tr>
			<td>제목</td>
			<td>${lectureArchive.lectureArchiveTitle}</td>
		</tr>
		<tr>
			<td>내용</td>
			<td>${lectureArchive.lectureArchiveContent}</td>
		</tr>
	</table>
</body>
</html>