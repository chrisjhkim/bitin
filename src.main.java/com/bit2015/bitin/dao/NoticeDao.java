package com.bit2015.bitin.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bit2015.bitin.vo.BoardVo;
import com.bit2015.bitin.vo.ClassVo;
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
	
	/* web list*/
	public List<NoticeVo> getList(Long classNo) {
		List<NoticeVo> list = sqlSession.selectList("notice.selectList", classNo);
		return list;
	}
	
	/*
	 * web list get Notice class Name
	 */
	public ClassVo getStirng(Long classNo) {
		ClassVo vo = sqlSession.selectOne("notice.selectBoardName", classNo);
		return vo;
	}
	
	public NoticeVo getNoticeByNoticeNo(Long noticeNo) {
		NoticeVo noticeVo = sqlSession.selectOne("notice.getNoticeByNoticeNo", noticeNo);
		return noticeVo;
	}
}
