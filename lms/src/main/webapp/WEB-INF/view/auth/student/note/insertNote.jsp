<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>insertNote</title>
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
		<script>
			$(document).ready(function(){
				// 받는사람 검색 버튼
				$('#searchAccountBtn').click(function(){
					$('#selectAccount').html('');	
					// 계정 리스트 가져오기
					$.ajax({
						url: '${pageContext.request.contextPath}/auth/student/note/accountList/' + $('#searchAccountText').val(),
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
						alert('내용을 작성해 주세요.');
						return;
					} else if($('#noteReceiverId').val().length < 1){
						alert('보낼 계정이 잘못되었습니다.');
						return;
					} else if($('#noteReceiverName').val().length < 1){
						alert('보낼 계정이 잘못되었습니다.');
						return;
					}

					$('#insertNoteForm').submit();											
				})	
			})
		</script>
	</head>
	<body class="">
		<!-- 메인 Navbar -->	
		<jsp:include page="/WEB-INF/view/auth/student/include/menu.jsp" />
		<div class="main-content">
			<!-- 상단 Navbar -->
			<div class="container-fluid">
				<jsp:include page="/WEB-INF/view/auth/student/include/topMenu.jsp" />
	    	</div>
			<!-- 쪽지 Navbar -->
			<div class="container-fluid">
				<jsp:include page="/WEB-INF/view/auth/student/include/noteMenu.jsp" />
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
												<div class="icon icon-shape bg-danger text-white rounded-circle shadow">
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
								<h3 class="mb-0">발신함</h3>
							</div>
						</div>
					</div>
					<div class="row align-items-center">
						<div class="col-12">
						    <!-- 쪽지 보내기 폼 -->
						    <div>
						    	<form id="insertNoteForm" method="post" action="${pageContext.request.contextPath}/auth/student/note/insertNote">      		
								    <input type="hidden" id="noteReceiverId" name="noteReceiverId">
								    <input type="hidden" id="noteReceiverName" name="noteReceiverName">
						    		<!-- 내용 -->
							    	<table class="table">
							    		<tr>
							    			<th>제목</th>
							    			<td><input class="form-control" id="noteTitle" type="text" name="noteTitle"></td>
							    		</tr>
							    		<tr>
							    			<th>받는사람</th>
							    			<td>
								    			<div class="input-group mb-3">
								    				<input class="form-control" type="text" id="searchAccountText">
								    				<button style="width:10%" class="btn-outline-primary" type="button" id="searchAccountBtn">검색</button>
							    				</div>
							    				<div id="selectAccount" style="overflow: auto; width: 100%; max-height: 200px;">
							    					
							    				</div>
							    			</td>
							    		</tr>
							    		<tr>
							    			<th>내용</th>
							    			<td><textarea rows="22" cols="10" wrap="hard" id="noteContent" name="noteContent" class="form-control"></textarea></td>
							    		</tr>
							    		<tr>
							    			<td colspan="2">						    				
											    <div>
											    	<button id="insertNoteBtn" class="btn btn-outline-primary" type="button">보내기</button>
											    </div>
							    			</td>
							    		</tr>
							    	</table>
						    	</form>
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