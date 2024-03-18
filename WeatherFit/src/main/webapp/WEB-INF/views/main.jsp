<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<form action="Login.do" method="post">
		<li><input type="text" name="email" placeholder="Email을 입력하세요"></li>
		<li><input type="password" name="pw" placeholder="PW를 입력하세요"></li>
		<li><input type="submit" value="LogIn" class="button fit"></li>
	</form>

	<form action="Join.do" method="post">
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