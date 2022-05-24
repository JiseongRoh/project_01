package com.tjoeun.vo;

import java.util.Date;

public class HSmarketCommentVO {

	private int hs_idx;
	private int hs_gup;
	private String hs_name;
	private String hs_password;
	private String hs_content;
	private Date hs_writeDate;
	private String hs_ip;
	
	public int getIdx() {
		return hs_idx;
	}
	public void setIdx(int hs_idx) {
		this.hs_idx = hs_idx;
	}
	public int getGup() {
		return hs_gup;
	}
	public void setGup(int hs_gup) {
		this.hs_gup = hs_gup;
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
	public String getIp() {
		return hs_ip;
	}
	public void setIp(String hs_ip) {
		this.hs_ip = hs_ip;
	}
	
	@Override
	public String toString() {
		return "FreeboardCommentVO [idx=" + hs_idx + ", gup=" + hs_gup + ", name=" + hs_name + ", password=" + hs_password
				+ ", content=" + hs_content + ", writeDate=" + hs_writeDate + ", ip=" + hs_ip + "]";
	}
	
}
