<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>


</head>
<body>

	

	<form action="Login.do" method="post">

		<li><input type="text" name="email_id" placeholder="아이디 입력"></li>
		<li><input type="text" name="email_pw" placeholder="비밀번호 입력"></li>
		<li><input type="submit" value="LogIn" class="button fit"></li>
	</form>

	<form action="Join.do" method="post">

		<li><input type="text" name="userId" placeholder="아이디"></li>
		<li><input type="password" name="userPw" placeholder="PW"></li>
		<li><input type="text" name="userName" placeholder="아룸"></li>
		<li><input type="text" name="userNick" placeholder="닉네임"></li>

		<li><label>성별</label> <select name="userGender">
				<option>1</option>
				<option>0</option>
		</select></li>

		<li><input type="text" name="userRegion" placeholder="지역"></li>
		<li><input type="text" name="userWeight" placeholder="몸무게"></li>
		<li><input type="text" name="userHeight" placeholder="키"></li>
		<li><input type="submit" value="JoinUs" class="button fit"></li>
	</form>

	<h1>로그인 완료 회원 : ${member.userId}님 환영</h1>


	
	<c:if test="${member != null}">
		
		<form action="Update.do" method="post">
			<li><input type="password" name="userPw" placeholder="PW" ></li>
			<li><input type="text" name="userNick" placeholder="닉네임"></li>
			<li><input type="text" name="userRegion" placeholder="지역"></li>
			<li><input type="text" name="userWeight" placeholder="몸무게"></li>
			<li><input type="text" name="userHeight" placeholder="키"></li>
			<li><input type="text" name="userProfileImg" placeholder="프로필사진 수정"></li>
			<li><input type="text" name="userProfileInfo" placeholder="프로필 소개 수정"></li>
			<li><input type="submit" value="update" class="button fit"></li>
		</form>
		<a href="Logout.do">로그아웃</a>
		
		
		
		<form action="Post.do" method="post">
			<label>게시글 내용</label><input type="text" name="postContent">
			<label>해시 태그</label> <input type="text" name="hashTag">
			<input type="submit" value="글작성">
		</form>
		
		<form action="TestGo.do" method="post">
			<button type="submit">게시판으로가자</button>
		</form>
	</c:if>






</body>
</html>