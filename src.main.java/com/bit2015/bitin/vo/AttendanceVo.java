package com.bit2015.bitin.vo;

public class AttendanceVo {
	private Long userNo;
	private Long attdNo;
	private String classDate;
	private String attdStatus;
	private String description;
	public Long getUserNo() {
		return userNo;
	}
	public String getClassDate() {
		return classDate;
	}
	public String getAttdStatus() {
		return attdStatus;
	}
	public String getDescription() {
		return description;
	}
	public void setUserNo(Long userNo) {
		this.userNo = userNo;
	}
	public void setClassDate(String classDate) {
		this.classDate = classDate;
	}
	public void setAttdStatus(String attdStatus) {
		this.attdStatus = attdStatus;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	@Override
	public String toString() {
		return "AttendanceVo [userNo=" + userNo + ", attdNo=" + attdNo
				+ ", classDate=" + classDate + ", attdStatus=" + attdStatus
				+ ", description=" + description + "]";
	}
	public Long getAttdNo() {
		return attdNo;
	}
	public void setAttdNo(Long attdNo) {
		this.attdNo = attdNo;
	}
	
	
	
	

}
