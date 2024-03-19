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

		<li><input type="text" name="email_user" placeholder="Email 占싸승紐"></li>
		<li><input type="text" name="email_pw" placeholder="PW 占싸승紐"></li>
		<li><input type="submit" value="LogIn" class="button fit"></li>
	</form>

	<form action="Join.do" method="post">

		<li><input type="text" name="userId" placeholder="Email 占싸승紐"></li>
		<li><input type="password" name="userPw" placeholder="PW 占싸승紐"></li>
		<li><input type="text" name="userName" placeholder="占승甕걔紐占 占싸승紐"></li>
		<li><input type="text" name="userNick" placeholder="셋 占싸승紐"></li>
		
		<li>
			<label>源 占싸승紐</label>
				<select name = "userGender">
					<option>1</option>
					<option>0</option>
				</select>
		</li>
		
		<li><input type="text" name="userRegion" placeholder="筌雅굿 占싸승紐"></li>
		<li><input type="text" name="userWeight" placeholder="筌紐龜野 占싸승紐"></li>
		<li><input type="text" name="userHeight" placeholder="삼옙 占싸승紐"></li>
		<li><input type="submit" value="JoinUs" class="button fit"></li>
	</form>
	
	
	
	
	
	<form action="Post.do" method="post">
		postContent <input type = "text" name = "postContent">
		hashTag <input type="text" name = "hashTag">
		<input type = "submit" value = "占승紐">
	</form>
	
	<h1>
	2紐
	紐 : ${member.userId} 맞
	</h1>
	
	
	
	

		<li><input type="text" name="userId" placeholder="Email �ν몄"></li>
		<li><input type="password" name="userPw" placeholder="PW瑜 �ν몄"></li>
		<li><input type="text" name="userName" placeholder="�踰몃� �ν몄"></li>
		<li><input type="text" name="userNick" placeholder="�踰몃� �ν몄"></li>
		<li><input type="text" name="userGender" placeholder="吏二쇱瑜 �ν몄"></li>
		<li><input type="text" name="userRegion" placeholder="吏二쇱瑜 �ν몄"></li>
		<li><input type="text" name="userWeight" placeholder="吏二쇱瑜 �ν몄"></li>
		<li><input type="text" name="userHeight" placeholder="吏二쇱瑜 �ν몄"></li>
		<li><input type="submit" value="JoinUs" class="button fit"></li>
	</form>



</body>
</html>