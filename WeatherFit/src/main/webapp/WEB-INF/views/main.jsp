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
		<li><input type="text" name="email_user" placeholder="Email을 입력하세요"></li>
		<li><input type="text" name="email_pw" placeholder="PW를 입력하세요"></li>
		<li><input type="submit" value="LogIn" class="button fit"></li>
	</form>

	<form action="Join.do" method="post">
		<li><input type="text" name="userId" placeholder="Email을 입력하세요"></li>
		<li><input type="password" name="userPw" placeholder="PW를 입력하세요"></li>
		<li><input type="text" name="userName" placeholder="전화번호를 입력하세요"></li>
		<li><input type="text" name="userNick" placeholder="닉네임을 입력하세요"></li>
		
		<li>
			<label>성별을 입력하세요</label>
				<select name = "userGender">
					<option>1</option>
					<option>0</option>
				</select>
		</li>
		
		<li><input type="text" name="userRegion" placeholder="집주소를 입력하세요"></li>
		<li><input type="text" name="userWeight" placeholder="몸무게를 입력하세요"></li>
		<li><input type="text" name="userHeight" placeholder="키를 입력하세요"></li>
		<li><input type="submit" value="JoinUs" class="button fit"></li>
	</form>
	
	
	
	
	
	<form action="Post.do" method="post">
		postContent <input type = "text" name = "postContent">
		hashTag <input type="text" name = "hashTag">
		<input type = "submit" value = "전달확인용">
	</form>
	
	<h1>
	ㅎ2세션
	세션 : ${member.userId}님 환영합니다
	</h1>
	
	
	
	

</body>
</html>