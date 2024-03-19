package com.smhrd.database;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.model.PostVO;

import com.smhrd.model.UserVO;

public class DAO {

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
	public void update(UserVO vo) {
		SqlSession session = factory.openSession(true);
		session.update("update", vo);
		session.close();
	}
	
	// 게시물 작성
	public int post(PostVO pvo) {
		SqlSession session = factory.openSession(true);
		int row = session.insert("post", pvo);
		session.close();
		return row;
	}
	
}
