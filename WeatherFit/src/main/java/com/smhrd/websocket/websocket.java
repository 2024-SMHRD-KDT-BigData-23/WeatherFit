package com.smhrd.websocket;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.smhrd.database.DAO;
import com.smhrd.model.ChatVO;
// import com.fasterxml.jackson.databind.ObjectMapper;

@ServerEndpoint("/websocket")
public class websocket {

    static List<Session> sessionList = Collections.synchronizedList(new ArrayList<>());

    // 웹 소켓 연결시 호출
    @OnOpen
    public void handleOpen(Session userSession) {
        System.out.println("웹 소켓 연결");
        sessionList.add(userSession); // 웹 소켓 연결시 세션리스트에 추가
        
        DAO dao = new DAO();
        List<ChatVO> cvoList = dao.receiveChat(1);
        Gson gson = new Gson();
        String json = gson.toJson(cvoList);
        for(Session session : sessionList) {
        	try {
				session.getBasicRemote().sendText(json);
			} catch (IOException e) {
				System.out.println("메시지 전송 중 오류 발생 : " + e.getMessage());
				e.printStackTrace();
			}
        }
    }

    // 웹소켓 메시지 수신시 호출
    @OnMessage
    public void handleMessage(String message, Session userSession) {
        System.out.println("수신 된 메시지 : " + message);
        // 메시지 처리 로직 구현
        Gson gson = new Gson();
        JsonObject json = gson.fromJson(message, JsonObject.class);
//        System.out.println(json.get("type").getAsString());
//        System.out.println(json.get("value").getAsString());
//        System.out.println(json.get("seq").getAsString());
        String sendMessage = json.get("value").getAsString();
        ChatVO cvo = new ChatVO();
        cvo.setChatIdx(2); // chatIdx
        cvo.setRoomIdx(1); // roomIdx
        cvo.setChatter("YeonDoIt"); // chatter
        cvo.setChat(sendMessage); // chat
        DAO dao = new DAO();
        int row = dao.sendChat(cvo);
        if(row > 0) {
        	System.out.println("보낸 메세지 저장 성공!");
        } else {
        	System.out.println("보낸 메세지 저장 실패..");
        }
    }

    // 웹소켓 연결 종료시 호출
    @OnClose
    public void handleClose(Session userSession) {
        sessionList.remove(userSession);
        System.out.println("웹 소켓 연결 종료");
    }

    // 웹소켓 에러 발생시 호출
    @OnError
    public void handleError(Throwable t) {
        t.printStackTrace();
    }
}