package com.bit2015.bitin.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bit2015.bitin.vo.NoticeVo;

@Repository
public class NoticeDao {
	
	@Autowired
	SqlSession sqlSession;
	
	public boolean noticeInsert(NoticeVo noticeVo) {
		boolean retFlag = false;
		retFlag = ( 1== sqlSession.insert("notice.insert", noticeVo));
		return retFlag;
	}
	
	public List<NoticeVo> noticeList(NoticeVo noticeVo) {
		List<NoticeVo> retlist =  sqlSession.selectList("notice.list", noticeVo);
		return retlist;
	}
	
}
