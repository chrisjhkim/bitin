package com.bit2015.bitin.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bit2015.bitin.vo.MessageVo;
import com.bit2015.bitin.vo.UserVo;

@Repository
public class ChattingDao {
	
	@Autowired
	SqlSession sqlSession;
	
	public List<MessageVo> list (UserVo authUser) {
		List<MessageVo> retList = null;
		retList = sqlSession.selectList("chatting.list", authUser);
		return retList;
	}
	
	
	
	public List<MessageVo> send (MessageVo vo){
		sqlSession.insert( "chatting.send", vo );
		List<MessageVo>  retList= sqlSession.selectList("chatting.selectbyno", vo);
		return retList;
	}
}
