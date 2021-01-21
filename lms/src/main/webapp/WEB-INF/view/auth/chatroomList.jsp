<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>newChat</title>
		
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
		<script>
			$(document).ready(function(){
				// 받는사람 검색 버튼
				$('#searchAccountBtn').click(function(){
					$('#selectAccount').html('');
					// 계정 리스트 가져오기
					$.ajax({
						url: '${pageContext.request.contextPath}/auth/chat/insertChatList/' + $('#searchAccount').val(),
						type:'get',
						success: function(data){									
							$(data).each(function(key, value) {
								$('#selectAccount').append('<div><a href="${pageContext.request.contextPath}/auth/room/new/'+ value.accountId + '/' + value.accountName + '/${loginId}/${loginName}" class="btn btn-secondry form-control">' + value.accountName + '(' + value.accountId + ')</a></div>');
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
				
			})
		</script>
		<style>
			*{
				box-sizing:border-box;
			}
			body{
				background-color:#abd9e9;
				font-family:Arial;
			}
			#container{
				width:490px;
				height:800px;
				background:#eff3f7;
				margin:0 auto;
				font-size:0;
				border-radius:5px;
				overflow:hidden;
			}
			aside{
				width:490px;
				height:800px;
				background-color:#3b3e49;
				display:inline-block;
				font-size:15px;
				vertical-align:top;
			}
			main{
				width:490px;
				height:800px;
				display:inline-block;
				font-size:15px;
				vertical-align:top;
			}
			
			aside header{
				padding:30px 20px;
			}
			aside input{
				width:100%;
				height:50px;
				line-height:50px;
				padding:0 50px 0 20px;
				background-color:#5e616a;
				border:none;
				border-radius:3px;
				color:#fff;
				background-image:url(https://s3-us-west-2.amazonaws.com/s.cdpn.io/1940306/ico_search.png);
				background-repeat:no-repeat;
				background-position:400px;
				background-size:40px;
			}
			aside input::placeholder{
				color:#fff;
			}
			aside ul{
				padding-left:0;
				margin:0;
				list-style-type:none;
				overflow-y:scroll;
				height:690px;
			}
			aside li{
				padding:10px 0;
			}
			aside li:hover{
				background-color:#5e616a;
			}
			h2,h3{
				margin:0;
			}
			aside li img{
				border-radius:50%;
				margin-left:20px;
				margin-right:8px;
			}
			aside li div{
				display:inline-block;
				vertical-align:top;
				margin-top:12px;
			}
			aside li h2{
				font-size:14px;
				color:#fff;
				font-weight:normal;
				margin-bottom:5px;
			}
			aside li h3{
				font-size:12px;
				color:#7e818a;
				font-weight:normal;
			}
			
			.status{
				width:8px;
				height:8px;
				border-radius:50%;
				display:inline-block;
				margin-right:7px;
			}
			.green{
				background-color:#58b666;
			}
			.orange{
				background-color:#ff725d;
			}
			.blue{
				background-color:#6fbced;
				margin-right:0;
				margin-left:7px;
			}
			
			main header{
				height:110px;
				padding:30px 20px 30px 40px;
			}
			main header > *{
				display:inline-block;
				vertical-align:top;
			}
			main header img:first-child{
				border-radius:50%;
			}
			main header img:last-child{
				width:24px;
				margin-top:8px;
			}
			main header div{
				margin-left:10px;
				margin-right:145px;
			}
			main header h2{
				font-size:16px;
				margin-bottom:5px;
			}
			main header h3{
				font-size:14px;
				font-weight:normal;
				color:#7e818a;
			}
			
			#chat{
				padding-left:0;
				margin:0;
				list-style-type:none;
				overflow-y:scroll;
				height:535px;
				border-top:2px solid #fff;
				border-bottom:2px solid #fff;
			}
			#chat li{
				padding:10px 30px;
			}
			#chat h2,#chat h3{
				display:inline-block;
				font-size:13px;
				font-weight:normal;
			}
			#chat h3{
				color:#bbb;
			}
			#chat .entete{
				margin-bottom:5px;
			}
			#chat .message{
				padding:20px;
				color:#fff;
				line-height:25px;
				max-width:90%;
				display:inline-block;
				text-align:left;
				border-radius:5px;
			}
			#chat .me{
				text-align:right;
			}
			#chat .you .message{
				background-color:#58b666;
			}
			#chat .me .message{
				background-color:#6fbced;
			}
			#chat .triangle{
				width: 0;
				height: 0;
				border-style: solid;
				border-width: 0 10px 10px 10px;
			}
			#chat .you .triangle{
					border-color: transparent transparent #58b666 transparent;
					margin-left:15px;
			}
			#chat .me .triangle{
					border-color: transparent transparent #6fbced transparent;
					margin-left:375px;
			}
			
			main footer{
				height:155px;
				padding:20px 30px 10px 20px;
			}
			main footer textarea{
				resize:none;
				border:none;
				display:block;
				width:100%;
				height:80px;
				border-radius:3px;
				padding:20px;
				font-size:13px;
				margin-bottom:13px;
			}
			main footer textarea::placeholder{
				color:#ddd;
			}
			main footer img{
				height:30px;
				cursor:pointer;
			}
			main footer a{
				text-decoration:none;
				text-transform:uppercase;
				font-weight:bold;
				color:#6fbced;
				vertical-align:top;
				margin-left:333px;
				margin-top:5px;
				display:inline-block;
			}
		</style>
	</head>
	<body class="">
		<!-- 메인 Navbar -->
		
		<nav class="navbar navbar-vertical fixed-left navbar-expand-md navbar-light bg-white" id="sidenav-main">
			
			<div class="container-fluid">
				<c:choose>
					<c:when test="${loginLevel == 1}">
						<jsp:include page="/WEB-INF/view/auth/student/include/menu.jsp" />
					</c:when>
					<c:when test="${loginLevel == 2}">
						<jsp:include page="/WEB-INF/view/auth/teacher/include/menu.jsp" />
					</c:when>
					<c:when test="${loginLevel == 3}">
						<jsp:include page="/WEB-INF/view/auth/manager/include/menu.jsp" />
					</c:when>
				</c:choose>
		    </div>	
		</nav>   		
		<div class="main-content">
			<!-- 상단 Navbar -->
			<div class="container-fluid">			
				<c:choose>
					<c:when test="${loginLevel == 1}">
						<jsp:include page="/WEB-INF/view/auth/student/include/topMenu.jsp" />
					</c:when>
					<c:when test="${loginLevel == 2}">
						<jsp:include page="/WEB-INF/view/auth/teacher/include/noLectureMenu.jsp" />
					</c:when>
					<c:when test="${loginLevel == 3}">
						<jsp:include page="/WEB-INF/view/auth/manager/include/topMenu.jsp" />
					</c:when>
				</c:choose>
	    	</div>
			
	    	<!-- 접속자 -->			
			<c:choose>
				<c:when test="${loginLevel == 1}">
					<jsp:include page="/WEB-INF/view/auth/student/include/connector.jsp" />
				</c:when>
				<c:when test="${loginLevel == 2}">
					<jsp:include page="/WEB-INF/view/auth/teacher/include/connector.jsp" />
				</c:when>
				<c:when test="${loginLevel == 3}">
					<jsp:include page="/WEB-INF/view/auth/manager/include/connector.jsp" />
				</c:when>
			</c:choose>
   			<div class="container-fluid mt--7 col-12">
				<div class="card shadow">
					<div class="card-header border-0">
						<div class="row align-items-center">						
							<aside>
								<header>
									<div class="row">
										<div class="col-9">
											<input type="text" id="searchAccount" placeholder="search">								
										</div>
										<div class="col-1">
											<button id="searchAccountBtn" class="btn btn-primary btn-lg">검색</button>
										</div>
									</div>
								</header>
								<ul>
							    	<div id="selectAccount" style="overflow: auto; width: 90%; max-height: 200px;">
									</div>
									<c:forEach var="cl" items="${chatroomList}">
										<a href="${pageContext.request.contextPath}/auth/rooms/${cl.chatroomUuid}">
											<li>
												<c:if test="${empty cl.chatroomImage}">
													<img width="30px" src="${pageContext.request.contextPath}/resource/mypageImage/default.png" alt="">												
												</c:if>
												<c:if test="${!empty cl.chatroomImage}">
													<img width="30px" src="${pageContext.request.contextPath}/resource/mypageImage/${cl.chatroomImage}" alt="">												
												</c:if>
												<div>
													<h2>
														<c:choose>
															<c:when test="${cl.chatroomPerson1Id == loginId}">
																${cl.chatroomPerson2Name}(${cl.chatroomPerson2Id})
															</c:when>
															<c:otherwise>
																${cl.chatroomPerson1Name}(${cl.chatroomPerson1Id})												
															</c:otherwise>
														</c:choose>
													</h2>
													<h3>
														
													</h3>
												</div>
											</li>
										</a>							
									</c:forEach>
								</ul>
							</aside>
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