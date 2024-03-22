 package com.smhrd.database;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.mysql.cj.Session;
import com.smhrd.model.LikeVO;
import com.smhrd.model.PostVO;

import com.smhrd.model.UserVO;

public class DAO {

	private static final Object hashMap = null;
	private SqlSessionFactory factory = MySqlSessionManager.getSqlSessionFactory();

	
	// 로그인
	public UserVO login(UserVO vo) {
		
		SqlSession session = factory.openSession();
		UserVO resultVO = session.selectOne("login", vo);
		session.close();
		return resultVO;
	}

	// 회원가입
	public int join(UserVO vo) {
		
		SqlSession session = factory.openSession(true);
		int row = session.insert("join", vo);
		session.close();
		return row;
	}
	
	// 개인정보 수정
	public int update(UserVO vo) {
		SqlSession session = factory.openSession(true);
		int row = session.update("update", vo);
		session.close();
		return row;
	}
	
	// 게시물 작성
	public int post(PostVO pvo) {
		SqlSession session = factory.openSession(true);
		int row = session.insert("post", pvo);
		session.close();
		return row;
	}
	
	public List<Map<String, Object>> getpost() {
		SqlSession session = factory.openSession();
//		PostVO resultPVO = (PostVO)session.selectList("getpost");
		List<Map<String, Object>> result =  session.selectList("getpost");
		session.close();
		return result;
	}
	
	public List<PostVO> Postselect() {
		
		SqlSession session = factory.openSession();
		
		List<PostVO> resultList = session.selectList("Postselect");
		session.close();
		return resultList;
	}
	
	
	//////////////// 좋아요 기능 /////////////////
	
	public int countbyLike(HashMap<String, Object> paramMap){

		SqlSession session = factory.openSession();
		int count = session.selectOne("countbyLike");
		session.close();
		return count;
	}
	
	public int create(HashMap<String, Object> paramMap){
		SqlSession session = factory.openSession();
	    int count = session.insert("create", paramMap);
	    session.close();
	    return count;
	  }
	
	
	// 좋아요 체크
	public int likeCheck(HashMap<String, Object> paramMap) {
		SqlSession session = factory.openSession();
		int count = session.update("likeCheck", paramMap);
		session.close();
		return count;
	}
	
	// 좋아요 취소
	public int likeCheckCancel(HashMap<String, Object> paramMap) {
		SqlSession session = factory.openSession();
		int count = session.update("likeCheckCancel", paramMap);
		session.close();
		return count;
	}
	
	 public LikeVO read(HashMap<String, Object> paramMap) {
		 SqlSession session = factory.openSession();
		 LikeVO LVO = session.selectOne("read", paramMap);
		 session.close();
		 return LVO;
		  }
	
	 public int deletebypostIdx(HashMap<String, Object> paramMap) {
		 SqlSession session = factory.openSession();
		 int count = session.delete("deletebypostIdx", paramMap);
		 session.close();
		 return count;
		  }
	 
	 public int deletebyuserNick(HashMap<String, Object> paramMap) {
		 SqlSession session = factory.openSession();
		 int count = session.delete("deletebyuserNick", paramMap);
		 session.close();
		 return count;
	 }

	public int postLike(UserVO uvo, PostVO pvo, LikeVO lvo) {
		SqlSession session = factory.openSession(true);
		UserVO resultUvo = session.selectOne("selectUserNick", uvo);
		lvo.setPostIdx(pvo.getPostIdx());
		lvo.setUserNick(resultUvo.getUserNick());
		int row = session.insert("insertPostLike", lvo);
		session.close();
		return row;
	}

	 
	 
	 
	 
	 
	 
	 
}
