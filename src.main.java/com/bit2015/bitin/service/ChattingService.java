package com.bit2015.bitin.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit2015.bitin.dao.ChattingDao;
import com.bit2015.bitin.dao.MessageDao;
import com.bit2015.bitin.vo.MessageVo;
import com.bit2015.bitin.vo.UserVo;

@Service
public class ChattingService {
	
	
	@Autowired		
	ChattingDao chattingDao;
	
	
	public List<MessageVo> list (UserVo authUser) {
		List<MessageVo> retList = null;
		retList = chattingDao.list(authUser);
		return retList;
	}

	
	
	public List<MessageVo> send (MessageVo messageVo){
		return chattingDao.send( messageVo );
	}

}
