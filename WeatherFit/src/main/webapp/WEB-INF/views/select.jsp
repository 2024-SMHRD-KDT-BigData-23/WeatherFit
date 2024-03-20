<%@page import="java.util.ArrayList"%>
<%@page import="com.smhrd.model.PostVO"%>
<%@page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	List<PostVO> resultList = (ArrayList) request.getAttribute("list");
	%>
	<table>
		<caption>
			<h2>회원관리페이지</h2>
		</caption>
		<tr>
			<td>id</td>
			<td>내용</td>
			<td>해시태그</td>
		</tr>

		<c:forEach items="${list}" var="pvo">
							<tr>
								<td>${pvo.userId}</td>
								<td>${pvo.postContent}</td>
								<td>${pvo.hashTag}</td>							
							</tr>
							</c:forEach>

		<!-- 2.모든 회원의 이메일(email),전화번호(tel),주소(address)를 출력하시오. 
								   조건 >> JSTL/EL 사용하기
							-->




	</table>

	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/jquery.scrolly.min.js"></script>
	<script src="assets/js/jquery.scrollex.min.js"></script>
	<script src="assets/js/skel.min.js"></script>
	<script src="assets/js/util.js"></script>
	<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
	<script src="assets/js/main.js"></script>




</body>
</html>