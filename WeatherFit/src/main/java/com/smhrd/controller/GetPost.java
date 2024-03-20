package com.smhrd.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.database.DAO;
import com.smhrd.model.PostVO;

public class GetPost implements Command {
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {

		DAO dao = new DAO();
		PostVO vo = new PostVO();
		
		dao.getpost();
		
		
		
		
		
		
		
		
		
		return null;
	}
	
	
	
}
