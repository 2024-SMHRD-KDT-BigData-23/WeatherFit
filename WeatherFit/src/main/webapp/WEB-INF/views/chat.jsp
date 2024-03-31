<%@page import="com.smhrd.model.UserVO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>WeatherFit</title>

	<%@ include file="includeHeaders.jsp"%>
<link rel="stylesheet" href="assets/css/chat.css">
</head>
<body>
	<%@ include file="includeNavi.jsp"%>

	<main id="main-chat" class="container-flex">

		<div id="menu-room" class="container-fluid flex-column p-3 bg-light">
			<ul class="nav mb-auto">
				<li id="btn-room-add">
					<!-- Button trigger modal -->

					<button type="button" id="btn-addchat" class="btn-blue"
						data-bs-toggle="modal" data-bs-target="#exampleModal">채팅상대추가</button>
				</li>
			</ul>
		</div>

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
							name="sendUserId" value="${member.userId}">
					</div>
					<div class="modal-footer">
						<!-- <input type="submit" class="btn btn-blue"
							value="채팅방생성"> -->
						<button class="btn-blue">채팅방생성</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	</main>









	<script>
		let userId = "${member.userId}";
	</script>
	<script src="assets/js/chat.js"></script>
</body>
</html>