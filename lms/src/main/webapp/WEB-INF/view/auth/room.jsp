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
		
	</head>
	<body>
		<input type="text" id="nickname" class="form-inline" placeholder="닉네임을 입력해주세요" required autofocus>
		<button class = "btn btn-primary" id = "name">확인</button>
		<label for="roomId" class="label label-default">방 번호</label>
		<label id="roomId" class="form-inline">${room.roomId}</label>
		<br>
		<label for="roomName" class="label label-default">방 이름</label>
		<label id="roomName" class="form-inline">${room.name}</label>
		<div id = "chatroom" style = "width:400px; height: 600px; border:1px solid; background-color : gray"></div>
		<input type = "text" id = "message" style = "height : 30px; width : 340px" placeholder="내용을 입력하세요" autofocus>
		<button class = "btn btn-primary" id="send">전송</button>
	</body>
	
	<script type="text/javascript">
	    var webSocket;
	    var nickname;
	    var roomId = '${room.roomId}';
	    document.getElementById("name").addEventListener("click",function(){
	        nickname = document.getElementById("nickname").value;
	        document.getElementById("nickname").style.display = "none";
	        document.getElementById("name").style.display = "none";
	        connect();
	    })
	    document.getElementById("send").addEventListener("click",function(){
	        send();
	    })
	    function connect(){
	        webSocket = new WebSocket("ws://localhost/chat");
	        webSocket.onopen = onOpen;
	        webSocket.onclose = onClose;
	        webSocket.onmessage = onMessage;
	    }
	    function disconnect(){
	        webSocket.send(JSON.stringify({chatRoomId : roomId,type:'LEAVE',writer:nickname}));
	        webSocket.close();
	    }
	    function send(){
	        msg = document.getElementById("message").value;
	        webSocket.send(JSON.stringify({chatRoomId : roomId,type:'CHAT',writer:nickname,message : msg}));
	        document.getElementById("message").value = "";
	    }
	    function onOpen(){
	        webSocket.send(JSON.stringify({chatRoomId : roomId,type:'ENTER',writer:nickname}));
	    }
	    function onMessage(e){
	        data = e.data;
	        chatroom = document.getElementById("chatroom");
	        chatroom.innerHTML = chatroom.innerHTML + "<br>" + data;
	    }
	    function onClose(){
	        disconnect();
	    }
	</script>
</html>