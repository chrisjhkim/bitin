package com.bit2015.bitin.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ChattingDao {
	
	@Autowired
	SqlSession sqlSession;
	
	public List<String> list (HashMap<String, Object> map) {
		List<String> retList = null;
		//TODO : retList 뽑아오는 과정
		retList = sqlSession.selectList("chatting.list", map);
		return retList;
	}
	
	
	
	public boolean send (HashMap<String, Object> map){
		boolean retFlag = false;
		retFlag = (1==sqlSession.insert("chatting.send", map));
		return retFlag;
	}
}
