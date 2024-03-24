<%@page import="com.smhrd.controller.GetPost"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>main</title>

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

<link rel="stylesheet" href="././assets/css/update.css">
<link rel="stylesheet" href="././assets/css/login.css">
<link rel="stylesheet" href="././assets/css/join.css">
<link rel="stylesheet" href="././assets/css/modal.css">
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
				<!-- (수정) 수정버튼 임시로 추가 -->
				<li>
					<button type="button" class="btn btn-primary" id="btn-update" href="goupdate.do">정보수정</button>
				</li>
				<li>
					<!-- 세션이 null이 아니라면 프로필로 바뀌게하면 됨! --> 
					<c:if test="${member==null}">
						<button type="button" class="btn btn-primary" id="btn-login">로그인</button>
					</c:if> 
					<c:if test="${member!=null}">
						<button type="button" class="btn btn-primary" id="btn-logout">로그아웃</button>
					</c:if>

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
	</main>


	<!-- 모달창 -->
	<div id="modal">
		<div id="modal-body-login">
			<!-- 로그인 모달창 -->
			<div id="login-wrap" align="center">
				<main class="form-signin">
					<form action="Login.do" method="post" class="validation-form"
						novalidate>
						<h4 class="fw-bold mb-0 fs-2 text-center w-100">로그인</h4>
						<button type="button" class="btn-close align-self-start"
							data-bs-dismiss="modal" aria-label="Close"></button>

						<div class="form-floating">
							<input type="text" class="form-control" id="floatingInput"
								placeholder="id" required> <label for="floatingInput">아이디</label>
							<div class="invalid-feedback">아이디를 입력해주세요.</div>
						</div>
						<div class="form-floating">
							<input type="password" class="form-control" id="floatingPassword"
								placeholder="Password" required> <label
								for="floatingPassword">비밀번호</label>
							<div class="invalid-feedback">비밀번호를 입력해주세요.</div>
						</div>
						<div class="form-check text-start my-3">
							<input class="form-check-input" type="checkbox"
								value="remember-me" id="flexCheckDefault"> <label
								class="form-check-label" for="flexCheckDefault">
								Remember me </label>
						</div>
						<div class="mb-4"></div>
						<c:if test="${member==null}">
							<button class="btn btn-primary w-100 py-2" type="submit">로그인</button>
						</c:if>
					</form>
					<div id="div-jointxt">회원가입</div>
					<hr class="my-4">
					<h2 class="fs-5 fw-bold mb-3">SNS 계정으로 로그인</h2>
					<button class="w-100 py-2 mb-2 btn btn-outline-secondary rounded-3"
						type="submit">Google 계정으로 로그인</button>
				</main>
			</div>
		</div>
		<!-- 여기까지 로그인 모달창 -->

		<!-- 회원가입 모달창 -->
		<div id="modal-body-join" class="modal-body">

			<div class="input-form mx-auto" id="form-join-input">
				<h4 class="fw-bold mb-0 fs-2" align="center">회원가입</h4>
				<br>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>

				<form action="#" method="post" class="validation-form" novalidate>
					<div class="row">
						<div class="mb-3">
							<label for="id">아이디</label> <input type="text"
								class="form-control" id="id" placeholder="" value="" required>
							<div class="invalid-feedback">아이디를 입력해주세요.</div>
						</div>

						<div class="col-md-6 mb-3">
							<label for="password">비밀번호</label> <input type="password"
								class="form-control" id="password" placeholder="" value=""
								required>
							<div class="invalid-feedback">비밀번호를 입력해주세요.</div>
						</div>
						<div class="col-md-6 mb-3">
							<label for="password2">비밀번호 확인</label> <input type="password"
								class="form-control" id="password2" placeholder="" value=""
								required>
							<div class="invalid-feedback">비밀번호를 확인해주세요.</div>
						</div>


						<div id="div-hr">
							<hr class="mb-4">
						</div>
						<div class="col-md-6 mb-3">
							<label for="nickname">닉네임</label> <input type="text"
								class="form-control" id="nickname" placeholder="" value=""
								required>
							<div class="invalid-feedback">닉네임을 입력해주세요.</div>
						</div>
						<div class="col-md-6 mb-3">
							<label for="gender">성별</label>
							<div class="d-flex align-items-center">
								<div class="form-check mr-3">
									<label class="form-check-label" for="man">남</label> <input
										class="form-check-input" type="radio" name="gender" id="man"
										value="0" required>
								</div>
								&nbsp;&nbsp;&nbsp;
								<div class="form-check">
									<label class="form-check-label" for="woman">여</label> <input
										class="form-check-input" type="radio" name="gender" id="woman"
										value="1" required>
								</div>
							</div>
						</div>


						<div class="mb-3">
							<label for="address">주소</label> <input type="text"
								class="form-control" id="address" placeholder="서울특별시 강남구"
								required>
							<div class="invalid-feedback">주소를 입력해주세요.</div>
						</div>

						<div class="col-md-6 mb-3">
							<label for="height">키</label> <input type="text"
								class="form-control" id="height" placeholder="cm" value=""
								required>
							<div class="invalid-feedback">키를 입력해주세요.</div>
						</div>
						<div class="col-md-6 mb-3">
							<label for="weight">몸무게</label> <input type="password"
								class="form-control" id="weight" placeholder="kg" value=""
								required>
							<div class="invalid-feedback">몸무게를 입력해주세요.</div>
						</div>

					</div>
					<hr class="mb-4">
					<div class="custom-control custom-checkbox" id="div-agreement">
						<input type="checkbox" class="custom-control-input" id="agreement"
							required> <label class="custom-control-label"
							for="agreement">개인정보 수집 및 이용에 동의합니다.</label>
					</div>
					<div class="mb-4"></div>
					<br>
					<div align="center">
						<button class="btn btn-primary w-100 py-2" type="submit">가입하기</button>
					</div>
				</form>
			</div>

		</div>

		<!-- 여기까지 회원가입 모달창 -->

	</div>
	<!-- 여기까지 모달 -->
	<div class="row">
		<div class="modal" id="contentmodal" tabindex="-1">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						모달 헤더입니다
						<button class="close" data-dismiss="modal">&times;</button>
					</div>
					<div class="modal-body" style="text-align:center;">
						모달보디입니다
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
	
	

	<script src="././assets/js/postdetail.js"></script>
	<script src="././assets/js/update.js"></script>
	<script src="././assets/js/login.js"></script>
	<script src="././assets/js/join.js"></script>
	<script src="././assets/js/notification.js"></script>
	<script src="././assets/js/weatherwidget.js"></script>
	<script src="././assets/js/postview.js?ver=<%=System.currentTimeMillis()%>"></script>

</body>
</html>