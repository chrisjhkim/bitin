package com.bit2015.bitin.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bit2015.bitin.vo.MessageVo;
import com.bit2015.bitin.vo.UserVo;

@Repository
public class ChattingDao {
	
	@Autowired
	SqlSession sqlSession;
	
	/**
	 * @param map
	 * @return
	 * map으로 받는것보다 Long 두개로 받는게 맞는것 같아서 
	 * 바꾸진 않고 아래 getChatList 로 하나 추가함 
	 * 이름은 바꾸는게 맞았던것 같음
	 */
	public List<MessageVo> list (Map<String, Object> map) {
		List<MessageVo> retList = null;
		retList = sqlSession.selectList("chatting.list", map);
		return retList;
	}
	
	
	public List<MessageVo> getChatList (Long fromUserNo, Long toUserNo) {
		List<MessageVo> retList = null;

		Map<String, Object> inputMap = new HashMap<String, Object>();
		inputMap.put("toUserNo", toUserNo);
		inputMap.put("fromUserNo", fromUserNo);
		retList = sqlSession.selectList("chatting.list", inputMap);
		
		return retList;
	}
	
	
	
	public List<MessageVo> send (MessageVo vo){
		sqlSession.insert( "chatting.insertMessage", vo );
		List<MessageVo>  retList= sqlSession.selectList("chatting.selectbyno", vo);
		return retList;
	}
	
	public boolean insertMessage( MessageVo vo ) {
		boolean retFlag = false;
		retFlag = (1 == sqlSession.insert("chatting.insertMessage", vo) );
		return retFlag;
	}
	
	public boolean addUnreadCount ( MessageVo vo ) {
		boolean retFlag = false;
		retFlag = (1 == sqlSession.insert("chatting.insertNewUnreadChat",vo ) );
		return retFlag;
	}
	public Long getTotalUnreadChatCountByUserNo (Long userNo ) {
		Long retLong = 0L;
		retLong = sqlSession.selectOne("chatting.getTotalUnreadChatCountByUserNo", userNo);
		return retLong;
	}
	
	public List<HashMap<String, Object>> getRecentUnreadChatListByUserNoGroupedByOtherUserNo ( Long userNo ) {
		List<HashMap<String, Object>> retList = null;
		retList = sqlSession.selectList("chatting.getRecentUnreadChatListByUserNoGroupByOtherUserNo", userNo);
		return retList;
	}
	public List<HashMap<String, Object>> getRecentReadChatListByUserNoGroupedByOtherUserNo ( Long userNo ) {
		List<HashMap<String, Object>> retList = null;
		retList = sqlSession.selectList("chatting.getRecentReadChatListByUserNoGroupByOtherUserNo", userNo);
		return retList;
	}
}
//toUserNo
//fromUserNo