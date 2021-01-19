<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		
		<title>lmsNoticeOne</title>
		
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
			
			$(document).ready(function(){
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
			    if('${loginId}' == '${chatroomList.chatroomPerson1Id}'){
			    	sendId = '${chatroomList.chatroomPerson2Id}';
			    	sendName = '${chatroomList.chatroomPerson2Name}';
				} else {
			    	sendId = '${chatroomList.chatroomPerson1Id}';
			    	sendName = '${chatroomList.chatroomPerson1Name}';
				}
			    /*
			    document.getElementById("name").addEventListener("click",function(){
			        nickname = document.getElementById("nickname").value;
			        document.getElementById("nickname").style.display = "none";
			        document.getElementById("name").style.display = "none";
			        connect();
			    })
			    */
		        // document.getElementById("nickname").style.display = "none";
		        // document.getElementById("name").style.display = "none";

			    function connect(){
			        webSocket = new WebSocket('ws://' + document.location.host + '/lms/chat');
			        webSocket.onopen = onOpen;
			        webSocket.onclose = onClose;
			        webSocket.onmessage = onMessage;
			    }

			    connect();
			    
			    document.getElementById("send").addEventListener("click",function(){
			        send();
			    })
			    function disconnect(){
			        webSocket.send(JSON.stringify({chatRoomId : roomId,type:'LEAVE',writer:nickname}));
			        webSocket.close();
			    }
			    function send(){
			        msg = document.getElementById("message").value;
			        webSocket.send(JSON.stringify({chatRoomId : roomId,type:'CHAT',writer:nickname,message : msg}));
			        document.getElementById("message").value = "";
					
			        // DB에 데이터 추가
			        $.ajax({
						url: '${pageContext.request.contextPath}/auth/chat/insertChatList',
						type:'post',
						data: {chatroomUuid : roomId, chatSendId : sendId, chatSendName : sendName, chatReceiveId : '${loginId}', chatReceiveName : '${loginName}', chatText : msg}
					});
					
			    }
			    function onOpen(){
			        webSocket.send(JSON.stringify({chatRoomId : roomId,type:'ENTER',writer:nickname}));
			    }
			    function onMessage(e){
			        data = e.data;
			        chatroom = document.getElementById("chatroom");
			        chatroom.innerHTML = chatroom.innerHTML + "<br>" + data;
			        // 스크롤 조정
					scrollControll();
			    }
			    function onClose(){
			        disconnect();
			    }
			    //브라우저 종료 및 닫기 감지 
			    window.onbeforeunload = function() {		 			 
		 			onClose(); 
		 		} 
				// 스크롤 조정
			    function scrollControll(){
			        if (document.getElementById('chatroom').scrollHeight > 0){
				         document.getElementById('chatroom').scrollTop = document.getElementById('chatroom').scrollHeight;
			        }
			    }
				scrollControll();
			    
			})
			
		</script>
	</head>
	<body>
		<!-- 
		<input type="text" id="nickname" class="form-inline" placeholder="닉네임을 입력해주세요" required autofocus>
		<button class = "btn btn-primary" id = "name">확인</button>
		<label for="roomId" class="label label-default">방 번호</label>
		<label id="roomId" class="form-inline">${room.roomId}</label>
		<br> 
		 -->
		<label for="roomName" class="label label-default">방 이름</label>
			<c:choose>
				<c:when test="${loginId == chatroomList.chatroomPerson1Id}">
					<label id="roomName" class="form-inline">${chatroomList.chatroomPerson2Name}</label>
				</c:when>
				<c:otherwise>
					<label id="roomName" class="form-inline">${chatroomList.chatroomPerson1Name}</label>
				</c:otherwise>
			</c:choose>
		<div id="chatroom" style = "overflow: auto; max-height: 610px; width:400px; height: 600px; border:1px solid; background-color : navy;color: white;">
			<c:forEach var="cl" items="${chatList}">
				<div>
					"${cl.chatReceiveName}:${cl.chatText}"
				</div>
			</c:forEach>
		</div>
		<input type="text" id="message" style="height : 30px; width : 340px" placeholder="내용을 입력하세요" autofocus>
		<button class = "btn btn-primary" id="send">전송</button>
	</body>
	
</html>