package com.smhrd.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.database.DAO;
import com.smhrd.model.RoomVO;

public class CreateRoom implements Command {

	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String sendUserId = request.getParameter("sendUserId");
		String receiveUserId = request.getParameter("receiveUserId");
		
		RoomVO rvo = new RoomVO();
		rvo.setUserId(sendUserId);
		rvo.setRoomTitle(receiveUserId);
		rvo.setRoomLimit(2);
		rvo.setRoomStatus("생성");
		
		DAO dao = new DAO();
		int row = dao.createRoom(rvo);
		if(row > 0) {
			System.out.println("채팅방 생성 완료!");
		} else {
			System.out.println("채팅방 생성 실패..");
		}
		return "redirect:/gochat.do";
	}
	
}
