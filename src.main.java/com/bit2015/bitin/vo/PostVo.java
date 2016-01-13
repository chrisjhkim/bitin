package com.bit2015.bitin.vo;

public class PostVo {
	private Long boardNo;
	private Long postNo;
	private String title;
	private String content;
	private Long userNo;
	private Long viewCnt;
	private String regDate;
	private Long boardType;
	private String userName;

	public Long getBoardNo() {		return boardNo;	}
	public Long getPostNo() {		return postNo;	}
	public String getTitle() {		return title;	}
	public String getContent() {		return content;	}
	public Long getUserNo() {		return userNo;	}
	public Long getViewCnt() {		return viewCnt;	}
	public String getRegDate() {		return regDate;	}
	public Long getBoardType() {		return boardType;	}
	public String getUserName() {		return userName;	}
	
	public void setBoardNo(Long boardNo) {		this.boardNo = boardNo;	}
	public void setPostNo(Long postNo) {		this.postNo = postNo;	}
	public void setTitle(String title) {		this.title = title;	}
	public void setContent(String content) {		this.content = content;	}
	public void setUserNo(Long userNo) {		this.userNo = userNo;	}
	public void setViewCnt(Long viewCnt) {		this.viewCnt = viewCnt;	}
	public void setRegDate(String regDate) {		this.regDate = regDate;	}
	public void setBoardType(Long boardType) {		this.boardType = boardType;	}
	public void setUserName(String userName) {		this.userName = userName;	}
	@Override
	public String toString() {
		return "PostVo [boardNo=" + boardNo + ", postNo=" + postNo + ", title="
				+ title + ", content=" + content + ", userNo=" + userNo
				+ ", viewCnt=" + viewCnt + ", regDate=" + regDate
				+ ", boardType=" + boardType + ", userName=" + userName + "]";
	}
	
	
	

}
