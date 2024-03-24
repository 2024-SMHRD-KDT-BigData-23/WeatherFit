<%@page import="com.smhrd.controller.GetPost"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>게시글확인</title>

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
<link rel="stylesheet" href="././assets/css/modal.css">
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
					<button type="button" class="btn btn-primary" id="btn-update"
						href="#">정보수정</button>
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

		<!-- 게시글 확인 페이지 -->
		<!-- Page content-->
		<div class="container mt-5" id="container-post">
			<div class="row">
				<div class="col-lg-4">
					<!-- Post content-->
					<article>
						<!-- Post header-->
						<header id="header-id" class="mb-4">
							<!-- Post title-->
							<div class="flex-shrink-0 d-flex mb-1 align-items-center">
								<img id="img-profile" class="rounded-circle"
									src="https://mblogthumb-phinf.pstatic.net/MjAyMjA3MTVfMTUz/MDAxNjU3ODkzNDE1MzU4.JO8gT9XAe5JIb-OKM5Y-_Iz5VdDYfhuHrQ6JtKKTSBQg.QVI_F5CCDt3XTa9CwHCkmtPD6J33bWn_u_iXzWkacysg.JPEG.ksej02/IMG_6411.JPG?type=w800"
									alt="..." />&nbsp;&nbsp;
								<h4 class="fw-bolder mb-1 mr-3">woooodong</h4>
								<div id="message-wrap">
									<svg id="message" xmlns="http://www.w3.org/2000/svg"
										viewBox="0 0 512 512">
										<!--!Font Awesome Free 6.5.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.-->
                    					<path
											d="M64 112c-8.8 0-16 7.2-16 16v22.1L220.5 291.7c20.7 17 50.4 17 71.1 0L464 150.1V128c0-8.8-7.2-16-16-16H64zM48 212.2V384c0 8.8 7.2 16 16 16H448c8.8 0 16-7.2 16-16V212.2L322 328.8c-38.4 31.5-93.7 31.5-132 0L48 212.2zM0 128C0 92.7 28.7 64 64 64H448c35.3 0 64 28.7 64 64V384c0 35.3-28.7 64-64 64H64c-35.3 0-64-28.7-64-64V128z" />
                  					</svg>
								</div>
							</div>
							<!-- Post categories-->
							<a class="badge bg-secondary text-decoration-none link-light"
								href="#!">이달의 패션왕</a> <a
								class="badge bg-secondary text-decoration-none link-light"
								href="#!">인기짱</a>
						</header>
						<!-- Preview image figure-->
						<figure class="mb-4 justify-content-center">
							<img id="img-post" class="img-fluid rounded"
								src="https://dummyimage.com/900x400/ced4da/6c757d.jpg" alt="..." />
						</figure>
					</article>
				</div>
				<div class="col-lg-4 justify-content-center">
					<section class="col-md-10 mt-5">
						<div id="post-txt">
							난 ㄱㅏ끔 ⓡⓔⓓ를 입는ㄷr..<br> <br> レΓ는 심㉨よ0l 없♥ㅓ · · <br>
							ュ㈃ŇΛ┤ · · ⌽r픈 girl 느낄己i 無o┤ · ·. <br> ■■■■■■■■■□ 패션충전 90%
						</div>
						<div id="post-hashtag">#오늘날씨 #미쳤다 #이게나 #OOTD #선팔맞팔</div>
						<div id="like">
							<!-- <i class="fa-regular fa-heart" id="like-heart"></i>   -->
							<svg id="like-heart" xmlns="http://www.w3.org/2000/svg"
								viewBox="0 0 512 512">
								<!--!Font Awesome Free 6.5.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.-->
                				<path
									d="M47.6 300.4L228.3 469.1c7.5 7 17.4 10.9 27.7 10.9s20.2-3.9 27.7-10.9L464.4 300.4c30.4-28.3 47.6-68 47.6-109.5v-5.8c0-69.9-50.5-129.5-119.4-141C347 36.5 300.6 51.4 268 84L256 96 244 84c-32.6-32.6-79-47.5-124.6-39.9C50.5 55.6 0 115.2 0 185.1v5.8c0 41.5 17.2 81.2 47.6 109.5z" />
             				 </svg>
							dongzu, yeon님이 좋아합니다.
						</div>
					</section>


					<!-- 댓글섹션 -->
					<section class="col-md-10 mt-4">
						<div class="card bg-light">
							<div class="card-body">
								<!-- 댓글 글씨들..  -->
								<!-- Comment with nested comments-->
								<div class="d-flex mb-4">
									<!-- Parent comment-->
									<div class="flex-shrink-0">
										<img id="img-profile" class="rounded-circle"
											src="https://dummyimage.com/50x50/ced4da/6c757d.jpg"
											alt="..." />
									</div>
									<div class="ms-3">
										<div class="fw-bold">dongzu</div>
										패션 어렵다...
										<!-- Child comment 1-->
										<div class="d-flex mt-2">
											<div class="flex-shrink-0">
												<img id="img-profile" class="rounded-circle"
													src="https://dummyimage.com/50x50/ced4da/6c757d.jpg"
													alt="..." />
											</div>
											<div class="ms-3">
												<div class="fw-bold">yeon</div>
												never give up!
											</div>
										</div>
										<!-- Child comment 2-->
										<div class="d-flex mt-2">
											<div class="flex-shrink-0">
												<img id="img-profile" class="rounded-circle"
													src="https://dummyimage.com/50x50/ced4da/6c757d.jpg"
													alt="..." />
											</div>
											<div class="ms-3">
												<div class="fw-bold">heessoso</div>
												화이팅팅!!
											</div>
										</div>
									</div>
								</div>
								<!-- 댓글 작성창-->
								<form action="#" method="post" class="mb-4" id="comment-form">
									<textarea class="form-control" rows="2"
										placeholder="댓글을 남겨주세요.">
                  					</textarea>
									<div class="row justify-content-center">
										<button type="submit" class="btn btn-primary mt-3"
											id="btn-submit">댓글 등록</button>
									</div>
								</form>
							</div>
						</div>
					</section>
				</div>
			</div>
		</div>
	</main>


	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>
	

	<script src="././assets/js/postdetail.js"></script>

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