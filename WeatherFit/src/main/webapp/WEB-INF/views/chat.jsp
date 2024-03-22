<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
	//	소켓 연결을 위해 websocket 객체를 만든다.	 서블릿의 형태로 접속을 한다.
	var websocket = new WebSocket("ws://localhost:8080/wsocket");
	
	var line = 0;
	
	//	아래는 웹 소켓에서 사용하는 4가지 이벤트들이다.
	websocket.onopen = function(message){
		document.getElementById("state").innerHTML = "소켓 시작"; 
	}
	websocket.onclose = function(message){}
	websocket.onerror = function(message){}
	//	onmessage는 외부에서 들어온 데이터를 받아서 처리를 하는 이벤트이다.
	websocket.onmessage = function(message)
	{
		//	메시지가 20개이면, 채팅창의 내용을 지운다.
		if (++line % 20 == 0){
			line = 0;
			document.getElementById("chat").value = "";
		}
		
		document.getElementById("chat").value = 
			document.getElementById("chat").value + "\n" +message.data;
	}
	
	function sendmessage()
	{
		//	메시지 박스에 있는 데이터를 전송한다.
		msg = "[${sessionScope.id}]" + document.getElementById("send").value;
		websocket.send(msg);
		
		//	메시지를 보내고, 메시지 입력 부분을 지워준다. 
		document.getElementById("send").value = "";
		/*
		//	나의 메시지
		document.getElementById("chat").value = 
			document.getElementById("chat").value + "\n"+msg; 
		*/
	}
	
	//	엔터키가 눌리면, 메시지를 전송하는 함수
	function keypress()
	{
		var keycode = event.keyCode;
		
		if (keycode == 13)
			sendmessage();
	}
	
</script>

<!-- 로그인이 되어 있어야 사용 가능 -->
<c:if test="${empty member.userId}">
<jsp:forward page="login.do"></jsp:forward>
</c:if>
[${sessionScope.id}]<input id=send type=text size=30>
<input type=button value="전송" id="button" onclick=sendmessage()>

<p></p>
<div style="width:100%;height:50%" >
	<textarea id=chat readonly cols=100 rows=25>
	
	</textarea>
</div>