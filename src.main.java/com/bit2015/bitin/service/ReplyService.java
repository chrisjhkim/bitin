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

	public List<ReplyVo> getReplyByPostNo(Long postNo) {
		List<ReplyVo> replyVo = replyDao.getReplyByPostNo(postNo);
		return replyVo;
	}

}
