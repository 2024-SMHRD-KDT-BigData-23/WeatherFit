package com.smhrd.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Home implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		// 홈버튼을 누를때 거치는 서블릿, 
		// 세션을 누를때 그 상태 그대로 main으로 이동시킨다.
		
		return "redirect:/gomain.do";
	}

}
