package com.smhrd.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.database.DAO;
import com.smhrd.model.UserVO;

public class Update implements Command {
	
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		String userPw = request.getParameter("userPw");
		String userNick = request.getParameter("userNick");
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
		vo.setUserPw(userPw);
		vo.setUserNick(userNick);
		vo.setUserWeight(userWeight);
		vo.setUserHeight(userHeight);
		vo.setUserRegion(userRegion);
		
		DAO dao = new DAO();
		
		dao.update(vo);
		
		return null;
		
	}
	
	
}
