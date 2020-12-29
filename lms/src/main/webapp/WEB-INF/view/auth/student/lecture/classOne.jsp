<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>classOne</title>
		<!-- Favicon -->
		<link href="${pageContext.request.contextPath}/assets/img/brand/favicon.png" rel="icon" type="image/png">
		<!-- Fonts -->
		<link
			href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700"
			rel="stylesheet">
		<!-- Icons -->
		<link href="${pageContext.request.contextPath}/assets/js/plugins/nucleo/css/nucleo.css" rel="stylesheet" />
		<link href="${pageContext.request.contextPath}/assets/js/plugins/@fortawesome/fontawesome-free/css/all.min.css" rel="stylesheet" />
		<!-- CSS Files -->
		<link href="${pageContext.request.contextPath}/assets/css/argon-dashboard.css?v=1.1.2" rel="stylesheet" />
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<script>
			$(document).ready(function(){
				let paramPoint = ${lcstc.classRegistration.classRegistrationPoint};
				// 별점을 변경해주는 함수 
				// - 파라미터 값이 없으면 컨트롤러에서 받아온 값을 별점으로 지정
				// - 파라미터 값이 있으면 기존 값에서 파라미터 값을 합연산함
				function changePoint(param){
					if (param != null){
						paramPoint = paramPoint + param;
					}
					let html = '';
					for (let i = 0; i < paramPoint; i++){
						html += '★';
					}
					for (let i = paramPoint; i < 5; i++){
						html += '☆';
					}
						
					$('#classPoint').html(html);
					$('#classRegistrationPoint').val(paramPoint);
					
				}
				
				// 후기 저장 버튼 
				$('#classReviewBtn').click(function(){
					$('#classReviewForm').submit();
				})
				// 별점 감소
				$('#minusPoint').click(function(){
					if (paramPoint > 0){
						changePoint(-1);
					}
				})
				// 별점 증가
				$('#plusPoint').click(function(){
					if (paramPoint < 5){
						changePoint(1);
					}
				})
				changePoint();
		
				// 수강 신청 취소 버튼
				$('#cancelClassBtn').click(function(){
					console.log($('#cancelClassBtn').text());
					// 처음 수강 신청 버튼 클릭시
					// 수강 신청 사유를 적을 수 있는 칸이 출력되고 버튼 값이 바뀜
					if ($('#cancelClassBtn').text() == '수강 신청 취소'){
						let cancelHtml = `취소 사유 : <textarea cols="50" rows="3" name="cancelContent" id="cancelContent"></textarea>`;
						$('#cancelClassBtn').text('수강 취소하기');
						$('#cancelClass').html(cancelHtml);
						
					// 사유 작성후 다시 버튼 클릭시
					// 취소 폼을 submit함
					} else if ($('#cancelClassBtn').text() == '수강 취소하기'){
						$('#cancelClassForm').submit();
					}
				})
		
			})
		</script>
	</head>	
	<body class="">
		<!-- 메인 Navbar -->
		
		<nav class="navbar navbar-vertical fixed-left navbar-expand-md navbar-light bg-white" id="sidenav-main">
			<div class="container-fluid">
				<jsp:include page="/WEB-INF/view/auth/student/include/menu.jsp" />
		    </div>	
		</nav>   		
		<div class="main-content">
			<!-- 상단 Navbar -->
			<div class="container-fluid">
				<jsp:include page="/WEB-INF/view/auth/student/include/topMenu.jsp" />
	    	</div>
			<!-- 강좌 Navbar -->
			<div class="container-fluid">
				<jsp:include page="/WEB-INF/view/auth/student/include/lectureMenu.jsp" />
	    	</div>
	    	
			<!-- Header -->
			<div class="header bg-gradient-primary pb-8 pt-5 pt-md-8">
				<div class="container-fluid">
					<div class="header-body">
						<!-- Card stats -->
						<div class="row">
							<div class="col-xl-3 col-lg-6">
								<div class="card card-stats mb-4 mb-xl-0">
									<div class="card-body">
										<div class="row">
											<div class="col">
												<h5 class="card-title text-uppercase text-muted mb-0">접속자 현황</h5>
												<span class="h2 font-weight-bold mb-0">350,897</span>
											</div>
											<div class="col-auto">
												<div
													class="icon icon-shape bg-danger text-white rounded-circle shadow">
													<i class="fas fa-chart-bar"></i>
												</div>
											</div>
										</div>
										<p class="mt-3 mb-0 text-muted text-sm">
											<span class="text-nowrap">누적 접속자</span>
											<span class="text-success mr-2">1,000,000,000</span> 
										</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
   			<div class="container-fluid mt--7">
				<div class="card shadow">
					<div class="card-header border-0">
						<div class="row align-items-center">
							<div class="col">
								<h3 class="mb-0">수강 정보</h3>
							</div>
						</div>
					</div>
					<div class="row align-items-center">
						<div class="col-12">
							<table class="table">
								<tr>
									<th>강좌 번호</th>
									<td>${lcstc.lecture.lectureNo}</td>
									<th>강사 이름</th>
									<td>${lcstc.lecture.teacherName}</td>
								</tr>
								<tr>
									<th>강좌 기간</th>
									<td>${lcstc.lecture.lectureStartdate} &nbsp;&nbsp; ~  &nbsp;&nbsp; ${lcstc.lecture.lectureEnddate}</td>
									<th>과목 총일수</th>
									<td>${lcstc.subject.subjectTotalday}일</td>
								</tr>
								<tr>
									<th>강좌 정원</th>
									<td>${lcstc.lecture.lectureTotal}명</td>
									<th>강좌 이름</th>
									<td>${lcstc.lecture.lectureName}</td>
								</tr>
								<tr>
									<th>수강 상태</th>
									<td>${lcstc.classRegistration.classRegistrationState}</td>
									<th>과목 이름</th>
									<td>${lcstc.subject.subjectName}</td>
								</tr>
								<tr>
									<th>교재</th>
									<td>${lcstc.textbook.textbookTitle}</td>
									<th>강의실</th>
									<td>${lcstc.classroom.classroomNumber}</td>
								</tr>
								<tr>
									<th>과목 정보</th>
									<td colspan="3">${lcstc.subject.subjectInfo}</td>
								</tr>
							</table>
						</div>
					</div>			
				</div>
				<!-- 수강 후기 -->
				<div class="row mt-5">
					<div class="col-xl-8 mb-5 mb-xl-0">
						<div class="card shadow">
							<div class="card-header border-0">
								<div class="row align-items-center">
									<div class="col">
										<h3 class="mb-0">수강 후기</h3>
									</div>
								</div>
							</div>
							<div class="table-responsive">
								<form id="classReviewForm" method="post" action="${pageContext.request.contextPath}/auth/student/lecture/updateClassReview">
									<input type="hidden" name="classRegistrationPoint" id="classRegistrationPoint" value="${lcstc.classRegistration.classRegistrationPoint}">
									<input type="hidden" name="classRegistrationNo" id="classRegistrationNo" value="${lcstc.classRegistration.classRegistrationNo}">
									<input type="hidden" name="lectureNo" id="lectureNo" value="${lcstc.lecture.lectureNo}">
									<table class="table">	
										<tr>
											<th>강좌 별점</th>
											<td >
												<div class="row">
													<button id="minusPoint" type="button" style="height:30px" class="btn btn-outline-primary btn-sm">-</button>
													<p id="classPoint"></p>
													<button id="plusPoint" type="button" style="height:30px" class="btn btn-outline-primary btn-sm">+</button>
												</div>
											</td>
										</tr>
										<tr>
											<th>강좌 리뷰</th>
											<td>
												<textarea class="form-control" cols="50" rows="3" name="classRegistrationReview">${lcstc.classRegistration.classRegistrationReview}</textarea>
											</td>
										</tr>
										<tr>
											<td colspan="2"><button id="classReviewBtn" type="button" class="btn btn-outline-primary">저장</button></td>
										</tr>
									</table>
								</form>
							</div>
						</div>
					</div>
					<div class="col-xl-4">
						<div class="card shadow">
							<div class="card-header border-0">
								<div class="row align-items-center">
									<div class="col">
										<h3 class="mb-0">수강 취소</h3>
									</div>
									<div class="col text-right">
										<a href="#!" class="btn btn-sm btn-primary">수강 대기시에만 취소가 가능합니다</a>
									</div>
								</div><hr>
								<div>
									<!-- 수강 대기상태 일시 수강 취소 가능 -->
									<c:if test="${lcstc.classRegistration.classRegistrationState == '대기'}">	
										<form id="cancelClassForm" method="post" action="${pageContext.request.contextPath}/auth/student/lecture/cancelClass">
											<input type="hidden" name="classRegistrationNo" id="classRegistrationNo" value="${lcstc.classRegistration.classRegistrationNo}">
											<input type="hidden" name="lectureNo" id="lectureNo" value="${lcstc.lecture.lectureNo}">
											<div id="cancelClass">
											</div>
											<button id="cancelClassBtn" type="button" value="수강 신청 취소" class="btn btn-outline-danger">수강 신청 취소</button>
										</form>
									</c:if>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>		
		</div>
		<!--   Core   -->
		<script src="${pageContext.request.contextPath}/assets/js/plugins/jquery/dist/jquery.min.js"></script>
		<script src="${pageContext.request.contextPath}/assets/js/plugins/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
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