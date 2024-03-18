package com.smhrd.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.database.DAO;
import com.smhrd.model.UserVO;

public class Join implements Command {

	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		String userId = request.getParameter("userId");
		String userPw = request.getParameter("userPw");
		String userName = request.getParameter("userName");
		String userNick = request.getParameter("userNick");
		String userGender = request.getParameter("userGender");
		String userRegion = request.getParameter("userRegion");
		String userWeightStr = request.getParameter("userWeight");
		String userHeightStr = request.getParameter("userHeight");
		
		Double userHeight = null;
		Double userWeight = null;
		try {
			userWeight = Double.parseDouble(userWeightStr);
			userHeight = Double.parseDouble(userHeightStr);
		} catch (NumberFormatException e) {
			e.printStackTrace();
		}
		
		UserVO vo = new UserVO();
		vo.setUserId(userId);
		vo.setUserPw(userPw);
		vo.setUserName(userName);
		vo.setUserNick(userNick);
		vo.setUserGender(userGender);
		vo.setUserWeight(userWeight);
		vo.setUserHeight(userHeight);
		vo.setUserRegion(userRegion);
		
		DAO dao = new DAO();
		int row = dao.join(vo);
		if(row > 0) {
			request.setAttribute("userId", userId);
			// 회원가입 성공 후 로그인 화면
			return "main";
		}else {
			// 회원가입 실패 후 회원가입 화면
			return "redirect:/";
		}
		
	}
	
	
	
	
	
}
