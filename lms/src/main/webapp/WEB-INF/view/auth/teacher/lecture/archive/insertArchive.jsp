<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>insertArchive</title>
		
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
			
			textarea {
				min-height: 300px;
			}
		</style>
		
		<!-- jQuery를 이용하여 제목, 내용 검사 -->
		<script>
			$(document).ready(function() {	// 문서가 로드되면 이 스크립트를 제일 마지막에 실행해주세요
				$('lectureArchiveTitle').focus();	// 시작 시 폼 커서를 lectureArchiveTitle쪽으로 이동
				
				// 파일 추가 버튼을 누를 때
				$('#addBtn').click(function() {
					html = '<div><input type="file" class="form-control lectureArchiveFileList" name="lectureArchiveFileList"></div>';
					$('#fileinput').append(html);
				});

				// 파일 삭제 버튼을 누르면 마지막에 append된 첨부파일이 삭제
				$('#delBtn').click(function() {
					$('#fileinput').children().last().remove();
				});
				
				// 버튼 클릭시 폼 내용의 유효성 검사를 수행
				$("#submitBtn").click(function() {
					if ($("#lectureArchiveTitle").val() == "") {	// lectureArchiveTitle이 공백인 경우 수행
						$("#lectureArchiveTitleMsg").html('');		// 메시지 초기화
						$('#lectureArchiveTitleMsg').append('<div style="margin-top: 10px;">제목을 입력하세요<div>');
						$('#lectureArchiveTitle').focus();
					
						return;
					} else {
						$("#lectureArchiveTitleMsg").text('');	// 메시지 초기화
					}

					if ($("#lectureArchiveContent").val() == "") { 	// lectureArchiveContent가 공백인 경우 수행
						$("#lectureArchiveContentMsg").html('');	// 메시지 초기화
						$('#lectureArchiveContentMsg').append('<div style="margin-top: 10px;">내용을 입력하세요<div>');
						$('#lectureArchiveContent').focus();
					
						return;
					} else {
						$("#lectureArchiveContentMsg").html('');	// 메시지 초기화
					}
					
					// 비어있는 파일이 있는지 체크 (없으면 true, 하나라도 있으면 false)
					let ck = true;
					
					// 반복문을 돌리면서 각 첨부파일을 확인
					$('.lectureArchiveFileList').each(function(index, item) {
						console.log($(item).val());
						
						// 비어있는 파일이 하나라도 있는 경우
						if($(item).val() == '') {
							ck = false;
						}
					});

					// ck가 true일 때만 폼 입력 가능
					if (ck == true) {
						$('#lectureArchiveForm').submit();
					} else {	// 아닌 경우 경고창 띄우기
						alert('선택하지 않은 파일이 있습니다.\n다시 한 번 확인해주세요.');
					}
				});
			});
		</script>
	</head>
	<body>
		<!-- 내비게이션 메인 메뉴 -->
		<jsp:include page="/WEB-INF/view/auth/teacher/include/menu.jsp" />
		
		<!-- 내비게이션 서브 메뉴 -->
		<jsp:include page="/WEB-INF/view/auth/teacher/include/lectureMenu.jsp" />
	
		<!-- 상단 인터페이스 -->
		<div class="jumbotron jumbotron-fluid">
			<div class="container">
				<h1>자료실</h1>
				<p>자료 작성 페이지입니다.</p>
			</div>
		</div>
		
		<!-- 본문 -->
		<div class="container">
			<form method="post" action="${pageContext.request.contextPath}/auth/teacher/lecture/${lectureNo}/archive/insertArchive" enctype="multipart/form-data" id="lectureArchiveForm">
				<h3>자료 작성</h3>
				
				<br>
				
				<button type="button" class="btn btn-sm btn-dark" onclick="location.href='${pageContext.request.contextPath}/auth/teacher/lecture/${lectureNo}/archive/archiveList/1'">목록</button>
				<button type="button" class="btn btn-sm btn-success" style="float: right;" id="submitBtn">작성</button>
				
				<br><br>
				
				<!-- 강좌 고유번호 -->
				<input type="hidden" name="lectureNo" value="${lectureNo}">
				
				<!-- 강사 아이디 -->
				<input type="hidden" name="accountId" value="${teacherId}">
				
				<!-- 강사 이름 -->
				<input type="hidden" name="lectureArchiveWriter" value="${teacherName}">
				
				<table class="table">
					<tr>
						<td width="20%">제목</td>
						<td width="80%">
							<input type="text" class="form-control" name="lectureArchiveTitle" id="lectureArchiveTitle">
							<div class="msgDiv" id="lectureArchiveTitleMsg"></div>
						</td>
					</tr>
					<tr>
						<td>내용</td>
						<td>
							<textarea class="form-control" name="lectureArchiveContent" id="lectureArchiveContent"></textarea>
							<div class="msgDiv" id="lectureArchiveContentMsg"></div>
						</td>
					</tr>
					<tr>
						<td>첨부파일</td>
						<td>
							<div>
								<button type="button" class="btn btn-sm btn-dark" id="addBtn">파일 추가</button>
								<button type="button" class="btn btn-sm btn-dark" id="delBtn">파일 삭제</button>
							</div>
							<div id="fileinput"></div>
						</td>
					</tr>
				</table>
			</form>
		</div>
		
		<br><br>
	</body>
</html>