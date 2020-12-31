<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>testOne</title>
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
				
				// 첫 접근시 이미 평가를 완료했는지 체크
				$.ajax({
					url: '${pageContext.request.contextPath}/auth/student/lecture/test/selectCheckTestFinish/' + ${lectureNo},
					type:'post',
					success: function(data){
						// 완료한 평가인 경우
						if(data){
							alert('이미 완료한 평가입니다.');
							$(location).attr('href', '${pageContext.request.contextPath}/auth/student/lecture/' + ${lectureNo} + '/test/testList')
							return;
						}
					}
				});
				
				
				// 정답 체크시
				$('input[type=radio]').change(function(){	
					let paramNo = this.id;
					let paramSelect = this.value;				
					// 이미 해당 문제의 답안을 제출 했는지
					$.ajax({
						url: '${pageContext.request.contextPath}/auth/student/lecture/test/selectCheckAnswersheet',
						type:'post',
						data: {multiplechoiceNo:paramNo},
						success: function(data){
							// 이미 제출 했을경우 -> update
							if(data){
								$.ajax({
									url: '${pageContext.request.contextPath}/auth/student/lecture/test/updateAnswersheet',
									type:'post',
									data: {multiplechoiceNo : paramNo, answerSelect : paramSelect, lectureNo : ${lectureNo}},
									success: function(data){
									}
								});
								return;
							// 제출 안했을 경우 -> insert
							} else {
								$.ajax({
									url: '${pageContext.request.contextPath}/auth/student/lecture/test/insertAnswersheet',
									type:'post',
									data: {multiplechoiceNo : paramNo, answerSelect : paramSelect, lectureNo : ${lectureNo}},
									success: function(data){
									}
								});
								return;
							}
						}
					});
				})

				// 평가 종료 버튼 클릭시
				$('#finishTest').click(function(){
					// 문제를 다 풀었는지 확인
					$.ajax({
						url: '${pageContext.request.contextPath}/auth/student/lecture/test/selectCheckTestFinish/' + ${lectureNo},
						type:'post',
						success: function(data){
							// 문제를 다 풀지 않았을 시
							if(!data){
								alert('풀지 않은 문제가 있습니다.');
								return;
							// 문제를 다 풀었을시
							} else {
								$(location).attr('href', '${pageContext.request.contextPath}/auth/student/lecture/' + ${lectureNo} + '/test/testList')
								return;
							}
						}
					});
					
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
			
   			<div class="container-fluid mt--7 col-7 ">
				<div class="card shadow">
					<div class="card-header border-0">
						<div class="row align-items-center">
							<div class="col">
								<h3 class="mb-0">평가 문제</h3>
							</div>
						</div>
					</div>
					<div class="row align-items-center">
						<div class="col-12">
						    <!-- 평가 내용 -->
						    <div>
						    	<c:forEach items="${multiplechoice}" var="m">
							    	<table class="table">
							    		<thead class="thead-light">
								    		<tr>
								    			<th>문제${m.multiplechoiceId} - </th>
								    			<th>내용</th>
								    			<th>${m.multiplechoiceQuestion}</th>
								    			<th>배점</th>
								    			<th>${m.multiplechoiceScore}</th>
								    		</tr>
							    		</thead>
								    	<c:forEach items="${m.multiplechoiceExampleList}" var="me">
									    	<tr>	
									    		<!-- when = 학생이 체크한 정답일 경우 -->
									    		<!-- c:otherwise = 학생이 체크한 정답이 아닐경우 -->
									    		<c:choose>
									    			<c:when test="${m.answersheetList[0].answerSelect == me.multiplechoiceExampleId}">
								    					<td><input checked="checked" type="radio" name="submit${me.multiplechoiceNo}" class="submit${me.multiplechoiceNo}" id="${me.multiplechoiceNo}" value="${me.multiplechoiceExampleId}"></td>			    			
									    			</c:when>
									    			<c:otherwise>
								    					<td><input type="radio" name="submit${me.multiplechoiceNo}" class="submit${me.multiplechoiceNo}" id="${me.multiplechoiceNo}" value="${me.multiplechoiceExampleId}"></td>			    							    		
									    			</c:otherwise>
									    		</c:choose>
									    		<td>${me.multiplechoiceExampleId}번. </td>
								    			<td colspan="3">${me.multiplechoiceExampleContent}</td>
									   		</tr>
								    	</c:forEach>
							    	</table>
						    	</c:forEach>
						    </div>
						    <!-- 페이징 -->
						    <div class="col-12">
							    <div class="mt-3 col-12">
							    	${currentPage}/${lastPage} 페이지
							    	<c:if test="${currentPage > 1}">
							    		<a href="${pageContext.request.contextPath}/auth/student/lecture/${lectureNo}/test/testOne/${currentPage - 1}">이전 페이지</a>
							    	</c:if>
							    	<c:if test="${currentPage < lastPage}">
							    		<a href="${pageContext.request.contextPath}/auth/student/lecture/${lectureNo}/test/testOne/${currentPage + 1}">다음 페이지</a>
							    	</c:if>
							    </div>
							    
							    <!-- 평가 제출 -->
							    <div class="mt-4 col-12">
							    	<c:if test="${currentPage == lastPage}">
							    		<button type="button" id="finishTest" class="btn btn-outline-primary">평가 종료</button>
							    	</c:if>
							    </div>
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