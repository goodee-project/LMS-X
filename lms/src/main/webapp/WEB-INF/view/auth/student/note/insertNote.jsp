<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>insertNote</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<script>
			$(document).ready(function(){
				// 받는사람 검색 버튼
				$('#searchAccountBtn').click(function(){
					$('#selectAccount').html('');	
					// 연도 리스트 가져오기
					$.ajax({
						url: '${pageContext.request.contextPath}/auth/student/note/accountList/' + $('#searchAccountText').val(),
						type:'get',
						success: function(data){									
							$(data).each(function(key, value) {
								$('#selectAccount').append('<div><button type="button" class="selectAccountBtn" name="selectAccountRadio" id="' + value.accountId + '" value="' + value.accountName + '">'+ value.accountName + '(' + value.accountId + ')' + '</button></div>');
							});

							$('.selectAccountBtn').click(function(){
								document.getElementById("noteReceiverId").value = this.id;
								document.getElementById("noteReceiverName").value = this.value;
								document.getElementById("searchAccountText").value = this.value + '(' + this.id + ')';
								$('#selectAccount').html('');	
							})	
						}
					});
				})
				
				// 쪽지 보내기 버튼
				$('#insertNoteBtn').click(function(){
					if($('#noteTitle').val().length < 1){
						alert('제목을 작성해 주세요.');
						return;
					} else if($('#searchAccountText').val().length < 1){
						alert('받는사람을 선택해 주세요.');
						return;
					} else if($('#noteContent').val().length < 1){
						alert('내용을 작성해 주세요..');
						return;
					}

					$('#insertNoteForm').submit();
				})	
			})
		</script>
	</head>
	<body>
		<h1>쪽지 보내기</h1>
		<!-- 메뉴 -->
		<div>
			<jsp:include page="/WEB-INF/view/auth/student/include/menu.jsp" />
	    </div>
		<div>
			<a href="${pageContext.request.contextPath}/auth/student/note/noteReceiveList/1">수신함</a>
			
			<a href="${pageContext.request.contextPath}/auth/student/note/noteDispatchList/1">발신함</a>
			
			<a href="${pageContext.request.contextPath}/auth/student/note/insertNote">쪽지 작성</a>
	    </div>
	    
	    <!-- 쪽지 보내기 폼 -->
	    <div>
	    	<form id="insertNoteForm" method="post" action="${pageContext.request.contextPath}/auth/student/note/insertNote">      		
			    <input type="hidden" id="noteReceiverId" name="noteReceiverId">
			    <input type="hidden" id="noteReceiverName" name="noteReceiverName">
	    		<!-- 내용 -->
		    	<table border="1">
		    		<tr>
		    			<th>제목</th>
		    			<td><input id="noteTitle" type="text" name="noteTitle"></td>
		    		</tr>
		    		<tr>
		    			<th>받는사람</th>
		    			<td>
			    			<div>
			    				<input type="text" id="searchAccountText">
			    				<button type="button" id="searchAccountBtn">검색</button>
		    				</div>
		    				<div id="selectAccount" style="overflow: auto; width: 100%; max-height: 200px;">
		    					
		    				</div>
		    			</td>
		    		</tr>
		    		<tr>
		    			<th>내용</th>
		    			<td><textarea rows="3" cols="50" id="noteContent" name="noteContent"></textarea></td>
		    		</tr>
		    	</table>
			    <div>
			    	<button id="insertNoteBtn" type="button">보내기</button>
			    </div>
	    	</form>
	    </div> 
	</body>
</html>