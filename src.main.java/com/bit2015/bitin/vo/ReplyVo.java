package com.bit2015.bitin.vo;

public class ReplyVo {
    private Long userNo;
    private Long postNo;
    private String userName;
    private String regDate;
    private String reply;
	public Long getUserNo() {
		return userNo;
	}
	public void setUserNo(Long userNo) {
		this.userNo = userNo;
	}
	public Long getPostNo() {
		return postNo;
	}
	public void setPostNo(Long postNo) {
		this.postNo = postNo;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public String getReply() {
		return reply;
	}
	public void setReply(String reply) {
		this.reply = reply;
	}
	
	@Override
	public String toString() {
		return "ReplyVo [userNo=" + userNo + ", postNo=" + postNo + ", userName=" + userName + ", regDate=" + regDate
				+ ", reply=" + reply + "]";
	}

    
}
