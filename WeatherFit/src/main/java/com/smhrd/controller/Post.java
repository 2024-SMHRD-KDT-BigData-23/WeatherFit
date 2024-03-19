package com.smhrd.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.database.DAO;
import com.smhrd.model.PostVO;

public class Post implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("member.userId");
		System.out.println(userId);
		 String postContent = request.getParameter("postContent");
//		 String userId = request.getParameter("userId");
		 String hashTag = request.getParameter("hashTag");
		 System.out.println(postContent);
		 PostVO pvo = new PostVO();
		 pvo.setPostContent(postContent);
//		 pvo.setUserId(userId);
		 pvo.setHashTag(hashTag);
		 
		 DAO dao = new DAO();
		 dao.post(pvo);
		 
		 
		 
		return null;
	}
}
