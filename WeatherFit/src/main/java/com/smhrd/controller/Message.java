package com.smhrd.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Message implements Command {

	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String message = request.getParameter("message");
		
		HttpSession session = request.getSession();	
		
		return message;
	}
	
}
