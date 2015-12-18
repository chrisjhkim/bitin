package com.bit2015.bitin.vo;

import java.sql.Date;

public class NoticeVo {

	private Long noticeNo;
	private String userId;
	private String className;
	private Long classNo;
	private String message;
	private String title;
	private String createdDate;
	
	public String getCreatedDate() {
		return createdDate;
	}
	public void setCreatedDate(String createdDate) {
		this.createdDate = createdDate;
	}
	public Long getNoticeNo() {
		return noticeNo;
	}
	public void setNoticeNo(Long noticeNo) {
		this.noticeNo = noticeNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getClassName() {
		return className;
	}
	public void setClassName(String className) {
		this.className = className;
	}
	public Long getClassNo() {
		return classNo;
	}
	public void setClassNo(Long classNo) {
		this.classNo = classNo;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	@Override
	public String toString() {
		return "NoticeVo [noticeNo=" + noticeNo + ", userId=" + userId + ", className=" + className
				+ ", message=" + message + ", title=" + title + ", classNo=" + classNo
				+ ", createdDate=" + createdDate + "]";
	}
} 
