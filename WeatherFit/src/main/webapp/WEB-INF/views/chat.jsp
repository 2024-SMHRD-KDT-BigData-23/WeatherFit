<%@page import="com.smhrd.model.UserVO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

<link rel="stylesheet" href="assets/css/chat.css">
</head>
<body>
	<%
	UserVO uvo = (UserVO) session.getAttribute("userVO");
	out.print(uvo.getUserId());
	out.print(uvo.getUserNick());
	%>
	<header class="p-3 bg-light">
		<div
			class="container d-flex align-items-center justify-content-between">
			<div class="logo">WeatherWidget</div>
			<div class="title">WeatherFit</div>
			<ul class="nav nav-underline">
				<li class="nav-item"><a class="nav-link" href="gomain.do">홈</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="#">검색</a></li>
				<li class="nav-item"><a class="nav-link" href="follow.html">팔로우</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="#">메시지</a></li>
				<li class="nav-item"><a class="nav-link" href="#">알림</a></li>
				<li>
					<!-- 세션이 null이 아니라면 프로필로 바뀌게하면 됨! --> <c:if test="${userVO==null}">
						<button type="button" class="btn btn-primary" id="btn-login">로그인</button>

					</c:if> <c:if test="${userVO!=null}">
						<button type="button" class="btn btn-primary" id="btn-logout">로그아웃</button>
					</c:if>
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
							name="sendUserId" value="<%=uvo.getUserId()%>">
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
		let userId = "<%=uvo.getUserId()%>";
	</script>
	<script src="assets/js/chat.js"></script>
</body>
</html>