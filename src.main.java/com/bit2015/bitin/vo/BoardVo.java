package com.bit2015.bitin.vo;

public class BoardVo {
	private Long classNo;
	private Long boardNo;
	private String boardName;
	
	public Long getClassNo() {		return classNo;	}
	public Long getBoardNo() {		return boardNo;	}
	public String getBoardName() {		return boardName;	}
	
	public void setClassNo(Long classNo) {		this.classNo = classNo;	}
	public void setBoardNo(Long boardNo) {		this.boardNo = boardNo;	}
	public void setBoardName(String boardName) {		this.boardName = boardName;	}
	@Override
	public String toString() {
		return "BoardVo [classNo=" + classNo + ", boardNo=" + boardNo
				+ ", boardName=" + boardName + "]";
	}
	
	

}