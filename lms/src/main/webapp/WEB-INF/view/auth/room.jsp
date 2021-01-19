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
				
				// let myUrl = window.location.hostname;
				
			    let webSocket;
			    let nickname = '${loginName}';
			    let roomId = '${chatroomList.chatroomUuid}';
			    let sendId;
			    let sendName;
			    
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

			    connect();
			    
			    // 전송 버튼 누르기
			    document.getElementById("send").addEventListener("click", function() {
			        send();
			    });
			    
			    function disconnect() {
			        webSocket.send(JSON.stringify({chatRoomId : roomId,type:'LEAVE',writer:nickname}));
			        webSocket.close();
			    }
			    
			    // 메세지 보내기
			    function send() {
			        msg = document.getElementById("message").value;
			        webSocket.send(JSON.stringify({chatRoomId : roomId,type:'CHAT',writer:nickname,message : msg}));
			        document.getElementById("message").value = "";
					
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
						}
					});
			    }
			    
			    function onOpen() {
			        webSocket.send(JSON.stringify({chatRoomId : roomId,type:'ENTER',writer:nickname}));
			    }
			    
			    // 메세지를 보낼 때 내 화면 갱신
			    function onMessage(e) {
			        data = e.data;
			        chatroom = document.getElementById("chat");
			        chatroom.innerHTML = chatroom.innerHTML + "<br>" + data;
			        // 스크롤 조정
					scrollControll();
			    }
			    
			    // 접속 종료
			    function onClose() {
			        disconnect();
			    }
			    
			    // 브라우저 종료 및 닫기 감지 
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
	<body>
		<div id="container">
			<main>
				<header>
					<img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/1940306/chat_avatar_01.jpg" alt="">
					<div>
						<c:choose>
							<c:when test="${loginId == chatroomList.chatroomPerson1Id}">
								<h2>${chatroomList.chatroomPerson2Name}</h2>
							</c:when>
							<c:otherwise>
								<h2>${chatroomList.chatroomPerson1Name}</h2>
							</c:otherwise>
						</c:choose>
						<h3>already 1902 messages</h3>
					</div>
					<img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/1940306/ico_star.png" alt="">
				</header>
				<ul id="chat">
					<c:forEach var="cl" items="${chatList}">
						<c:choose>
							<c:when test="${cl.chatReceiveName == loginName}">
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
	</body>
</html>