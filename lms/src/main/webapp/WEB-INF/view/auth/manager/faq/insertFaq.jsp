<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insertFaq</title>
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
		$('#insertBtn').click(function() {
			// 스마트 에디터 내용 적용
			oEditors.getById["faqContent"].exec("UPDATE_CONTENTS_FIELD", []);
			let fc = $("#faqContent").val();
			fc = fc.replace(/(\s*)/g, "")
			if($('#faqTitle').val().length < 1){
				alert('제목을 입력해주세요.');
				return;
			} 
			if(fc == '' || fc  == null || fc == '&nbsp;' || fc == '<p>&nbsp;</p>'){
				alert('내용을 입력해주세요.');
				oEditors.getById["fc"].exec("FOCUS");
				return;
			}
			$('#insertForm').submit();
		});
		
		// NAVER SmartEditor2 적용 코드
		let oEditors = [];				
		nhn.husky.EZCreator.createInIFrame({
			oAppRef : oEditors,
			elPlaceHolder : 'faqContent',
			sSkinURI : '${pageContext.request.contextPath}/smarteditor2/SmartEditor2Skin.html',
			fCreator : 'createSEditor2'
		});
	});
</script>
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
}
</style>
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
						<form method="post"
							action="${pageContext.request.contextPath}/auth/manager/faq/insertFaq" id="insertForm">
							<div class="card-header bg-white border-0">
								<div class="row align-items-center">
									<br>
									<div class="col-8">
										<h3 class="mb-0">강의실 추가</h3>
									</div>
									<div class="col-4 text-right">
										<button type="button" class="btn btn-sm btn-dark"
											onclick="location.href='${pageContext.request.contextPath}/auth/manager/faq/faqList/1'">목록</button>
										<button type="button" class="btn btn-sm btn-success" id="insertBtn">입력</button>
									</div>
									<br>
								</div>
							</div>

							<div class="table-responsive">
								<table class="table align-items-center table-flush">
									<tr>
										<td>계정 id</td>
										<td><input type="text" class="form-control" name="accountId"
											value="${sessionScope.loginId}" readonly="readonly"></td>
									</tr>
									<tr>
										<td>FAQ 작성자</td>
										<td><input type="text" class="form-control" name="faqWriter"
											value="${sessionScope.loginId}" readonly="readonly"></td>
									</tr>
									<tr>
										<td>FAQ 제목</td>
										<td><input type="text" class="form-control" name="faqTitle" id="faqTitle"></td>
									</tr>
									<tr>
										<td>FAQ 내용</td>
										<td>
											<textarea name="faqContent" rows="10" cols="22" class="form-control" id="faqContent"></textarea>
										</td>
									</tr>
									<tr>
										<td>FAQ 카테고리</td>
										<td><select name="faqCategory" class="form-control">
												<c:forEach var="f" items="${faqCategoryList}">
													<option value="${f.faqCategory}">${f.faqCategory}</option>
												</c:forEach>
										</select></td>
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