package com.tjoeun.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

import com.tjoeun.vo.HSmarketVO;

public class HSmarketDAO {

	private static HSmarketDAO instance = new HSmarketDAO();
	private HSmarketDAO() { }
	public static HSmarketDAO getInstance() {
		return instance;
	}

	public void insert(SqlSession mapper, HSmarketVO vo) {
		System.out.println("FreeboardDAO 클래스의 insert() 메소드");
		mapper.insert("insert", vo);
	}
	
	public int selectCount(SqlSession mapper) {
		System.out.println("FreeboardDAO 클래스의 selectCount() 메소드");
		return (int) mapper.selectOne("selectCount");
	}

	public ArrayList<HSmarketVO> selectList(SqlSession mapper, HashMap<String, Integer> hmap) {
		System.out.println("FreeboardDAO 클래스의 selectList() 메소드");
		return (ArrayList<HSmarketVO>) mapper.selectList("selectList", hmap);
	}
	
	public void increment(SqlSession mapper, int idx) {
		System.out.println("FreeboardDAO 클래스의 increment() 메소드");
		mapper.update("increment", idx);
	}

	public HSmarketVO selectByIdx(SqlSession mapper, int idx) {
		System.out.println("FreeboardDAO 클래스의 selectByIdx() 메소드");
		return (HSmarketVO) mapper.selectOne("selectByIdx", idx);
	}

	public void delete(SqlSession mapper, int idx) {
		System.out.println("FreeboardDAO 클래스의 delete() 메소드");
		mapper.delete("delete", idx);
	}

	public static ArrayList<HSmarketVO> selectNotice(SqlSession mapper) {
		System.out.println("FreeboardDAO 클래스의 selectNotice() 메소드");
		return (ArrayList<HSmarketVO>) mapper.selectList("selectNotice");
	}

	public void update(SqlSession mapper, HSmarketVO vo) {
		System.out.println("FreeboardDAO 클래스의 update() 메소드");
		mapper.update("update", vo);
	}
	
}