<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="assets/css/message.css">
</head>
<body>
	<% session.setAttribute("chatroom", "2"); %>
	<%= session.getAttribute("chatroom") %>
	<div class="container">
		<div class="chat-container" id="chat-container">
			<!-- 채팅 메시지가 표시될 영역 -->
		</div>
		<input type="text" id="message-input" placeholder="메시지를 입력하세요...">
		<button onclick="sendMessage()">전송</button>
	</div>
	<script>
		let path;
		path = "ws://localhost:8080/WeatherFit/websocket/" + <%= session.getAttribute("chatroom") %>
		
		$(document).ready(function() {
			// 웹소켓 초기화
			webSocketInit(path);
		});
		
		// 웹소켓 생성
		let webSocket;
		
		function sendMessage() {
			let message = $("#message-input").val();
			socketMsgSend(message);
			messageView();
		}

		function webSocketInit(path) {
			/* webSocket = new WebSocket(
					"ws://localhost:8080/WeatherFit/websocket/1"); */
			webSocket = new WebSocket(
					path);
			webSocket.onopen = function(event) {
				socketOpen(event);
			};
			webSocket.onclose = function(event) {
				socketClose(event);
			};
			webSocket.onmessage = function(event) {
				socketMessage(event);
			};
			webSocket.onerror = function(event) {
				socketError(event);
			};
		}

		// 웹소켓 연결
		function socketOpen(event) {
			console.log("연결 완료");
		}

		// 웹소켓 닫힘
		function socketClose(event) {
			console.log("웹소켓이 닫혔습니다.");
			// 웹소켓이 닫혀있으면 재연결을 시도합니다.
			webSocketInit();
		}

		// 메시지 송신
		function socketMsgSend(sendMessage) {
			let msg = {
				type : "TALK",
				roomIdx : 1,
				value : sendMessage,
				userId : '<%=(String) session.getAttribute("userId")%>'
			// seq : $("#seq").val()
			};
			// 세션리스트에 메시지를 송신한다.
			// webSocket.send(msg)
			webSocket.send(JSON.stringify(msg));
		}

		// 웹소켓 메시지 수신
		function socketMessage(event) {
			let receiveData = event.data; // 수신 data
			console.log("수신된 msg : " + receiveData);
			console.log(typeof receiveData);
			let message = JSON.parse(receiveData);

		}

		// 웹소켓 에러
		function socketError(event) {
			alert("에러가 발생하였습니다.");
		}

		// 웹소켓 종료
		function disconnect() {
			webSocket.close();
		}

		// html에 채팅 내용 추가 
		function messageView() {
			const messageInput = document.getElementById('message-input');
			const message = messageInput.value;

			if (message.trim() !== '') {
				const chatContainer = document.getElementById('chat-container');
				const messageElement = document.createElement('div');
				messageElement.classList.add('message');
				messageElement.textContent = message;
				chatContainer.appendChild(messageElement);
				messageInput.value = ''; // 입력란을 비웁니다.
			}
		}
	</script>
</body>
</html>