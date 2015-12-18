package com.bit2015.bitin.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit2015.bitin.dao.MessageDao;



@Service
public class MessageService {

	
	
	
	
	/**
	 *            메세지 서비스 아직 미완성( 기능구현은 다했는데 테스트를 안해봄)
	 */
	@Autowired
	MessageDao messageDao;
	
	public List<String>  getMessageList (String userId) {
		List<String> retList = null;
		//TODO : retList 뽑아오는 과정
		retList = messageDao.getMessageList(userId);
		return retList;
	}
	
	
	public List<String>  getSendMessageList (String userId) {
		List<String> retList = null;
		//TODO : retList 뽑아오는 과정
		retList = messageDao.getSendMessageList(userId);
		return retList;
	}
	
	
	public boolean sendMessage (HashMap<String, Object> map){
		boolean retFlag = false;
		retFlag = messageDao.sendMessage(map);
		return retFlag;
	}

}
