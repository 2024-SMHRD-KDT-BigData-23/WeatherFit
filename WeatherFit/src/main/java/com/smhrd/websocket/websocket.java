package com.smhrd.websocket;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.smhrd.database.DAO;
import com.smhrd.model.ChatVO;
// import com.fasterxml.jackson.databind.ObjectMapper;

@ServerEndpoint("/websocket/{roomIdx}")
public class websocket {

    // static List<Session> sessionList = Collections.synchronizedList(new ArrayList<>());
	private static final Map<String, Set<Session>> userGroups = new ConcurrentHashMap<>();
	
    // 웹 소켓 연결시 호출
    @OnOpen
    public void handleOpen(Session userSession, @PathParam("roomIdx") String roomIdx) {
        System.out.println("웹 소켓 연결");
        // 웹 소켓 연결시 세션리스트에 추가
//        sessionList.add(userSession);
        System.out.println(userSession);
        userGroups.computeIfAbsent(roomIdx, k -> ConcurrentHashMap.newKeySet()).add(userSession);
//        DAO dao = new DAO();
//        List<ChatVO> cvoList = dao.receiveChat(1);
//        Gson gson = new Gson();
//        String json = gson.toJson(cvoList);
//        for(Session session : sessionList) {
//        	try {
//				session.getBasicRemote().sendText(json);
//			} catch (IOException e) {
//				System.out.println("메시지 전송 중 오류 발생 : " + e.getMessage());
//				e.printStackTrace();
//			}
//        }
    }

    // 웹소켓 메시지 수신시 호출
    @OnMessage
    public void handleMessage(String message, Session userSession, @PathParam("roomIdx") String roomIdx) {
        System.out.println("수신 된 메시지 : " + message);
        // 메시지 처리 로직 구현
        Set<Session> userSessions = userGroups.get(roomIdx);
        for(Session s : userSessions) {
        	if(s.isOpen()) {
        		s.getAsyncRemote().sendText(message);
        	}
        }
//        Iterator<Session> iterator = sessionList.iterator();
//        while(iterator.hasNext()) {
//        	try {
//				iterator.next().getBasicRemote().sendText(message);
//			} catch (IOException e) {
//				System.out.println("메시지 전송 중 오류 발생 : " + e.getMessage());
//				e.printStackTrace();
//			}
//        }
        
//        try {
//        	System.out.println("받아온 메시지 전송 성공!");
//        	userSession.getBasicRemote().sendText(message);
//        } catch (IOException e) {
//        	System.out.println("받아온 메시지 전송 실패..");
//        	e.printStackTrace();
//        }
//        Gson gson = new Gson();
//        JsonObject json = gson.fromJson(message, JsonObject.class);
//
//        int sendRoomIdx = json.get("roomIdx").getAsInt();
//        String sendMessage = json.get("value").getAsString();
//        ChatVO cvo = new ChatVO();
//        cvo.setChatIdx(2); // chatIdx
//        cvo.setRoomIdx(sendRoomIdx); // roomIdx
//        cvo.setChatter("YeonDoIt"); // chatter
//        cvo.setChat(sendMessage); // chat
//        DAO dao = new DAO();
//        int row = dao.sendChat(cvo);
//        if(row > 0) {
//        	System.out.println("보낸 메세지 저장 성공!");
//        } else {
//        	System.out.println("보낸 메세지 저장 실패..");
//        }
    }

    // 웹소켓 연결 종료시 호출
    @OnClose
    public void handleClose(Session userSession, @PathParam("roomIdx") String roomIdx) {
    	Set<Session> userSessions = userGroups.get(roomIdx);
    	userSessions.remove(userSession);
    	if(userSessions.isEmpty()) {
    		userGroups.remove(roomIdx);
    	}
//        sessionList.remove(userSession);
        System.out.println("웹 소켓 연결 종료");
    }

    // 웹소켓 에러 발생시 호출
    @OnError
    public void handleError(Throwable t) {
        t.printStackTrace();
    }
}