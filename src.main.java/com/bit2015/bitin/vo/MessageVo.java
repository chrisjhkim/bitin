package com.bit2015.bitin.vo;

public class MessageVo {

	
	private Long toUserNo;
	private Long fromUserNo;
	private String createdDate;
	private String message;
	

	public Long getFromUserNo() {
		return fromUserNo;
	}
	public void setFromUserNo(Long fromUserNo) {
		this.fromUserNo = fromUserNo;
	}
	public Long getToUserNo() {
		return toUserNo;
	}
	public void setToUserNo(Long toUserNo) {
		this.toUserNo = toUserNo;
	}
	public String getCreatedDate() {
		return createdDate;
	}
	public void setCreatedDate(String createdDate) {
		this.createdDate = createdDate;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	@Override
	public String toString() {
		return "MessageVo [fromUserNo=" + fromUserNo + ", toUserNo=" + toUserNo + ", createdDate=" + createdDate
				+ ", message=" + message + "]";
	}

}
