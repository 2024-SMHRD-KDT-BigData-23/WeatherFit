<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<!-- bootstrap -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<!-- bootstrap -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>
<!-- jquery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style type="text/css">
	.chat-container {
            display: flex;
            flex-direction: column;
            padding: 10px;
            max-width: 300px;
            height: 400px;
            border: 1px solid #ccc;
            overflow-y: auto;
        }
        .message {
            padding: 5px 10px;
            margin: 5px;
            border-radius: 10px;
        }
        .mine {
            align-self: flex-end;
            background-color: #007bff;
            color: white;
        }
        .theirs {
            align-self: flex-start;
            background-color: #ccc;
        }
</style>
</head>
<body>
	<%
	session.setAttribute("userId", "ehdwn123");
	%>
	<header class="p-3 bg-light">
		<div
			class="container d-flex align-items-center justify-content-between">
			<div class="logo">WeatherWidget</div>
			<div class="title">WeatherFit</div>
			<ul class="nav nav-underline">
				<li class="nav-item"><a class="nav-link" href="home.html">홈</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="#">검색</a></li>
				<li class="nav-item"><a class="nav-link" href="follow.html">팔로우</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="#">메시지</a></li>
				<li class="nav-item"><a class="nav-link" href="#">알림</a></li>
				<li>
					<!-- 세션이 null이 아니라면 프로필로 바뀌게하면 됨! -->
					<button type="button" class="btn btn-primary">로그인</button>
				</li>
			</ul>
		</div>
	</header>
	<main>
		<div id="menu-room" class="container-fluid d-flex p-3 bg-light">
			<ul class="nav mb-auto">
				<li id="btn-room-add">
					<!-- Button trigger modal -->
					<button type="button" class="btn btn-primary"
						data-bs-toggle="modal" data-bs-target="#exampleModal">채팅상대추가</button>
				</li>
			</ul>
		</div>
	</main>

	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">채팅상대입력</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<form action="CreateRoom.do" method="post">
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text" id="basic-addon1">@UserId</span>
						</div>
						<input type="text" name="receiveUserId" class="form-control"
							placeholder="UserId" aria-label="Username"
							aria-describedby="basic-addon1"> <input type="hidden"
							name="sendUserId" value="<%=session.getAttribute("userId")%>">
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">닫기</button>
						<!-- <input type="submit" class="btn btn-primary"
							value="채팅방생성"> -->
						<button class="btn btn-primary">채팅방생성</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<script>
		let userId = "<%= session.getAttribute("userId") %>";
		let roomIdx;
		let webSocket; // 웹소켓 생성
		
		// 채팅방 목록 로딩 
		(function() {
			$.ajax({
				url: "Rooms",
				data: {"userId" : userId},
				dataType: "json",
				type: "post",
				success: function(rooms) {
					for(let i = 0; i < rooms.length; i++) {
						$("#btn-room-add").after(`<li class="nav-item"><a href="#" class="chatroom nav-link active"
								aria-current="page" data-val=` + rooms[i].roomIdx + `> <svg class="bi pe-none me-2" width="16"
								height="16">
		                            <use xlink:href="#home" />
		                    </svg>` + rooms[i].roomTitle +
					`</a></li>`);
					}
						
				},
				error: function() {
					console.log("연결 실패 ..");
				}
			});
		}());
		
		// 채팅방 클릭시 채팅화면 로딩 
		$(document).on("click", ".chatroom", function(event) {
			event.preventDefault();
			roomIdx = $(this).attr("data-val");
			// 채팅방 html
			$(".container").remove();
			$("#menu-room").after(/* `
					<div class="container">
						<div class="row justify-content-center mt-5">
							<div class="col-md-6">
								<div class="chat-box bg-white p-3 mb-4">
									<div class="message received p-2 mb-2">
										<p class="m-0">안녕하세요! 어떻게 도와드릴까?</p>
									</div>
									<div class="message sent p-2 mb-2">
										<p class="m-0">안녕하세요, 질문이 있어요.</p>
									</div>
								</div>
								<div class="input-group">
									<input type="text" class="form-control" placeholder="메시지 입력..">
									<button class="btn btn-primary">전송</button>
								</div>
							</div>
						</div>
					</div>` */
					`<div class="container">
					<div class="chat-container" id="chat-container">
					<!-- 채팅 메시지가 표시될 영역 -->
				</div>
				<input type="text" id="message-input" placeholder="메시지를 입력하세요...">
				<button id="btn-send">전송</button>
			</div>`);
			
			let path = "ws://localhost:8080/WeatherFit/websocket/" + roomIdx;
			console.log(path);
			// 웹소켓 초기화
			webSocketInit(path);
			
			$.ajax({
				url: "Chats",
				data: {"roomIdx" : roomIdx},
				dataType: "json",
				type: "post",
				success: function(chats) {
					console.log(chats);
				},
				error: function() {
					console.log("채팅 목록 조회 실패..");
				}
			});
		});
		
		// 전송 버튼시 실행 
		$(document).on("click", "#btn-send", function() {
			console.log(userId + " " + roomIdx);
			sendMessage(userId, roomIdx);
		})
		
		// 전송 버튼을 눌렀을 때 실행하는 함수 모음 
		function sendMessage(userId, roomIdx) {
			let message = $("#message-input").val();
			socketMsgSend(userId, roomIdx, message);
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
		function socketMsgSend(userId, roomIdx, sendMessage) {
			let msg = {
				roomIdx : roomIdx,
				message : sendMessage,
				userId : userId					
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
			var input = document.getElementById("messageInput");
		    var message = input.value;
		    input.value = ""; // 입력 필드 초기화

		    var messageElement = document.createElement("div");
		    messageElement.classList.add("message", "mine");
		    messageElement.textContent = message;

		    var container = document.getElementById("chatContainer");
		    container.appendChild(messageElement);
		    container.scrollTop = container.scrollHeight; // 스크롤을 가장 아래로 이동
			/* const messageInput = document.getElementById('message-input');
			const message = messageInput.value;

			if (message.trim() !== '') {
				const chatContainer = document.getElementById('chat-container');
				const messageElement = document.createElement('div');
				messageElement.classList.add('message');
				messageElement.textContent = message;
				chatContainer.appendChild(messageElement);
				messageInput.value = ''; // 입력란을 비웁니다.
			} */
		}
	</script>
	<!-- <script src="././assets/js/message.js"></script> -->
</body>
</html>