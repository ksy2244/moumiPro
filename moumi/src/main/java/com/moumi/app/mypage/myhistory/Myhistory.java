package com.moumi.app.mypage.myhistory;

public class Myhistory {
	private long Num;
	private String subject;
	private String nickName;
	private String regDate;
	
	public long getNum() {
		return Num;
	}
	public void setNum(long num) {
		Num = num;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
}