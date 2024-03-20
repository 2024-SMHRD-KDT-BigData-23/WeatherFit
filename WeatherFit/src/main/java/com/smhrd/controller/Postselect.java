package com.smhrd.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.database.DAO;
import com.smhrd.model.PostVO;
import com.smhrd.model.UserVO;

public class Postselect implements Command{
	
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		DAO dao = new DAO();
		HttpSession session = request.getSession();
		UserVO uvo = (UserVO)(session.getAttribute("member"));
		String userNick = uvo.getUserNick();
		
		
		List<PostVO> list = dao.postselect();
		
		request.setAttribute("list", list);

		
		return "select";
		
		
	}
	
}
