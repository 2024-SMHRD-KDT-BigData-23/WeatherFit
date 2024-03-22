package com.smhrd.websocket;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;
// import com.fasterxml.jackson.databind.ObjectMapper;

@ServerEndpoint("/websocket")
public class websocket {

    static List<Session> sessionList = Collections.synchronizedList(new ArrayList<>());

    // 웹 소켓 연결시 호출
    @OnOpen
    public void handleOpen(Session userSession) {
        System.out.println("웹 소켓 연결");
        sessionList.add(userSession); // 웹 소켓 연결시 세션리스트에 추가
    }

    // 웹소켓 메시지 수신시 호출
    @OnMessage
    public void handleMessage(String message, Session userSession) {
        System.out.println("수신 된메시지 : " + message);
        // 메시지 처리 로직 구현
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