<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		
		<title>chat</title>
		
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
		
		<script type="text/javascript">
			$(document).ready(function() {
				// 엔터 키 누르는 이벤트와 보내기 버튼 누르는 이벤트를 동일시함
				$('#message').on('keypress', function(e){
					if(e.keyCode == '13'){
						$('#send').click();
					}
				});

				// 사용자 정보
			    let webSocket;
			    let nickname = '${loginName}';
			    let roomId = '${chatroomList.chatroomUuid}';
			    let sendId;
			    let sendName;

			    // 사용자 구분하기
			    if('${loginId}' == '${chatroomList.chatroomPerson1Id}') {
			    	sendId = '${chatroomList.chatroomPerson2Id}';
			    	sendName = '${chatroomList.chatroomPerson2Name}';
				} else {
			    	sendId = '${chatroomList.chatroomPerson1Id}';
			    	sendName = '${chatroomList.chatroomPerson1Name}';
				}
				
				// 소켓 접속
			    function connect() {
			        webSocket = new WebSocket('ws://' + document.location.host + '/lms/chat');
			        webSocket.onopen = onOpen;
			        webSocket.onclose = onClose;
			        webSocket.onmessage = onMessage;
			    }
				// 연결하기
			    connect();
			    
			    // 전송 버튼 누르기
			    document.getElementById("send").addEventListener("click", function() {
			        send();
			    });

			    // 연결 해제
			    function disconnect() {
				    // 연결 해제 메세지
			        webSocket.send(JSON.stringify({chatRoomId : roomId,type:'LEAVE',writerName:nickname,writerId:'${loginId}'}));
			        // 연결 해제하기
			        webSocket.close();
			    }
			    
			    // 메세지 보내기
			    function send() {
				    var pattern = /\s/g;
				    // 메세지 유효성 검사
				    if($('#message').val().length < 1 || ($('#message').val()).replace(/\s/g, '').length < 1) {
						document.getElementById("message").value = '';
						return;
			    	}
			        msg = document.getElementById("message").value;
			        webSocket.send(JSON.stringify({chatRoomId : roomId,type:'CHAT',writerName:nickname,writerId:'${loginId}',message : msg}));
					
			        // DB에 데이터 추가
			        $.ajax({
						url: '${pageContext.request.contextPath}/auth/chat/insertChatList',
						type:'post',
						data: {
							chatroomUuid : roomId, 
							chatSendId : sendId, 
							chatSendName : sendName, 
							chatReceiveId : '${loginId}', 
							chatReceiveName : '${loginName}', 
							chatText : msg
						},
						success:function(data){
							// 입력창 초기화
							document.getElementById("message").value='';
						}
					});
			    }

			    // 연결시
			    function onOpen() {
				    // 연결 메세지
			        webSocket.send(JSON.stringify({chatRoomId : roomId,type:'ENTER',writer:nickname,writerId:'${loginId}'}));
			    }
			    
			    // 메세지를 보낼 때 내 화면 갱신
			    function onMessage(e) {
			        data = e.data; // 메세지 정보
			        
			        let tempData = (data.substring(1, data.length - 1)).split(','); // 메세지 분할
			        let dataId = tempData[0]; // 아이디
			        let dataName = tempData[1]; // 이름
			        let dataDate = tempData[2]; // 날짜
			        // 메세지 내용 분리 작업
			        let dataIndex = data.indexOf(','); 
			        for(let i = 0; i < 2; i++){
			        	dataIndex = data.indexOf(',' , dataIndex + 1);
				    }
			        let dataMsg = data.substring(dataIndex + 1, data.length - 1); // 메세지 내용
			        dataMsg = (dataMsg.replaceAll('\\n', '<br>')).replaceAll('\\', '&#92;'); // replace

			        // 메세지 내용을 뷰에 띄움
			        chatroom = document.getElementById("chat");
					if(dataId == '${loginId}') {
						chatroom.innerHTML = chatroom.innerHTML + `
							<li class="me">
								<div class="entete">
									<h3>` + dataDate + `</h3>
									<h2>` + dataName + `</h2>
									<span class="status blue"></span>
								</div>
								<div class="triangle"></div>
								<div class="message">`
									+ dataMsg + `
								</div>
							</li>
						`
					} else {
						chatroom.innerHTML = chatroom.innerHTML + `
							<li class="you">
								<div class="entete">
									<span class="status green"></span>
									<h2>` + dataName + `</h2>
									<h3>` + dataDate + `</h3>
								</div>
								<div class="triangle"></div>
								<div class="message">`
									+ dataMsg + `
								</div>
							</li>
						`
					}
			        // 스크롤 조정
					scrollControll();
			    }
			    
			    // 접속 종료
			    function onClose() {
			        disconnect();
			    }
			    
			    // 브라우저 종료 및 닫기 감지 - 비정상 종료 대처
			    window.onbeforeunload = function() {		 			 
		 			onClose(); 
		 		}
		 		
				// 스크롤 조정
			    function scrollControll() {
			        if (document.getElementById('chat').scrollHeight > 0){
				         document.getElementById('chat').scrollTop = document.getElementById('chat').scrollHeight;
			        }
			    }
			    
				scrollControll();

			});
		</script>
		
		<style>
			*{
				box-sizing:border-box;
			}
			body{
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
			main{
				width:490px;
				height:800px;
				display:inline-block;
				font-size:15px;
				vertical-align:top;
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
							<main>
								<header>
									<c:if test="${empty chatroomList.chatroomImage}">
										<img width="30px" src="${pageContext.request.contextPath}/resource/mypageImage/default.png" alt="">												
									</c:if>
									<c:if test="${!empty chatroomList.chatroomImage}">
										<img width="30px" src="${pageContext.request.contextPath}/resource/mypageImage/${chatroomList.chatroomImage}" alt="">												
									</c:if>
									<div>
										<c:choose>
											<c:when test="${loginId == chatroomList.chatroomPerson1Id}">
												<h2>${chatroomList.chatroomPerson2Name}</h2>
											</c:when>
											<c:otherwise>
												<h2>${chatroomList.chatroomPerson1Name}</h2>
											</c:otherwise>
										</c:choose>
										<h3></h3>
									</div>
								</header>
								<ul id="chat">
									<c:forEach var="cl" items="${chatList}">
										<c:choose>
											<c:when test="${cl.chatReceiveId == loginId}">
												<li class="me">
													<div class="entete">
														<h3>${cl.chatSenddate}</h3>
														<h2>${cl.chatReceiveName}</h2>
														<span class="status blue"></span>
													</div>
													<div class="triangle"></div>
													<div class="message">
														${cl.chatText}
													</div>
												</li>
											</c:when>
											<c:otherwise>
												<li class="you">
													<div class="entete">
														<span class="status green"></span>
														<h2>${cl.chatReceiveName}</h2>
														<h3>${cl.chatSenddate}</h3>
													</div>
													<div class="triangle"></div>
													<div class="message">
														${cl.chatText}
													</div>
												</li>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</ul>
								<footer>
									<textarea id="message" placeholder="메세지를 입력하세요." autofocus></textarea>
									<div class="text-right">
										<button class="btn btn-sm btn-dark" id="send">보내기</button>
									</div>
								</footer>
							</main>
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