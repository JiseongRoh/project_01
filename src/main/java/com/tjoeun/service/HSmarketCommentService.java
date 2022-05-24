package com.tjoeun.service;

import org.apache.ibatis.session.SqlSession;

import com.tjoeun.dao.HSmarketCommentDAO;
import com.tjoeun.mybatis.MySession;
import com.tjoeun.vo.HSmarketCommentList;
import com.tjoeun.vo.HSmarketCommentVO;

public class HSmarketCommentService {

	private static HSmarketCommentService instance = new HSmarketCommentService();
	private HSmarketCommentService() { }
	public static HSmarketCommentService getInstance() {
		return instance;
	}
	
	public boolean insertComment(HSmarketCommentVO vo) {
		System.out.println("FreeboardCommentService 클래스의 insertComment() 메소드");
		SqlSession mapper = MySession.getSession();
		try {
			HSmarketCommentDAO.getInstance().insertComment(mapper, vo);
			mapper.commit();
			mapper.close();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			mapper.close();
			return false;
		}
	}

	public int commentCount(int idx) {
		System.out.println("FreeboardCommentService 클래스의 commentCount() 메소드");
		SqlSession mapper = MySession.getSession();
		int commentCount = HSmarketCommentDAO.getInstance().commentCount(mapper, idx);
		mapper.close();
		return commentCount;
	}
	
	public HSmarketCommentList selectCommentList(int idx) {
		System.out.println("FreeboardCommentService 클래스의 selectCommentList() 메소드");
		SqlSession mapper = MySession.getSession();
		HSmarketCommentList hsmarketCommentList = new HSmarketCommentList();
		hsmarketCommentList.setList(HSmarketCommentDAO.getInstance().selectCommentList(mapper, idx));
		mapper.close();
		return hsmarketCommentList;
	}

	public boolean updateComment(HSmarketCommentVO vo) {
		System.out.println("FreeboardCommentService 클래스의 updateComment() 메소드");
		SqlSession mapper = MySession.getSession();
		HSmarketCommentDAO dao = HSmarketCommentDAO.getInstance();
		
		HSmarketCommentVO original = dao.selectCommentByIdx(mapper, vo.getIdx());
		if (original.getPassword().equals(vo.getPassword())) {
			try {
				dao.updateComment(mapper, vo);
				mapper.commit();
				mapper.close();
				return true;
			} catch (Exception e) {
				e.printStackTrace();
				mapper.close();
				return false;
			}
		} else {
			mapper.close();
			return false;
		}
	}
	
	public boolean deleteComment(HSmarketCommentVO vo) {
		System.out.println("FreeboardCommentService 클래스의 deleteComment() 메소드");
		SqlSession mapper = MySession.getSession();
		HSmarketCommentDAO dao = HSmarketCommentDAO.getInstance();

		HSmarketCommentVO original = dao.selectCommentByIdx(mapper, vo.getIdx());
		if (original.getPassword().equals(vo.getPassword())) {
			try {
				dao.deleteComment(mapper, vo);
				mapper.commit();
				mapper.close();
				return true;
			} catch (Exception e) {
				e.printStackTrace();
				mapper.close();
				return false;
			}
		} else {
			mapper.close();
			return false;
		}
	}
	
}


