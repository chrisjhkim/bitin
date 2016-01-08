package com.bit2015.bitin.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit2015.bitin.dao.ChattingDao;
import com.bit2015.bitin.dao.UserDao;
import com.bit2015.bitin.vo.MessageVo;
import com.bit2015.bitin.vo.UserVo;

@Service
public class NaviService {
	@Autowired 
	ChattingDao chattingDao;
	@Autowired
	UserDao userDao;
	
	public Map<String, Object> getNaviDataMap ( String userId ) {
		return this.getNaviDataMap(userDao.getUserNoViaUserId(userId));
	}
	
	public Map<String, Object> getNaviDataMap ( Long userNo ) {
		Map<String, Object > retMap = new HashMap<String, Object>();
		
		/////////////////////좌측 네비바
		//수업목록 
		
		////////////////////상단 네비바
		//쪽지(채팅) 부분 값들
		Long totalUnreadChat = chattingDao.getTotalUnreadChatCountByUserNo(userNo);
		retMap.put("totalUnreadChat",  totalUnreadChat);
		List<HashMap<String, Object>> recentUnreadChatList = chattingDao.getRecentUnreadChatListByUserNoGroupedByOtherUserNo(userNo);
		retMap.put("recentUnreadChatList",  recentUnreadChatList);
		List<HashMap<String, Object>> recentReadChatList = chattingDao.getRecentReadChatListByUserNoGroupedByOtherUserNo(userNo);
		retMap.put("recentReadChatList",  recentReadChatList);
		System.out.println("navi read chats : "+recentReadChatList);
		
		//classmate List
		//TODO : 친구 목록 으로 수정
		List<UserVo> classMateList = userDao.getClassmateList(userNo);
		retMap.put("classMateList", classMateList);
		
		
		// 수업 목록
		//TODO : 좀더 깔끔히... ㅅㅂ
		List<UserVo> classList = userDao.getClassList(userNo);
		retMap.put("classList", classList);
		
		return retMap;
		
	}

}
