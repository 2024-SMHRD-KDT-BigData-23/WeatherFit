<%@page import="com.smhrd.database.DAO"%>
<%@page import="com.smhrd.model.FollowingVO"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.model.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>WeatherFit</title>


<!-- 부트스트랩, 제이쿼리, 폰트어썸 -->
<%@ include file="includeHeaders.jsp"%>
<link rel="stylesheet" href="assets/css/profile.css">

</head>
<body>
	<!-- 날씨 위젯과 상단 네비 분리 -->

	<%@ include file="includeNavi.jsp"%>

	<%
	UserVO mvo = (UserVO) session.getAttribute("member");
	UserVO uvo = (UserVO) session.getAttribute("userProfileInfo");
	FollowingVO flvo = (FollowingVO) session.getAttribute("followingCheck");
	%>

	<main>
		<div id="profilepost-wrap">
			<div class="container">
				<div class="row">
					<div class="d-flex justify-content-center align-items-center mt-4 mb-4">
						<!-- 프로필 사진 -->
						<%
						if (uvo.getUserProfileImg() == null) {
							out.print("<img class='img-profile rounded-circle' src='assets/images/user_profile/base_profile.png' alt='기본프로필'>");
						} else {
							out.print("<img class='img-profile rounded-circle' src='assets/images/user_profile/'>");
						}
						%>
						<title>프로필사진</title>
						<rect width="250px" height="250px"
							fill="var(--bs-secondary-color)" />
						</svg>

						<div id="nick-follow" class="d-flex flex-column ml-5">
							<div class="d-flex align-items-center">
								<!-- 닉네임 -->
								<h3 class="fw-bold" id="nickname">
									<%
									if (uvo.getUserNick() == null) {
										out.print(uvo.getUserId());
									} else {
										out.print(uvo.getUserNick());
									}
									%>
								</h3>
								<p>
								<%
									if(mvo.getUserId().equals(uvo.getUserId())) {
										// 편집버튼
										out.print("<a class='btn-blue' id='btn-edit' href='#'>편집</a>");
									} else {
										// 팔로우버튼
										if(flvo == null) {
											out.print("<a class='btn-blue' id='btn-follow' href='InsertFollowing.do?follower=" + mvo.getUserId() + "&followee= " + uvo.getUserId() + "'>팔로우</a>");
										} else {
											out.print("<a class='btn-blue' id='btn-follow' href='DeleteFollowing.do?follower=" + mvo.getUserId() + "&followee= " + uvo.getUserId() + "'>팔로우 취소</a>");
										}
									}
								%>
								</p>
							</div>
							<!-- 프로필소개 -->
							<p id="profiletext">
								<%
								if (uvo.getUserProfileInfo() == null) {
									out.print("프로필 소개를 작성해주세요");
								} else {
									out.print(uvo.getUserProfileInfo());
								}
								%>
							</p>
						</div>
					</div>
				</div>
			</div>

			<hr class="line">
			<div class="d-flex justify-content-center">
				<div class="btn-photo btn-group align-items-center" role="group"
					aria-label="Basic radio toggle button group">
					<input type="radio" class="btn-check" name="btnradio"
						id="btnradio1" autocomplete="off" checked> <label
						id="profilepost-icon1" class="btn-photo" for="btnradio1">📸</label>
					<input type="radio" class="btn-check" name="btnradio"
						id="btnradio3" autocomplete="off"> <label
						id="profilepost-icon2" class="btn-photo" for="btnradio3">🗂</label>
				</div>
			</div>
			<hr class="line" id="line2">
			<div>
				<div id="ajaxcontainer"
					class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3"></div>
				<!-- ajax게시판바로불러오기 -->
			</div>
		</div>
	</main>

	<script src="assets/js/profile.js"></script>

</body>
</html>