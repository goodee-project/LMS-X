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
	    	
			
	    	<!-- 접속자 -->
			<jsp:include page="/WEB-INF/view/auth/student/include/connector.jsp" />
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
							<table class="table align-items-center">
								<tr>
									<th width="10%">강좌 번호</th>
									<td width="40%">${lcstc.lecture.lectureNo}</td>
									<th width="10%">강사 이름</th>
									<td width="40%">${lcstc.lecture.teacherName}</td>
								</tr>
								<tr>
									<th>강좌 기간</th>
									<td>${lcstc.lecture.lectureStartdate} &nbsp; ~ &nbsp; ${lcstc.lecture.lectureEnddate}</td>
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
							<form id="classReviewForm" method="post" action="${pageContext.request.contextPath}/auth/student/lecture/updateClassReview">
								<div class="card-header bg-white border-0">
									<div class="row align-items-center">
										<div class="col-8">
											<h3 class="mb-0">수강 후기</h3>
										</div>
										<div class="col-4 text-right">
											<button id="classReviewBtn" type="button" class="btn btn-sm btn-primary">저장</button>
										</div>
									</div>
								</div>
								
								<div class="table-responsive">
									<input type="hidden" name="classRegistrationPoint" id="classRegistrationPoint" value="${lcstc.classRegistration.classRegistrationPoint}">
									<input type="hidden" name="classRegistrationNo" id="classRegistrationNo" value="${lcstc.classRegistration.classRegistrationNo}">
									<input type="hidden" name="lectureNo" id="lectureNo" value="${lcstc.lecture.lectureNo}">
									<table class="table align-items-center">
										<tr>
											<th width="20%">강좌 별점</th>
											<td width="80%">
												<div class="row">
													<button id="minusPoint" type="button" style="height:30px;" class="btn btn-sm btn-outline-primary">&nbsp;-&nbsp;</button>
													<p id="classPoint"></p>
													<button id="plusPoint" type="button" style="height:30px; margin-left: 9px;" class="btn btn-sm btn-outline-primary">&nbsp;+&nbsp;</button>
												</div>
											</td>
										</tr>
										<tr>
											<th>강좌 리뷰</th>
											<td style="padding-left: 9px;">
												<textarea class="form-control" cols="50" rows="3" name="classRegistrationReview">${lcstc.classRegistration.classRegistrationReview}</textarea>
											</td>
										</tr>
									</table>
								</div>
							</form>
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
									</div>
								</div>
							</div>
							<div class="card-footer py-4">
								<!-- 수강 대기상태 일시 수강 취소 가능 -->
								<c:if test="${lcstc.classRegistration.classRegistrationState == '대기'}">	
									<form id="cancelClassForm" method="post" action="${pageContext.request.contextPath}/auth/student/lecture/cancelClass">
										<input type="hidden" name="classRegistrationNo" id="classRegistrationNo" value="${lcstc.classRegistration.classRegistrationNo}">
										<input type="hidden" name="lectureNo" id="lectureNo" value="${lcstc.lecture.lectureNo}">
										<div id="cancelClass"></div>
										<button type="button" class="btn btn-sm btn-block btn-danger" data-toggle="modal" data-target="#modal-notification">수강 신청 취소</button>
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
															<h4 class="heading mt-4">취소 확인</h4>
															<p>수강 신청을 취소하시겠습니까?</p>
														</div>
									
													</div>
									
													<div class="modal-footer">
														<button type="button" class="btn btn-white" data-dismiss="modal">취소</button>
														<button type="button" class="btn btn-link text-white ml-auto" id="cancelClassBtn" value="수강 신청 취소">수강 신청 취소</button>
													</div>
												</div>
											</div>
										</div>
									</form>
								</c:if>
								<c:if test="${lcstc.classRegistration.classRegistrationState != '대기'}">	
									<button type="button" class="btn btn-sm btn-block btn-primary" data-toggle="modal" data-target="#infoModal">수강 대기시에만 취소가 가능합니다</button>
									<div class="modal fade" id="infoModal" tabindex="-1" role="dialog" aria-labelledby="infoModalLabel" aria-hidden="true">
										<div class="modal-dialog modal-dialog-centered" role="document">
											<div class="modal-content">
												<div class="modal-header">
													<h5 class="modal-title" id="infoModalLabel">정보</h5>
													<button type="button" class="close" data-dismiss="modal" aria-label="Close">
														<span aria-hidden="true">&times;</span>
													</button>
												</div>
												<div class="modal-body">수강 대기시에만 취소가 가능합니다</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
												</div>
											</div>
										</div>
									</div>
								</c:if>
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