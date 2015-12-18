package com.bit2015.bitin.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit2015.bitin.dao.ChattingDao;
import com.bit2015.bitin.dao.MessageDao;

@Service
public class ChattingService {
	
	
	@Autowired		
	ChattingDao chattingDao;
	
	
	public List<String>  list (HashMap<String, Object> map) {
		List<String> retList = null;
		//TODO : retList 뽑아오는 과정
		retList = chattingDao.list(map);
		return retList;
	}

	
	
	public boolean send (HashMap<String, Object> map){
		boolean retFlag = false;
		retFlag = chattingDao.send(map);
		return retFlag;
	}

}
