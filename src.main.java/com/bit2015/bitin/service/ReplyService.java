package com.bit2015.bitin.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit2015.bitin.dao.ReplyDao;
import com.bit2015.bitin.vo.ReplyVo;

@Service
public class ReplyService {

	@Autowired
	ReplyDao replyDao;

	public List<ReplyVo> getReplyListByPostNo(Long postNo) {
		List<ReplyVo> retList = null;
		retList = replyDao.getReplyListByPostNo(postNo);
		return retList;
	}

	/*public List<ReplyVo> getReplyByNoticeNo(Long noticeNo) {
		List<ReplyVo> replyVo = replyDao.getReplyByNoticeNo(noticeNo);
		return replyVo;
	}*/
	
	public void writeReply(ReplyVo vo) {
		replyDao.insertReply(vo);
	}

}
