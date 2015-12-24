package com.bit2015.bitin.api.thread;

import java.util.TimerTask;

import com.bit2015.bitin.dao.AttdDao;

public class EndAttd extends TimerTask{
	private Long classNo;
	@Override
	public void run() {
		System.out.println("Endattd run() !!!");
		System.out.println("classNo 1: "+classNo);
		AttdDao attdDao = new AttdDao();
		System.out.println("classNo 2: "+classNo);
		attdDao.updateEndAttdViaClassNo(classNo);
		// TODO Auto-generated method stub
		
	}
	public Long getClassNo() {
		return classNo;
	}
	public void setClassNo(Long classNo) {
		this.classNo = classNo;
	}
	

}
