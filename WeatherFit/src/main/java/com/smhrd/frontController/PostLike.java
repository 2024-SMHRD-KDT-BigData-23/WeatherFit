package com.smhrd.frontController;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.smhrd.database.DAO;
import com.smhrd.model.LikeVO;
import com.smhrd.model.PostVO;
import com.smhrd.model.UserVO;

@WebServlet("/PostLike")
public class PostLike extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("좋아요 요청이 들어옴.");
		String userId = request.getParameter("userId");
		int postIdx = Integer.parseInt(request.getParameter("postIdx"));
		int likeCheck = Integer.parseInt(request.getParameter("likeCheck"));
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		UserVO uvo = new UserVO();
		uvo.setUserId(userId);
		PostVO pvo = new PostVO();
		pvo.setPostIdx(postIdx);
		LikeVO lvo = new LikeVO();
		lvo.setLikeCheck(likeCheck);
		DAO dao = new DAO();
		int row = dao.postLike(uvo, pvo, lvo);
		if(row > 0) {
			System.out.println("좋아요 성공");
		} else {
			System.out.println("좋아요 실패");			
		}
	}

}
