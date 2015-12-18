package com.bit2015.bitin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit2015.bitin.dao.NoticeDao;
import com.bit2015.bitin.vo.NoticeVo;

@Service
public class NoticeService {
	
	@Autowired
	NoticeDao noticeDao;
	
	public boolean noticeInsert(NoticeVo noticeVo){
		boolean retFlag = false;
		retFlag = noticeDao.noticeInsert(noticeVo);
		return retFlag;
	}
	
	public List<NoticeVo> noticeList(NoticeVo noticeVo){
		List<NoticeVo> retlist = noticeDao.noticeList(noticeVo);
		return retlist;
	}
}
