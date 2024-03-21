package com.smhrd.frontController;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.controller.Command;
import com.smhrd.controller.GetPost;
import com.smhrd.controller.Join;
//import com.smhrd.controller.EmailCheck;
//import com.smhrd.controller.Join;
import com.smhrd.controller.Login;
import com.smhrd.controller.Logout;
import com.smhrd.controller.Post;
import com.smhrd.controller.Postselect;
import com.smhrd.controller.TestGo;
import com.smhrd.controller.Update;
//import com.smhrd.controller.Logout;
//import com.smhrd.controller.SelectAll;
//import com.smhrd.controller.Update;
import com.smhrd.database.DAO;
import com.smhrd.model.UserVO;



@WebServlet("*.do")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private HashMap<String, Command> map = new HashMap<String, Command>();
	
	@Override
	public void init() throws ServletException {
		map.put("Join.do", new Join());
		map.put("Login.do", new Login());
		map.put("Logout.do", new Logout());
		map.put("Post.do", new Post());
		map.put("TestGo.do", new TestGo());
		map.put("Postselect.do", new Postselect());
		map.put("Update.do", new Update());
		map.put("GetPost.do", new GetPost());
//		map.put("EmailCheck.do", new EmailCheck());
	}
	
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String uri = request.getRequestURI();
		String cp = request.getContextPath();
		String path = uri.substring(cp.length() + 1);
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		String finalPath = null;
		Command com = map.get(path);
		
		if(path.startsWith("go")) {
			finalPath = path.replace("go", "").replace(".do", "");
		} else {
			finalPath = com.execute(request, response);
		}
		
		if(finalPath == null) {
			
		} else if (finalPath.contains("redirect:/")) {
			response.sendRedirect(finalPath.split("/")[1]);
		} else {
			RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/views/" + finalPath + ".jsp");
			rd.forward(request, response);
		}

	}

}