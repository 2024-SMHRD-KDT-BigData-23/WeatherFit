package com.smhrd.database;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.model.ChatVO;
import com.smhrd.model.CommentVO;
import com.smhrd.model.PostVO;
import com.smhrd.model.RoomVO;
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
		List<Map<String, Object>> result = session.selectList("getpost");
		session.close();
		return result;
	}

	public List<PostVO> Postselect() {

		SqlSession session = factory.openSession();

		List<PostVO> resultList = session.selectList("Postselect");
		session.close();
		return resultList;

	}
	
	public int sendChat(ChatVO cvo) {
		SqlSession session = factory.openSession(true);
		int row = session.insert("sendChat", cvo);
		session.close();
		return row;
	}
	
	public List<ChatVO> receiveChat(int roomIdx) {
		SqlSession session = factory.openSession();
		List<ChatVO> resultList = session.selectList("receiveChat", roomIdx);
		session.close();
		return resultList;
	}

	public int createRoom(RoomVO rvo) {
		SqlSession session = factory.openSession(true);
		int row = session.insert("createRoom", rvo);
		session.close();
		return row;
	}

	public List<RoomVO> selectRooms(RoomVO rvo) {
		SqlSession session = factory.openSession();
		List<RoomVO> resultList = session.selectList("selectRooms", rvo);
		session.close();
		return resultList;
	}

	public List<ChatVO> selectChats(ChatVO cvo) {
		SqlSession session = factory.openSession();
		List<ChatVO> resultList = session.selectList("selectChats", cvo);
		session.close();
		return resultList;
	}

	public void Comment() {
		SqlSession session = factory.openSession();
		List<CommentVO> resultList = session.selectList(null);
		session.close();

	}

	public List<Map<String, Object>> Search(String keyWord) {
		SqlSession session = factory.openSession();
		List<Map<String, Object>> result = session.selectList("search","%"+keyWord+"%");
		session.close();
		return result;
	}
	
	
	
	
	
	
	
}
