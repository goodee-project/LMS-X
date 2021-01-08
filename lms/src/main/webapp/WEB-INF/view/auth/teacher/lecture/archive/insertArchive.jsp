<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		
		<title>insertArchive</title>
		
		<!-- Favicon -->
		<link href="${pageContext.request.contextPath}/assets/img/brand/favicon.png" rel="icon" type="image/png">
		
		<!-- Fonts -->
		<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
		
		<!-- Icons -->
		<link href="${pageContext.request.contextPath}/assets/js/plugins/nucleo/css/nucleo.css" rel="stylesheet" />
		<link href="${pageContext.request.contextPath}/assets/js/plugins/@fortawesome/fontawesome-free/css/all.min.css" rel="stylesheet" />
		
		<!-- CSS Files -->
		<link href="${pageContext.request.contextPath}/assets/css/argon-dashboard.css?v=1.1.2" rel="stylesheet" />
		
		<!-- jQuery library -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		
		<!-- Bootstrap 4 Icons -->
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
		
		<!-- jQuery library -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		
		<style>
			textarea {
				min-height: 300px;
			}
		</style>
		
		<!-- NAVER SmartEditor2 스크립트 -->
		<script src="${pageContext.request.contextPath}/smarteditor2/js/HuskyEZCreator.js"></script>
		
		<!-- jQuery를 이용하여 제목, 내용 검사 -->
		<script>
			$(document).ready(function() {	// 문서가 로드되면 이 스크립트를 제일 마지막에 실행해주세요
				$('lectureArchiveTitle').focus();	// 시작 시 폼 커서를 lectureArchiveTitle쪽으로 이동
				
				// 파일 추가 버튼을 누를 때
				$('#addBtn').click(function() {
					html = '<div><input type="file" class="form-control lectureArchiveFileList" name="lectureArchiveFileList" onchange="checkSize(this)"></div>';
					$('#fileinput').append(html);
				});

				// 파일 삭제 버튼을 누르면 마지막에 append된 첨부파일이 삭제
				$('#delBtn').click(function() {
					$('#fileinput').children().last().remove();
				});
				
				// 버튼 클릭시 폼 내용의 유효성 검사를 수행
				$("#submitBtn").click(function() {
					// 스마트 에디터 내용 적용
					oEditors.getById["lectureArchiveContent"].exec("UPDATE_CONTENTS_FIELD", []);
					
					let content = $("#lectureArchiveContent").val().replace(/(\s*)/g, "");
				
					if ($("#lectureArchiveTitle").val() == "") {	// lectureArchiveTitle이 공백인 경우 수행
						$("#lectureArchiveTitleMsg").html('');		// 메시지 초기화
						$('#lectureArchiveTitleMsg').append('<div style="margin-top: 10px;">제목을 입력하세요<div>');
						$('#lectureArchiveTitle').focus();
					
						return;
					} else {
						$("#lectureArchiveTitleMsg").text('');	// 메시지 초기화
					}

					if (content == '' || content  == null || content == '&nbsp;' || content == '<p>&nbsp;</p>') { 	// lectureArchiveContent가 공백인 경우 수행
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
				
				// NAVER SmartEditor2 적용 코드
				let oEditors = [];				
				nhn.husky.EZCreator.createInIFrame({
					oAppRef : oEditors,
					elPlaceHolder : 'lectureArchiveContent',
					sSkinURI : '${pageContext.request.contextPath}/smarteditor2/SmartEditor2Skin.html',
					fCreator : 'createSEditor2'
				});
			});
			
			function checkSize(input) {
			    if (input.files && input.files[0].size > (10 * 1024 * 1000)) {
			        $("#modal-notification").modal("show");
			        input.value = null;
			    }
			}
		</script>
	</head>
	
	<body>
		<!-- 내비게이션 메인 메뉴 -->
		<jsp:include page="/WEB-INF/view/auth/teacher/include/menu.jsp" />
		
		<div class="main-content">
			<!-- 내비게이션 상단 메뉴 -->
			<div class="container-fluid">
				<jsp:include page="/WEB-INF/view/auth/teacher/include/lectureMenu.jsp" />
			</div>
			
	    	<!-- 접속자 -->
			<jsp:include page="/WEB-INF/view/auth/teacher/include/connector.jsp" />
			
			<!-- Page content -->
			<div class="container-fluid mt--7">
				<!-- Form -->
				<form method="post" action="${pageContext.request.contextPath}/auth/teacher/lecture/${lectureNo}/archive/insertArchive" enctype="multipart/form-data" id="lectureArchiveForm">
					<!-- Table -->
					<div class="row">
						<div class="col">
							<div class="card shadow">
								<div class="card-header bg-white border-0">
									<div class="row align-items-center">
										<br>
										<div class="col-8">
											<h3 class="mb-0">자료 작성</h3>
										</div>
										<div class="col-4 text-right">
											<button type="button" class="btn btn-sm btn-dark"
												onclick="location.href='${pageContext.request.contextPath}/auth/teacher/lecture/${lectureNo}/archive/archiveList/1'">목록</button>
											<button type="button" class="btn btn-sm btn-success"
												style="float: right;" id="submitBtn">작성</button>
										</div>
										<br>
									</div>
								</div>
								<div class="table-responsive">
									<!-- 강좌 고유번호 -->
									<input type="hidden" name="lectureNo" value="${lectureNo}">
	
									<!-- 강사 아이디 -->
									<input type="hidden" name="accountId" value="${teacherId}">
	
									<!-- 강사 이름 -->
									<input type="hidden" name="lectureArchiveWriter"
										value="${teacherName}">
									<table class="table align-items-center table-flush">
										<tr>
											<th width="20%">제목</th>
											<td width="80%">
												<input type="text" class="form-control" name="lectureArchiveTitle" id="lectureArchiveTitle">
												<div class="msgDiv" id="lectureArchiveTitleMsg"></div>
											</td>
										</tr>
										<tr>
											<th>내용</th>
											<td>
												<textarea class="form-control" name="lectureArchiveContent" id="lectureArchiveContent" style="width:100%"></textarea>
												<div class="msgDiv" id="lectureArchiveContentMsg"></div>
											</td>
										</tr>
										<tr>
											<th>첨부파일</th>
											<td>
												<div>
													<button type="button" class="btn btn-sm btn-dark" id="addBtn">파일 추가</button>
													<button type="button" class="btn btn-sm btn-dark" id="delBtn">파일 삭제</button>
												</div>
												<div id="fileinput"></div>
												<div class="modal fade" id="modal-notification" tabindex="-1"
													role="dialog" aria-labelledby="modal-notification" aria-hidden="true">
													<div class="modal-dialog modal-danger modal-dialog-centered modal-"
														role="document">
														<div class="modal-content bg-gradient-danger">
											
															<div class="modal-header">
																<h6 class="modal-title" id="modal-title-notification">경고</h6>
																<button type="button" class="close" data-dismiss="modal"
																	aria-label="Close">
																	<span aria-hidden="true">×</span>
																</button>
															</div>
											
															<div class="modal-body">
											
																<div class="py-3 text-center">
																	<i class="ni ni-bell-55 ni-3x"></i>
																	<h4 class="heading mt-4">첨부파일 확인</h4>
																	<p>첨부파일은 10MB를 넘을 수 없습니다</p>
																</div>
											
															</div>
											
															<div class="modal-footer">
																<button type="button" class="btn btn-white ml-auto" data-dismiss="modal">확인</button>
															</div>
														</div>
													</div>
												</div>
											</td>
										</tr>
									</table>
								</div>
							</div>
						</div>
					</div>
				</form>
				
				<!-- Footer -->
				<jsp:include page="/WEB-INF/view/auth/include/footer.jsp"></jsp:include>
			</div>
		</div>
		<!--   Core   -->
		<script src="${pageContext.request.contextPath}/assets/js/plugins/jquery/dist/jquery.min.js"></script>
		<script
			src="${pageContext.request.contextPath}/assets/js/plugins/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
		<!--   Optional JS   -->
		<script src="${pageContext.request.contextPath}/assets/js/plugins/chart.js/dist/Chart.min.js"></script>
		<script src="${pageContext.request.contextPath}/assets/js/plugins/chart.js/dist/Chart.extension.js"></script>
		<!--   Argon JS   -->
		<script src="${pageContext.request.contextPath}/assets/js/argon-dashboard.min.js?v=1.1.2"></script>
		<script src="https://cdn.trackjs.com/agent/v3/latest/t.js"></script>
		<script>
	    window.TrackJS &&
	      TrackJS.install({
	        token: "ee6fab19c5a04ac1a32a645abde4613a",
	        application: "argon-dashboard-free"
	      });
	  </script>
	</body>
</html>