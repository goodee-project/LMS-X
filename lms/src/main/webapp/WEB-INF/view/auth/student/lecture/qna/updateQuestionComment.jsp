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
	<Form action="${pageContext.request.contextPath}/auth/student/lecture/${lectureNo}/qna/qnaOne/${questionNo}/updateQuestionComment/${questionCommentNo}"  method="post">
		<div>
			<div>
				<textarea rows="3" cols="50" name="questionCommentContent">${questionComment.questionCommentContent}</textarea>
			</div>
			<button type="submit">댓글입력</button>
		</div>
	</Form>
</body>
</html>