<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>teacherOne</title>
	<!-- Favicon -->
	<link href="${pageContext.request.contextPath}/assets/img/brand/favicon.png" rel="icon" type="image/png">
	<!-- Fonts -->
	<link
		href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700"
		rel="stylesheet">
	<!-- Icons -->
	<link href="${pageContext.request.contextPath}/assets/js/plugins/nucleo/css/nucleo.css" rel="stylesheet" />
	<link
		href="${pageContext.request.contextPath}/assets/js/plugins/@fortawesome/fontawesome-free/css/all.min.css"
		rel="stylesheet" />
	<!-- CSS Files -->
	<link href="${pageContext.request.contextPath}/assets/css/argon-dashboard.css?v=1.1.2" rel="stylesheet" />
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
				<!-- Table 1 -->
				<div class="row">
					<div class="col">
						<div class="card shadow">
							<div class="card-header bg-white border-0">
								<div class="row align-items-center">
									<br>
									<div class="col-8">
										<h3 class="mb-0">강사 정보</h3>
									</div>
									<br>
								</div>
							</div>
							<div class="table-responsive">
								<table class="table align-items-center table-flush">
									<tr>
										<td width="10%">ID</td>
										<td width="40%">${teacher.teacherId}</td>
										<td width="10%">Email</td>
										<td width="40%">${teacher.teacherEmail}</td>
									</tr>
									<tr>
										<td>이름</td>
										<td>${teacher.teacherName}</td>
										<td>성별</td>
										<td>${teacher.teacherGender}</td>
									</tr>
									<tr>
										<td>전화번호</td>
										<td>${teacher.teacherPhone}</td>
										<td>생일</td>
										<td>${teacher.teacherBirth}</td>
									</tr>
									<tr>
										<td>주소</td>
										<td colspan="3">${teacher.teacherAddressMain}</td>
									</tr>
									<tr>
										<td>상세주소</td>
										<td colspan="3">${teacher.teacherAddressSub}</td>
									</tr>
									<tr>
										<td>강사 설명</td>
										<td>${teacher.teacherInfo}</td>
										<td>이미지</td>
										<td></td>
									</tr>
									<tr>
										<td>강사 경력</td>
										<td>
											<c:forEach var="c" items="${teacher.careerList}">${c.careerContent}</c:forEach>
										</td>
									</tr>
									<tr>
										<td>보유 자격증</td>
										<td>
											<c:forEach var="l" items="${teacher.licenseList}">${l.licenseName}</c:forEach>
										</td>
									</tr>
									<tr>
										<td>강사정보 등록날짜</td>
										<td>${teacher.teacherAccessdate}</td>
										<td>강사정보 수정날짜</td>
										<td>${teacher.teacherUpdatedate}</td>
									</tr>
								</table>
							</div>
						</div>
					</div>
				</div>
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