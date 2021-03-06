package com.bit2015.bitin.dao;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bit2015.bitin.vo.BoardVo;
import com.bit2015.bitin.vo.ReplyVo;

@Repository
public class ReplyDao {

	@Autowired
	SqlSession sqlSession;

	public List<ReplyVo> getReplyListByPostNo(Long postNo) {
		List<ReplyVo> retList = null;
		retList = sqlSession.selectList("reply.getReplyListByPostNo", postNo);
		return retList;
	}
	
	public void insertReply(ReplyVo vo) {
		sqlSession.insert("reply.insertReply", vo);
	}
}
