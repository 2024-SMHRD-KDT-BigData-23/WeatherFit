<%@page import="java.io.PrintWriter"%>
<%@page import="com.smhrd.model.UserVO"%>
<%@page import="com.smhrd.controller.GetPost"%>
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
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>
<!-- jquery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- fontawesome -->
<script src="https://kit.fontawesome.com/cf3cd4698d.js"
	crossorigin="anonymous"></script>

<link rel="stylesheet" href="././assets/css/login.css">
</head>
<body>
	<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

	<!-- 헤더부분(날씨위젯, 사이트명, 내비바) -->
	<header class="p-3 bg-light">
		<div
			class="container d-flex align-items-center justify-content-between">
			<!-- 날씨위젯 -->
			<a id="weather-link" href="#"
				class="d-flex align-items-around mb-2 mb-lg-0 text-decoration-none">
				<div id="weather-sky"></div>
				<div id="weather-t1h"></div>
			</a>
			<!-- 사이트명 -->
			<div class="title">WeatherFit</div>
			<!-- 내비바 -->
			<ul class="nav nav-underline">
				<li class="nav-item"><a class="nav-link" href="gomain.do">홈</a></li>
				<li class="nav-item"><a class="nav-link" href="gosearch.do">검색</a></li>
				<li class="nav-item"><a class="nav-link" href="#">팔로우</a></li>
				<li class="nav-item"><a class="nav-link" href="gochat.do">메시지</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="#">알림</a></li>
				<li>
					<!-- 세션이 null이 아니라면 프로필로 바뀌게하면 됨! --> <c:if test="${userVO==null}">
						<button type="button" class="btn btn-primary" id="btn-login">로그인</button>

					</c:if> <c:if test="${userVO!=null}">
						<%
						UserVO uvo = (UserVO) session.getAttribute("userVO");
						
						out.print(uvo.getUserId());
						out.print(uvo.getUserName());
						out.print(uvo.getUserGender());
						out.print(uvo.getUserNick());
						out.print(uvo.getUserRegion());
						out.print(uvo.getJoinedAt());
						out.print(uvo.getUserHeight());
						out.print(uvo.getUserWeight());
						out.print(uvo.getUserProfileImg());
						out.print(uvo.getUserProfileInfo());
						%>
						<button type="button" class="btn btn-primary" id="btn-logout">로그아웃</button>
					</c:if>

				</li>
			</ul>
		</div>
	</header>

	<div id="container-notification"></div>

	<!-- 메인부분(토글버튼, 게시글 카드) -->
	<main>
		<div class="album bg-tertiary"></div>
		<div class="container">
			<!-- 토글 버튼 -->
			<p class="d-flex justify-content-center">
				<button type="button" class="btn btn-primary"
					data-bs-toggle="button">최신</button>
			</p>
			<!-- 게시글 카드 -->

			<div>
				<div id="ajaxcontainer"
					class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3"></div>
				<!-- ajax게시판바로불러ㅓ오기 -->
			</div>

		</div>
		</div>
	</main>

	<!-- 모달창 -->
	<div id="modal">
		<div id="modal-body">

			<div id="join-wrap" align="center">
				<main class="form-signin w-100 m-auto">


					<form action="Login.do" method="post">
						<h1 class="fw-bold mb-0 fs-2">로그인</h1>
						<br>

						<div class="form-floating">
							<input type="text" class="form-control" name="email_id"
								placeholder="id"> <label for="floatingInput">아이디</label>
						</div>
						<div class="form-floating">
							<input type="text" class="form-control" name="email_pw"
								placeholder="Password"> <label for="floatingPassword">비밀번호</label>
						</div>
						<!-- <div class="form-check text-start my-3">
            <input class="form-check-input" type="checkbox" value="remember-me" id="flexCheckDefault">
            <label class="form-check-label" for="flexCheckDefault">
              Remember me
            </label>
          </div> -->

						<c:if test="${member==null}">
							<button class="btn btn-primary w-100 py-2" type="submit">로그인</button>
						</c:if>

					</form>

					<hr class="my-4">
					<h2 class="fs-5 fw-bold mb-3">SNS 계정으로 로그인</h2>
					<button class="w-100 py-2 mb-2 btn btn-outline-secondary rounded-3"
						type="submit">Google 계정으로 로그인</button>


				</main>

			</div>
		</div>

	</div>
	<!-- 여기까지 모달 -->


	<!-- Modal -->
	<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static"
		data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="staticBackdropLabel">Modal
						title</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">...</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary">Understood</button>
				</div>
			</div>
		</div>
	</div>




	<p id="ajaxtext">고고슁</p>
	<a href="select">게시판</a>
	</main>


	<script src="././assets/js/login.js"></script>
	<script src="././assets/js/logout.js"></script>
	<script src="././assets/js/notification.js"></script>
	<script src="././assets/js/weatherwidget.js"></script>
	<script src="././assets/js/postview.js"></script>

</body>
</html>