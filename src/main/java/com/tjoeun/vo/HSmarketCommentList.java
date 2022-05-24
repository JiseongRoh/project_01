package com.tjoeun.vo;

import java.util.ArrayList;

//	특정 메인글의 댓글 목록을 기억한다.
public class HSmarketCommentList {

	private ArrayList<HSmarketCommentVO> list = new ArrayList<HSmarketCommentVO>();

	public ArrayList<HSmarketCommentVO> getList() {
		return list;
	}
	public void setList(ArrayList<HSmarketCommentVO> list) {
		this.list = list;
	}
	
	@Override
	public String toString() {
		return "HSmarketCommentList [list=" + list + "]";
	}
	
}
