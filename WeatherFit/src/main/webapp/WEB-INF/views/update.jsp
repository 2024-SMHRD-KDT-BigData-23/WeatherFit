<%@page import="com.smhrd.controller.GetPost"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>update</title>

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



<link rel="stylesheet" href="././assets/css/modal.css">
<link rel="stylesheet" href="././assets/css/update.css">
<link rel="stylesheet" href="././assets/css/login.css">
<link rel="stylesheet" href="././assets/css/join.css">
<link rel="stylesheet" href="././assets/css/postdetail.css">


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
				<li class="nav-item"><a class="nav-link" href="gomessage.do">메시지</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="#">알림</a></li>
				<!-- (수정) 수정버튼 임시로 추가 -->
				<li>
					<!-- 링크수정하기 -->
					<button type="button" class="btn btn-primary"
						id="btn-update" href="#">정보수정</button>
				</li>
				<li>
					<!-- 세션이 null이 아니라면 프로필로 바뀌게하면 됨! --> <c:if test="${member==null}">
						<button type="button" class="btn btn-primary" id="btn-login">로그인</button>
					</c:if> <c:if test="${member!=null}">
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


			<!-- 모달창 -->
			<div id="modal">


				<!-- 회원정보수정 모달창 -->

				<div id="modal-body-update" class="modal-body">
					<div class="input-form mx-auto" id="form-update-input">
						<div
							class="d-flex justify-content-between align-items-center mb-3">
							<h4 class="fw-bold mb-0 fs-2 text-center w-100">회원 정보 수정</h4>
							<button type="button" class="btn-close" align-self-start"
								data-bs-dismiss="modal" aria-label="Close"></button>
						</div>
						<br>

						<form action="#" method="post" class="validation-form" novalidate>
							<div class="mb-3">
								<label for="name">현재 비밀번호</label> <input type="password"
									class="form-control" id="password" placeholder="" value=""
									required>
								<div class="invalid-feedback">비밀번호를 입력해주세요.</div>
							</div>
							<div class="mb-3">
								<label for="name">새 비밀번호</label> <input type="password"
									class="form-control" id="password" placeholder="" value="">
							</div>
							<div class="mb-3">
								<label for="name">새 비밀번호 확인</label> <input type="password"
									class="form-control" id="password" placeholder="" value="">
							</div>

							<hr class="mb-4">

							<div class="mb-3">
								<label for="nickname">닉네임</label> <input type="text"
									class="form-control" id="nickname" placeholder="" value="">
								<div class="invalid-feedback">닉네임을 입력해주세요.</div>
							</div>
							<div class="mb-3">
								<label for="address">주소</label> <input type="text"
									class="form-control" id="address" placeholder="서울특별시 강남구">
								<div class="invalid-feedback">주소를 입력해주세요.</div>
							</div>
							<div class="row">
								<div class="col-md-6 mb-3">
									<label for="height">키</label> <input type="text"
										class="form-control" id="height" placeholder="cm" value="">
								</div>
								<div class="col-md-6 mb-3">
									<label for="weight">몸무게</label> <input type="password"
										class="form-control" id="weight" placeholder="kg" value="">
								</div>
							</div>


							<div class="mb-4"></div>
							<div align="center">
								<button class="btn btn-primary w-100 py-2" type="submit">수정하기</button>
							</div>
						</form>
					</div>

				</div>


				<!-- 여기까지 회원정보수정 모달창 -->

			</div>
			<!-- 여기까지 모달 -->

		</div>
	</main>




	<script src="././assets/js/update.js"></script>

	<script src="././assets/js/login.js"></script>
	<script src="././assets/js/join.js"></script>
	<script src="././assets/js/logout.js"></script>
	<script src="././assets/js/notification.js"></script>
	<script src="././assets/js/weatherwidget.js"></script>
	<script src="././assets/js/postview.js"></script>
	<script src="././assets/js/validate.js"></script>

</body>
</html>