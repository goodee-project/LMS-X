<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>insertQnA</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<script>
			$(document).ready(function(){	
				// 파일 추가 버튼
				$('#addFileBtn').click(function(){
					// 파일 개수 제한
					if($('#fileInput').children().length >= 10){
						alert('최대 10개만 가능합니다.');
						return;
					}
		
					let html =`<div><input type="file" name="questionFile" class="questionFile"></div>`;
					$('#fileInput').append(html);
		
				})
				
				// 파일 삭제 버튼
				$('#delFileBtn').click(function(){
					// 마지막 파일을 삭제함
					$('#fileInput').children().last().remove();
				})
				
				// 질문 작성 버튼
				$('#qnaBtn').click(function(){
					// 제목, 내용 유효성 검사
					if($('#qnaTitle').val().length < 1){
						alert('제목을 입력해 주세요.');
						return;
					} else if($('#qnaContent').val().length < 1){
						alert('내용을 입력해 주세요.');
						return;
					} 
					// 첨부 파일 유효성 검사
					let submitCk = true;
					$('.questionFile').each(function(index, item){
						// 파일 비어있을시 && submitCk가 true일때(경고창 한번만 출력하기 위함)
						if($(item).val() == '' && submitCk){
							alert('파일이 비어있습니다!');
							submitCk = false;
							return;
						}
					})
					// 정상적일 때 submit
					$('#qnaForm').submit();
				})
			})
		</script>
</head>
	<body>
		<h1>질문 작성</h1>
		<div>
			<jsp:include page="/WEB-INF/view/auth/student/include/menu.jsp" />
	    </div>
		<div>
			<jsp:include page="/WEB-INF/view/auth/student/include/lectureMenu.jsp" />
	    </div>
	    
	    <!-- 질문 작성 폼 -->
	    <div>
	    	<form id="qnaForm" enctype="multipart/form-data" method="post" action="${pageContext.request.contextPath}/auth/student/lecture/${lectureNo}/qna/insertQna">   	
	    		<input id="lectureNo" type="hidden" name="lectureNo" value="${lectureNo}"> 
	    		<!-- 내용 -->
		    	<table border="1">
		    		<tr>
		    			<th>제목</th>
		    			<td><input id="qnaTitle" type="text" name="questionTitle"></td>
		    		</tr>
		    		<tr>
		    			<th>내용</th>
		    			<td><textarea rows="3" cols="50" id="qnaContent" name="questionContent"></textarea></td>
		    		</tr>
		 	   		<tr>
		    			<th>비밀번호(선택)</th>
		    			<td><input id="qnaPassword" type="password" placeholder="비밀글로 설정하실려면 비밀번호를 입력해주세요" name="questionPassword"></td>
		    		</tr>
		    	</table>
		    	
		    	<!-- 첨부파일 -->
    			<h3>첨부파일</h3>
   				<button id="addFileBtn" type="button">파일 추가</button>
   				<button id="delFileBtn" type="button">파일 삭제</button>
    			<div id="fileInput"></div>
    			<!-- 과제 제출 -->   
			    <div>
			    	<button id="qnaBtn" type="button">과제 제출</button>
			    </div>
	    	</form>
	    </div> 
	</body>
</html>