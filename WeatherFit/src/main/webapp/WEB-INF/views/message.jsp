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
</head>
<body>
	<header class="p-3 bg-light">
		<div
			class="container d-flex align-items-center justify-content-between">
			<div class="logo">WeatherWidget</div>
			<div class="title">WeatherFit</div>
			<ul class="nav nav-underline">
				<li class="nav-item"><a class="nav-link" href="main.jsp">홈</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="search.jsp">검색</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="#">팔로우</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="message.jsp">메시지</a></li>
				<li class="nav-item"><a class="nav-link" href="#">알림</a></li>
				<li>
					<!-- 세션이 null이 아니라면 프로필로 바뀌게하면 됨! -->
					<button type=o "buttn" class="btn btn-primary">로그인</button>
				</li>
			</ul>
		</div>
	</header>
	<main>
		<div class="container-fluid d-flex p-3 bg-light">
			<ul class="nav mb-auto">
				<li class="nav-item"><a href="#" class="nav-link active"
					aria-current="page"> <svg class="bi pe-none me-2" width="16"
							height="16">
                            <use xlink:href="#home" />
                        </svg> Chatroom1
				</a></li>
				<li><a href="#" class="nav-link"> <svg
							class="bi pe-none me-2" width="16" height="16">
                            <use xlink:href="#speedometer2" />
                        </svg> Chatroom2
				</a></li>
				<li><a href="#" class="nav-link"> <svg
							class="bi pe-none me-2" width="16" height="16">
                            <use xlink:href="#table" />
                        </svg> Chatroom3
				</a></li>
				<li><a href="#" class="nav-link"> <svg
							class="bi pe-none me-2" width="16" height="16">
                            <use xlink:href="#grid" />
                        </svg> Chatroom4
				</a></li>
				<li><a href="#" class="nav-link"> <svg
							class="bi pe-none me-2" width="16" height="16">
                            <use xlink:href="#people-circle" />
                        </svg> Chatroom5
				</a></li>
			</ul>
		</div>
		<div class="container">
			<div class="align-items-bottom">
				<li class="d-flex flex-row-reverse align-items-end my-3"><span
					class="chat-box mine ms-1">${a.data().content}</span> <span
					class="tx-small text-end"> ${datejs.format('M월D일 HH:mm')} </span></li>
				<li class="d-flex flex-row align-items-end my-3"><span
					class="chat-box me-1">${a.data().content}</span> <span
					class="tx-small"> ${datejs.format('M월D일 HH:mm')} </span></li>
				<li class="d-flex flex-row align-items-end my-3"><span
					class="chat-box me-1">${a.data().content}</span> <span
					class="tx-small"> ${datejs.format('M월D일 HH:mm')} </span></li>
				<li class="d-flex flex-row-reverse align-items-end my-3"><span
					class="chat-box mine ms-1">${a.data().content}</span> <span
					class="tx-small text-end"> ${datejs.format('M월D일 HH:mm')} </span></li>
			</div>
			<div>
				<form class="d-flex" action="#">
					<input class="form-control" type="text" placeholder="메시지 입력"
						aria-label="default input example"> <input type="submit"
						value="보내기">
				</form>
			</div>
		</div>
		</div>
</body>
</html>