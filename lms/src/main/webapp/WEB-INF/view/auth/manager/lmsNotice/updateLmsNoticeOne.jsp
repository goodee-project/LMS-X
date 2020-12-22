<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<!-- textArea자동조절 라이브러리 -->
	<script src="https://rawgit.com/jackmoore/autosize/master/dist/autosize.min.js"></script>
	<script>
		$(document).ready(function(){
			//textarea 크기 자동 조정
			autosize($("textArea"));
		
			$('#updateBtn').click(function(){
				if ($('#lmsNoticeTitle').val() == "") {
					$('#lmsNoticeTitle').focus();
					return;
				}
				if ($('#lmsNoticeContent').val() == "") {
					$('#lmsNoticeContent').focus();
					return;
				}
				$('#updateForm').submit();
			});
		});
	</script>
</head>
<body>
	<div>
		<jsp:include page="/WEB-INF/view/auth/manager/include/menu.jsp" />
	</div>
	<h1>공지사항 수정</h1>
	<form id="updateForm" method="post" action="${pageContext.request.contextPath}/auth/manager/lmsNotice/updateLmsNoticeOne">
		<button id="updateBtn" type="button">수정</button>
			<div><input type="text" value="${lmsNotice.lmsNoticeNo}" name="lmsNoticeNo" hidden="hidden"></div>
			<div>
				<input id="lmsNoticeTitle" type="text" name="lmsNoticeTitle" value="${lmsNotice.lmsNoticeTitle}" placeholder="제목을 입력해주세요.">
			</div>
			<hr>
			<div>
				<textarea id="lmsNoticeContent" class="autosize"  style="min-height: 200px; resize: none;" cols="100px" name="lmsNoticeContent" placeholder="내용을 입력하세요.">${lmsNotice.lmsNoticeContent}</textarea>
			</div>
	</form>
</body>
</html>