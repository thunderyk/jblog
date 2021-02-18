package com.jblog.vo;

public class UserVo {

	private int userNo;
	private String userName;
	private String password;
	private String joinDate;
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getJoinDate() {
		return joinDate;
	}
	public void setJoinDate(String joinDate) {
		this.joinDate = joinDate;
	}
	
	@Override
	public String toString() {
		return "UserVo [userNo=" + userNo + ", userName=" + userName + ", password=" + password + ", joinDate="
				+ joinDate + "]";
	}
	
	
}
