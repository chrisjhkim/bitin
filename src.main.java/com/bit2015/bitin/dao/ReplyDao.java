package com.bit2015.bitin.dao;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bit2015.bitin.vo.ReplyVo;

@Repository
public class ReplyDao {

	@Autowired
	SqlSession sqlSession;

	public List<ReplyVo> getReplyByPostNo(Long postNo) {
		System.out.println("postNo"+ postNo);
		//List<ReplyVo> replyVo = null;
		List<ReplyVo> replyVo = sqlSession.selectList("reply.getReplyByPostNo", postNo);
//		ReplyVo tempVo = sqlSession.selectOne("reply.getReplyByPostNo", postNo);
        System.out.println("replyVo dao : " + replyVo);
		return replyVo;
	}
}
