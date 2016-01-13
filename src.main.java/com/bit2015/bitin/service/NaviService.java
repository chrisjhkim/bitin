package com.bit2015.bitin.service;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit2015.bitin.dao.BoardDao;
import com.bit2015.bitin.dao.ChattingDao;
import com.bit2015.bitin.dao.ClassDao;
import com.bit2015.bitin.dao.UserDao;
import com.bit2015.bitin.vo.ClassVo;
import com.bit2015.bitin.vo.MessageVo;
import com.bit2015.bitin.vo.UserVo;

@Service
public class NaviService {
	@Autowired 
	ChattingDao chattingDao;
	@Autowired
	UserDao userDao;
	@Autowired
	ClassDao classDao;
	@Autowired
	BoardDao boardDao;
	
	public Map<String, Object> getNaviDataMap ( String userId ) {
		return this.getNaviDataMap(userDao.getUserNoViaUserId(userId));
	}
	
	public Map<String, Object> getNaviDataMap ( Long userNo ) {
		Map<String, Object > retMap = new HashMap<String, Object>();
		
		////////////////////상단 네비바
		//쪽지(채팅) 부분 값들
		Long totalUnreadChat = chattingDao.getTotalUnreadChatCountByUserNo(userNo);
		retMap.put("totalUnreadChat",  totalUnreadChat);
		List<HashMap<String, Object>> recentUnreadChatList = chattingDao.getRecentUnreadChatListByUserNoGroupedByOtherUserNo(userNo);
		retMap.put("recentUnreadChatList",  recentUnreadChatList);
		List<HashMap<String, Object>> recentReadChatList = chattingDao.getRecentReadChatListByUserNoGroupedByOtherUserNo(userNo);
		retMap.put("recentReadChatList",  recentReadChatList);
		
		//classmate List
		//TODO : 친구 목록 으로 수정
		List<UserVo> classMateList = userDao.getClassmateList(userNo);
		retMap.put("classMateList", classMateList);
		
		
		/////////////////////좌측 네비바
		List<HashMap<String, Object>> classList = classDao.getClassListByUserNo(userNo);
		retMap.put("classList", classList);
		for( HashMap<String, Object> vo : classList) {
			Long classNo = ((BigDecimal)vo.get("CLASSNO")).longValue();
			List<HashMap<String, Object>>boardList = boardDao.getBoardListByClassNo(classNo);
			vo.put("boardList", boardList );
		}
		//수업목록
		
		
		// 수업 목록
		//TODO : 좀더 깔끔히... ㅅㅂ
		
		// Board 목록
		Long totalUnreadBoard = boardDao.getTotalUnreadBoardCountByUserNo(userNo);
		retMap.put("totalUnreadBoard", totalUnreadBoard);
		List<HashMap<String, Object>> readBoardList = boardDao.getRecentReadBoardListByUserNo(userNo);
		retMap.put("recentReadBoardList", readBoardList);
		List<HashMap<String, Object>> unreadBoardList = boardDao.getRecentUnreadBoardListByUserNo(userNo);
		retMap.put("recentUnreadBoardList",  unreadBoardList);
		System.out.println("readList : "+readBoardList);
		System.out.println("unreadList : "+unreadBoardList);
		System.out.println(retMap);
		return retMap;
		
	}

}
