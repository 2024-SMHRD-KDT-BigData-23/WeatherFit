package com.smhrd.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Message implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {

		
		
		return "message";
	}
	
}
