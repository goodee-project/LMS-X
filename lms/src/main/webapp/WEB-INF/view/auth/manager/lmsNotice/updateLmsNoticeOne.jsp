<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Favicon -->
<link
	href="${pageContext.request.contextPath}/assets/img/brand/favicon.png"
	rel="icon" type="image/png">

<!-- Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700"
	rel="stylesheet">

<!-- Icons -->
<link
	href="${pageContext.request.contextPath}/assets/js/plugins/nucleo/css/nucleo.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/assets/js/plugins/@fortawesome/fontawesome-free/css/all.min.css"
	rel="stylesheet" />

<!-- CSS Files -->
<link
	href="${pageContext.request.contextPath}/assets/css/argon-dashboard.css?v=1.1.2"
	rel="stylesheet" />

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Bootstrap 4 Icons -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
	integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
	crossorigin="anonymous">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- NAVER SmartEditor2 스크립트 -->
<script 
	src="${pageContext.request.contextPath}/smarteditor2/js/HuskyEZCreator.js"></script>
<script>
	$(document).ready(function(){
		$('#updateBtn').click(function() {
			// 스마트 에디터 내용 적용
			oEditors.getById["lmsNoticeContent"].exec("UPDATE_CONTENTS_FIELD", []);
			let fc = $("#lmsNoticeContent").val();
			fc = fc.replace(/(\s*)/g, "")
			if($('#lmsNoticeTitle').val().replace(/(\s*)/g, "").length < 1){
				alert('제목을 입력해주세요.');
				return;
			} 
			if(fc == '' || fc  == null || fc == '&nbsp;' || fc == '<p>&nbsp;</p>'){
				alert('내용을 입력해주세요.');
				oEditors.getById["fc"].exec("FOCUS");
				return;
			}
			$('#updateForm').submit();
		});
		
		// NAVER SmartEditor2 적용 코드
		let oEditors = [];				
		nhn.husky.EZCreator.createInIFrame({
			oAppRef : oEditors,
			elPlaceHolder : 'lmsNoticeContent',
			sSkinURI : '${pageContext.request.contextPath}/smarteditor2/SmartEditor2Skin.html',
			fCreator : 'createSEditor2'
		});
	});
</script>
<!-- textArea자동조절 라이브러리 -->
<script
	src="https://rawgit.com/jackmoore/autosize/master/dist/autosize.min.js"></script>
<script>
	$(document).ready(function() {
		//textarea 크기 자동 조정
		autosize($("textArea"));

		$('#updateBtn').click(function() {
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
	<!-- 내비게이션 메인 메뉴 -->
	<jsp:include page="/WEB-INF/view/auth/manager/include/menu.jsp" />
	<div class="main-content">
		<!-- 내비게이션 상단 메뉴 -->
		<div class="container-fluid">
			<jsp:include page="/WEB-INF/view/auth/manager/include/topMenu.jsp" />
		</div>

		<!-- 접속자 -->
		<jsp:include page="/WEB-INF/view/auth/manager/include/connector.jsp" />

		<!-- Page content -->
		<div class="container-fluid mt--7">
			<!-- Table -->
			<div class="row">
				<div class="col">
					<div class="card shadow">
						<form id="updateForm" method="post"
							action="${pageContext.request.contextPath}/auth/manager/lmsNotice/updateLmsNoticeOne">
							<div class="card-header bg-white border-0">
								<div class="row align-items-center">
									<br>
									<div class="col-8">
										<h3 class="mb-0">LMS 공지사항 수정</h3>
									</div>
									<div class="col-4 text-right">
										<button type="button" class="btn btn-sm btn-dark"
											onclick="location.href='${pageContext.request.contextPath}/auth/manager/lmsNotice/lmsNoticeOne/${lmsNotice.lmsNoticeNo}'">취소</button>
										<button id="updateBtn" class="btn btn-sm btn-primary"
											type="button">수정</button>
									</div>
									<br>
								</div>
							</div>

							<div class="table-responsive">
								<div>
									<input type="text" value="${lmsNotice.lmsNoticeNo}"
										name="lmsNoticeNo" hidden="hidden">
								</div>
								<table class="table align-items-center table-flush">
									<tr>
										<th width="20%">제목</th>
										<td width="80%"><input id="lmsNoticeTitle" type="text"
											class="form-control" name="lmsNoticeTitle"
											value="${lmsNotice.lmsNoticeTitle}" placeholder="제목을 입력해주세요."></td>
									</tr>
									<tr>
										<th>내용</th>
										<td><textarea id="lmsNoticeContent"
												class="form-control autosize"
												style="min-height: 200px; resize: none;" cols="100px"
												name="lmsNoticeContent" placeholder="내용을 입력하세요.">${lmsNotice.lmsNoticeContent}</textarea>
										</td>
									</tr>
								</table>
							</div>
						</form>
					</div>
				</div>
			</div>
			<!-- Footer -->
			<jsp:include page="/WEB-INF/view/auth/include/footer.jsp"></jsp:include>
		</div>
	</div>
	<!--   Core   -->
	<script
		src="${pageContext.request.contextPath}/assets/js/plugins/jquery/dist/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/plugins/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
	<!--   Optional JS   -->
	<script
		src="${pageContext.request.contextPath}/assets/js/plugins/chart.js/dist/Chart.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/plugins/chart.js/dist/Chart.extension.js"></script>
	<!--   Argon JS   -->
	<script
		src="${pageContext.request.contextPath}/assets/js/argon-dashboard.min.js?v=1.1.2"></script>
	<script src="https://cdn.trackjs.com/agent/v3/latest/t.js"></script>
	<script>
		window.TrackJS && TrackJS.install({
			token : "ee6fab19c5a04ac1a32a645abde4613a",
			application : "argon-dashboard-free"
		});
	</script>
</body>
</html>