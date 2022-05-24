package com.tjoeun.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

import com.tjoeun.dao.HSmarketDAO;
import com.tjoeun.mybatis.MySession;
import com.tjoeun.vo.HSmarketList;
import com.tjoeun.vo.HSmarketVO;

public class HSmarketService {

	private static HSmarketService instance = new HSmarketService();
	private HSmarketService() { }
	public static HSmarketService getInstance() {
		return instance;
	}
	
	public void insert(HSmarketVO vo) {
		System.out.println("FreeboardService 클래스의 insert() 메소드");
		SqlSession mapper = MySession.getSession();
		HSmarketDAO.getInstance().insert(mapper, vo);
		mapper.commit();
		mapper.close();
	}
	
	public HSmarketList selectList(int currentPage) {
		System.out.println("FreeboardService 클래스의 selectList() 메소드");
		SqlSession mapper = MySession.getSession();
		HSmarketDAO dao = HSmarketDAO.getInstance();
		
		int pageSize = 10;
		int totalCount = dao.selectCount(mapper);
		// System.out.println(totalCount);
		
		HSmarketList hsmarketList = new HSmarketList(pageSize, totalCount, currentPage);
		HashMap<String, Integer> hmap = new HashMap<String, Integer>();
		hmap.put("startNo", hsmarketList.getStartNo());
		hmap.put("endNo", hsmarketList.getEndNo());
		hsmarketList.setList(dao.selectList(mapper, hmap));
		mapper.close();
		return hsmarketList;
	}
	public void increment(int idx) {
		System.out.println("FreeboardService 클래스의 increment() 메소드");
		SqlSession mapper = MySession.getSession();
		HSmarketDAO.getInstance().increment(mapper, idx);
		mapper.commit();
		mapper.close();
	}

	public HSmarketVO selectByIdx(int idx) {
		System.out.println("FreeboardService 클래스의 selectByIdx() 메소드");
		SqlSession mapper = MySession.getSession();
		HSmarketVO vo = HSmarketDAO.getInstance().selectByIdx(mapper, idx);
		mapper.close();
		return vo;
	}

	public void delete(int idx) {
		System.out.println("FreeboardService 클래스의 delete() 메소드");
		SqlSession mapper = MySession.getSession();
		HSmarketDAO.getInstance().delete(mapper, idx);
		mapper.commit();
		mapper.close();
	}

	public ArrayList<HSmarketVO> selectNotice() {
		System.out.println("FreeboardService 클래스의 selectNotice() 메소드");
		SqlSession mapper = MySession.getSession();
		ArrayList<HSmarketVO> notice = HSmarketDAO.selectNotice(mapper);
		mapper.close();
		return notice;
	}

	public void update(HSmarketVO vo) {
		System.out.println("FreeboardService 클래스의 update() 메소드");
		SqlSession mapper = MySession.getSession();
		HSmarketDAO.getInstance().update(mapper, vo);
		mapper.commit();
		mapper.close();
	}
	
}