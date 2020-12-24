<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>insertNote</title>
		
		<!-- Bootstrap Framework 사용 -->
		
		<!-- Latest compiled and minified CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
		
		<!-- jQuery library -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		
		<!-- Popper JS -->
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
		
		<!-- Latest compiled JavaScript -->
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
		
		<!-- Bootstrap 4 Icons -->
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
		
		<style>
			.table {
				text-align: center;
			}
			
			.table td {
				vertical-align: middle;
			}
			
			.table a {
				color: #000000;
			}
			
			th {
				text-align: center;
				background-color: #F9F9FB;
			}
		</style>
		
		<script>
			$(document).ready(function(){
				// 받는사람 검색 버튼
				$('#searchAccountBtn').click(function(){
					$('#selectAccount').html('');	
					// 계정 리스트 가져오기
					$.ajax({
						url: '${pageContext.request.contextPath}/auth/teacher/note/accountList/' + $('#searchAccountText').val(),
						type:'get',
						success: function(data){									
							$(data).each(function(key, value) {
								$('#selectAccount').append('<div><button type="button" class="selectAccountBtn form-control" name="selectAccountRadio" id="' + value.accountId + '" value="' + value.accountName + '">'+ value.accountName + '(' + value.accountId + ')' + '</button></div>');
							});

							// 계정 한개 선택시
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
		<!-- 내비게이션 메인 메뉴 -->
		<jsp:include page="/WEB-INF/view/auth/teacher/include/menu.jsp" />
	
		<!-- 상단 인터페이스 -->
		<div class="jumbotron jumbotron-fluid">
			<div class="container">
				<h1>쪽지 내용</h1>
				<p>쪽지 발신 내용입니다.</p>
			</div>
		</div>
		
		<!-- 본문 -->
		<div class="container">
			<h3>쪽지 내용</h3>
			
			<br>
			
			<div class="btn-group">
				<button type="button" class="btn btn-sm btn-primary" onclick="location.href='${pageContext.request.contextPath}/auth/teacher/note/noteReceiveList/1'">쪽지 수신함</button>
				<button type="button" class="btn btn-sm btn-primary" onclick="location.href='${pageContext.request.contextPath}/auth/teacher/note/noteDispatchList/1'">쪽지 발신함</button>
			</div>
			
			<br><br>
			
	    	<form id="insertNoteForm" method="post" action="${pageContext.request.contextPath}/auth/teacher/note/insertNote">      		
			    <input type="hidden" id="noteReceiverId" name="noteReceiverId">
			    <input type="hidden" id="noteReceiverName" name="noteReceiverName">
	    		<!-- 내용 -->
		    	<table class="table">
		    		<tr>
		    			<th>제목</th>
		    			<td><input id="noteTitle" type="text" name="noteTitle" class="form-control"></td>
		    		</tr>
		    		<tr>
		    			<th>받는사람</th>
		    			<td>
			    			<div class="row">
			    				<div class="col-10"><input type="text" id="searchAccountText" class="form-control"></div>
			    				<div class="col-2"><button type="button" id="searchAccountBtn" class="form-control btn-outline-dark">검색</button></div>
		    				</div>
		    				<div id="selectAccount" style="overflow: auto; width: 100%; max-height: 200px;">
		    					
		    				</div>
		    			</td>
		    		</tr>
		    		<tr>
		    			<th>내용</th>
		    			<td><textarea rows="3" cols="50" id="noteContent" name="noteContent" class="form-control"></textarea></td>
		    		</tr>
		    	</table>
			    <div>
			    	<button id="insertNoteBtn" type="button" class="btn btn-outline-primary">보내기</button>
			    </div>
	    	</form>
		</div>
		<br><br>
	</body>
</html>