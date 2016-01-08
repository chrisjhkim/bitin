package com.bit2015.bitin.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	
	
	public List<MessageVo> list (Map<String, Object> map) {
		List<MessageVo> retList = null;
		retList = chattingDao.list(map);
		return retList;
	}
	
	
	public List<MessageVo> getChatList ( Long fromUserNo, Long toUserNo ) {
		List<MessageVo> retList = null;
		retList = chattingDao.getChatList(fromUserNo, toUserNo);
		return retList;
		
	}

	
	
	public List<MessageVo> send (MessageVo messageVo){
		return chattingDao.send( messageVo );
	}

	public boolean insertMessageAndUpdateUnreadCount( MessageVo vo ) {
		boolean retFlag = false;
		retFlag = (chattingDao.insertMessage(vo)) ? (chattingDao.addUnreadCount(vo)) : false;
// 위에 꺼 한줄이 아래 두줄임. 
//		if( chattingDao.insertMessage(vo) ) {
//			retFlag = (chattingDao.addUnreadCount(vo)  )   ? true : false;
//		}
		return retFlag;
	}
}
