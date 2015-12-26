package com.bit2015.bitin.vo;

public class BoardVo {
	private String classNo;
	private Long boardType;
	private String title;
	private String content;
	private Long userNo;
	private Long viewCount;
	private String regDate;
	private String userName;
	private Long postNo;
	private String reply;

	public String getClassNo() {
		return classNo;
	}

	public String getTitle() {
		return title;
	}

	public String getContent() {
		return content;
	}

	public Long getUserNo() {
		return userNo;
	}

	public Long getViewCount() {
		return viewCount;
	}

	public String getRegDate() {
		return regDate;
	}

	public String getUserName() {
		return userName;
	}

	public Long getPostNo() {
		return postNo;
	}

	public void setClassNo(String classNo) {
		this.classNo = classNo;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public void setUserNo(Long userNo) {
		this.userNo = userNo;
	}

	public void setViewCount(Long viewCount) {
		this.viewCount = viewCount;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public void setPostNo(Long postNo) {
		this.postNo = postNo;
	}

	public Long getBoardType() {
		return boardType;
	}

	public void setBoardType(Long boardType) {
		this.boardType = boardType;
	}

	public String getReply() {
		return reply;
	}

	public void setReply(String reply) {
		this.reply = reply;
	}

	@Override
	public String toString() {
		return "BoardVo [classNo=" + classNo + ", boardType=" + boardType + ", title=" + title + ", content=" + content
				+ ", userNo=" + userNo + ", viewCount=" + viewCount + ", regDate=" + regDate + ", userName=" + userName
				+ ", postNo=" + postNo + ", reply=" + reply + "]";
	}

}