package com.tjoeun.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;

import com.tjoeun.vo.HSmarketCommentVO;

public class HSmarketCommentDAO {

	private static HSmarketCommentDAO instance = new HSmarketCommentDAO();
	private HSmarketCommentDAO() { }
	public static HSmarketCommentDAO getInstance() {
		return instance;
	}

	public void insertComment(SqlSession mapper, HSmarketCommentVO vo) {
		System.out.println("FreeboardCommentDAO 클래스의 insertComment() 메소드");
		mapper.insert("insertComment", vo);
	}
	
	public int commentCount(SqlSession mapper, int idx) {
		System.out.println("FreeboardCommentDAO 클래스의 commentCount() 메소드");
		return (int) mapper.selectOne("commentCount", idx);
	}
	
	public ArrayList<HSmarketCommentVO> selectCommentList(SqlSession mapper, int idx) {
		System.out.println("FreeboardCommentDAO 클래스의 selectCommentList() 메소드");
		return (ArrayList<HSmarketCommentVO>) mapper.selectList("selectCommentList", idx);
	}

	public HSmarketCommentVO selectCommentByIdx(SqlSession mapper, int idx) {
		System.out.println("FreeboardCommentDAO 클래스의 selectCommentByIdx() 메소드");
		return (HSmarketCommentVO) mapper.selectOne("selectCommentByIdx", idx);
	}
	
	public void updateComment(SqlSession mapper, HSmarketCommentVO vo) {
		System.out.println("FreeboardCommentDAO 클래스의 updateComment() 메소드");
		mapper.update("updateComment", vo);
	}
	
	public void deleteComment(SqlSession mapper, HSmarketCommentVO vo) {
		System.out.println("FreeboardCommentDAO 클래스의 deleteComment() 메소드");
		mapper.delete("deleteComment", vo);
	}
	
}
