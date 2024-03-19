
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

		<li><input type="text" name="email_user" placeholder="Email �ν몄"></li>
		<li><input type="text" name="email_pw" placeholder="PW瑜 �ν몄"></li>
		<li><input type="submit" value="LogIn" class="button fit"></li>
	</form>

	<form action="Join.do" method="post">

		<li><input type="text" name="userId" placeholder="Email �ν몄"></li>
		<li><input type="password" name="userPw" placeholder="PW瑜 �ν몄"></li>
		<li><input type="text" name="userName" placeholder="�踰몃� �ν몄"></li>
		<li><input type="text" name="userNick" placeholder="ㅼ �ν몄"></li>
		
		<li>
			<label>깅 �ν몄</label>
				<select name = "userGender">
					<option>1</option>
					<option>0</option>
				</select>
		</li>
		
		<li><input type="text" name="userRegion" placeholder="吏二쇱瑜 �ν몄"></li>
		<li><input type="text" name="userWeight" placeholder="紐몃Т寃瑜 �ν몄"></li>
		<li><input type="text" name="userHeight" placeholder="ㅻ� �ν몄"></li>
		<li><input type="submit" value="JoinUs" class="button fit"></li>
	</form>
	
	
	
	
	
	<form action="Post.do" method="post">
		postContent <input type = "text" name = "postContent">
		hashTag <input type="text" name = "hashTag">
		<input type = "submit" value = "�ы몄">
	</form>
	
	<h1>
	2몄
	몄 : ${member.userId} ⑸
	</h1>
	
	
	
	

		<li><input type="text" name="userId" placeholder="Email을 입력하세요"></li>
		<li><input type="password" name="userPw" placeholder="PW를 입력하세요"></li>
		<li><input type="text" name="userName" placeholder="전화번호를 입력하세요"></li>
		<li><input type="text" name="userNick" placeholder="전화번호를 입력하세요"></li>
		<li><input type="text" name="userGender" placeholder="집주소를 입력하세요"></li>
		<li><input type="text" name="userRegion" placeholder="집주소를 입력하세요"></li>
		<li><input type="text" name="userWeight" placeholder="집주소를 입력하세요"></li>
		<li><input type="text" name="userHeight" placeholder="집주소를 입력하세요"></li>
		<li><input type="submit" value="JoinUs" class="button fit"></li>
	</form>


</body>
</html>