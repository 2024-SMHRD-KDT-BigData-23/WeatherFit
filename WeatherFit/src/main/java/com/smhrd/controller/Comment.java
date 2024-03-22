package com.smhrd.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.FileVO;

public class Comment implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		
		int cmtIdx = Integer.parseInt(request.getParameter("cmtIdx"));
		int postIdx = Integer.parseInt(request.getParameter("postIdx"));
		int cmtLikes = Integer.parseInt(request.getParameter("cmtLikes"));
		String cmtContent = request.getParameter("cmtContent");
		
		FileVO userNick = (FileVO)(session.getAttribute("member"));
		
		
		return null;
	}

}
