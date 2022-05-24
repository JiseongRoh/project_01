package com.tjoeun.vo;

import java.util.Date;

public class HSmarketVO {

	private int hs_idx;
	private String hs_name;
	private String hs_password;
	private String hs_subject; // 글제목
	private String hs_content; // 글내용
	private Date hs_writeDate;
	private int hs_hit; // 조회수
	private String hs_notice = "no"; // 공지글 여부(yes => 공지글, no => 일반글)
	private String hs_ip;
	private int hs_commentCount; // 댓글의 개수
	
	public int getIdx() {
		return hs_idx;
	}
	public void setIdx(int hs_idx) {
		this.hs_idx = hs_idx;
	}
	public String getName() {
		return hs_name;
	}
	public void setName(String hs_name) {
		this.hs_name = hs_name;
	}
	public String getPassword() {
		return hs_password;
	}
	public void setPassword(String hs_password) {
		this.hs_password = hs_password;
	}
	public String getSubject() {
		return hs_subject;
	}
	public void setSubject(String hs_subject) {
		this.hs_subject = hs_subject;
	}
	public String getContent() {
		return hs_content;
	}
	public void setContent(String hs_content) {
		this.hs_content = hs_content;
	}
	public Date getWriteDate() {
		return hs_writeDate;
	}
	public void setWriteDate(Date hs_writeDate) {
		this.hs_writeDate = hs_writeDate;
	}
	public int getHit() {
		return hs_hit;
	}
	public void setHit(int hs_hit) {
		this.hs_hit = hs_hit;
	}
	public String getNotice() {
		return hs_notice;
	}
	public void setNotice(String hs_notice) {
		this.hs_notice = hs_notice;
	}
	public String getIp() {
		return hs_ip;
	}
	public void setIp(String hs_) {
		this.hs_ip = hs_ip;
	}
	public int getCommentCount() {
		return hs_commentCount;
	}
	public void setCommentCount(int hs_commentCount) {
		this.hs_commentCount = hs_commentCount;
	}
	
	@Override
	public String toString() {
		return "FreeboardVO [idx=" + hs_idx + ", name=" + hs_name + ", password=" + hs_password + ", subject=" + hs_subject
				+ ", content=" + hs_content + ", writeDate=" + hs_writeDate + ", hit=" + hs_hit + ", notice=" + hs_notice + ", ip="
				+ hs_ip + ", commentCount=" + hs_commentCount + "]";
	}
	
}
