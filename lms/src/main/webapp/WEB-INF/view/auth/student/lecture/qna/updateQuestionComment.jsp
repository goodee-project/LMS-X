<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Question Comment</title>
</head>
<body>
	<h1>댓글 수정</h1>
	<form method="post" action="${pageContext.request.contextPath}/auth/student/lecture/${lectureNo}/qna/qnaOne/${questionNo}/updateStduentQuestionComment">
	<input type="hidden" name="questionNo" value="${questionComment.questionNo}"> 
		<table>
			<tr>
				<td>번호</td>
				<td><input type="text" name="questionCommentNo" value="${questionComment.questionCommentNo}" readonly="readonly" ></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><input type="text" name="questionCommentWriter" value="${questionComment.questionCommentWriter}" readonly="readonly" ></td>
			</tr>
			<tr>
				<td>댓글 내용</td>
				<td><textarea rows="3" cols="50" name="questionCommentContent">${questionComment.questionCommentContent}</textarea></td>
			</tr>
		</table>
		<button type="submit">댓글입력</button>
	</form>
</body>
</html>