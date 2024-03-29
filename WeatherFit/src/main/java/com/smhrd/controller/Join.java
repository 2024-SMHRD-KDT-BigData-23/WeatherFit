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
	    int userGender = Integer.parseInt(request.getParameter("userGender"));
	    String userRegion = request.getParameter("userRegion");
	    double userWeight = Double.parseDouble(request.getParameter("userWeight"));
	    double userHeight = Double.parseDouble(request.getParameter("userHeight"));

		
		
		
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
			return "join_success";
		}else {
			// 회원가입 실패 후 회원가입 화면
			return "redirect:/gomain.do";
		}
		
	}
	
	
	
	
	
}
