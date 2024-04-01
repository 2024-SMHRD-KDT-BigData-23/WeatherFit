package com.smhrd.ajax;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.smhrd.database.DAO;
import com.smhrd.model.PostVO;

public class Postdetail implements AjaxCommand{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int postIdx = Integer.parseInt(request.getParameter("postIdx"));
		System.out.println(postIdx);
		System.out.println("게시물상세보기되냐?");
		
		PostVO pvo = new PostVO();
		pvo.setPostIdx(postIdx);
		
		
		DAO dao = new DAO();
		
		List<PostVO> posts = dao.Postdetail(pvo);
		
		
		Gson gson = new Gson();
		String json = gson.toJson(posts);
		System.out.println(json);
		System.out.println("1");
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(json);
		
		
		
	}

}
