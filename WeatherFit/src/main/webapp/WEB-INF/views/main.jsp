<%@page import="com.smhrd.model.UserVO" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<%
		// 1. session 영역 안에 저장된 데이터 꺼내오기
		UserVO mvo = (UserVO)session.getAttribute("member");
	%>





	<!-- Header -->
	<header id="header" class="alt">
		<a href="index.html" class="logo"><strong>Forty</strong> <span>by
				HTML5 UP</span></a>
		<nav>
			<c:if test="${member != null }">

				<c:if test="${member.userId == 'admin'}">
					<a href="SelectAll.do">회원관리</a>
				</c:if>

				<c:if test="${member.userId != 'admin'}">
					<a href="goupdate.do">개인정보수정</a>
				</c:if>


				<a href="Logout.do">로그아웃</a>


			</c:if>
			<c:if test="${member == null }">
				<a href="#menu">로그인</a>
			</c:if>

		</nav>
	</header>

	<!-- Menu -->
	<nav id="menu">
		<ul class="links">
			<li><h5>로그인</h5></li>
			<form action="Login.do" method="post">
				<li><input type="text" name="email" placeholder="Email을 입력하세요"></li>
				<li><input type="password" name="pw" placeholder="PW를 입력하세요"></li>
				<li><input type="submit" value="LogIn" class="button fit"></li>
			</form>
		</ul>
		<ul class="actions vertical">
			<li><h5>회원가입</h5></li>
			<!-- 전송해야하는 데이터에 name값을 달아줄 때, DB table의 column명과 일치시키는 습관을 들이자! -->
			<form action="Join.do" method="post">
				<li><input type="text" name="userId" placeholder="Email을 입력하세요"></li>
				<li><input type="password" name="userPw"
					placeholder="PW를 입력하세요"></li>
				<li><input type="text" name="userName"
					placeholder="이름을 입력하세요"></li>
				<li><input type="text" name="userNick"
					placeholder="닉네임을 입력하세요"></li>
				<li><input type="text" name="userGender"
					placeholder="성별을 입력하세요"></li>
				<li><input type="text" name="userRegion"
					placeholder="사는 지역을 입력하세요"></li>
				<li><input type="text" name="userWeight"
					placeholder="몸무게를 입력하세요"></li>
				<li><input type="text" name="userHeight"
					placeholder="키를 입력하세요"></li>
				<li><input type="submit" value="JoinUs" class="button fit"></li>
			</form>
		</ul>
	</nav>
	<!-- Banner -->
	<section id="banner" class="major">
		<div class="inner">
			<header class="major">
				<%
				if (mvo != null) {
				%>
				<h1><%=mvo.getUserNick()%>님 환영합니다.
				</h1>
				<%
				} else {
				%>
				<h1>로그인 해주세요.</h1>
				<%
				}
				%>
			</header>
			<div class="content">
				<p>
					아래는 지금까지 배운 웹 기술들입니다.<br>
				</p>
				<ul class="actions">
					<li><a href="#one" class="button next scrolly">확인하기</a></li>
				</ul>
			</div>
		</div>
	</section>



</body>
</html>