package com.bit2015.bitin.vo;

public class VoteVo {

	
	private int voteNumber;
	private String voteTitle;
	private String createdDate;
	private String voteContent;
	private String ClassName;
	


	
	public String getClassName() {return ClassName;		}
	public int getVoteNumber() {		return voteNumber;	}
	public String getVoteContent() {		return voteContent;	}
	public String getVoteTitle() {		return voteTitle;	}
	public String getCreatedDate() {		return createdDate;	}	

	public void setVoteContent(String voteContent) {		this.voteContent = voteContent;	}
	public void setVoteNumber(int voteNumber) {		this.voteNumber = voteNumber;	}
	public void setVoteTitle(String voteTitle) {		this.voteTitle = voteTitle;	}
	public void setCreatedDate(String createdDate) {		this.createdDate = createdDate;	}
	public void setClassName(String className) {	this.ClassName = className;	}	
	
	
	@Override
	public String toString() {
		return "VoteVo [voteNumber=" + voteNumber + ", voteTitle="
				+ voteTitle + ", createdDate=" + createdDate + ", voteContent=" + voteContent + ", ClassName=" + ClassName + "]";
	}
	
}
