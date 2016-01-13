package com.bit2015.bitin.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit2015.bitin.dao.BoardDao;
import com.bit2015.bitin.vo.BoardVo;
import com.bit2015.bitin.vo.ClassVo;
import com.bit2015.bitin.vo.PostVo;

@Service
public class BoardService {
	@Autowired
	BoardDao boardDao;

	public List<PostVo> getPostListByBoardNo (Long boardNo ) {
		List<PostVo> retList = null;
		retList = boardDao.getPostListByBoardNo(boardNo);
		return retList;
	}
	
	public HashMap<String,Object> getPostInfoByPostNo (Long postNo ) {
		HashMap<String, Object > retMap = null;
		retMap = boardDao.getPostInfoByPostNo(postNo);
		return retMap;
	}
	
	public boolean updatePost( PostVo postVo ) {
		boolean retFlag = false;
		retFlag = boardDao.updatePost(postVo);
		return retFlag;
	}
	
	public boolean deletePostByPostNo( Long postNo ){
		boolean retFlag = false;
		retFlag = boardDao.deletePostByPostNo(postNo);
		return retFlag;
	}	
	
	public Long getPrevPostNoByPostNo (Long postNo ) {
		Long retLong = null;
		retLong = boardDao.getPrevPostNoByPostNo(postNo);
		return retLong;
	}
	public Long getNextPostNoByPostNo (Long postNo ) {
		Long retLong = null;
		retLong = boardDao.getNextPostNoByPostNo(postNo);
		return retLong;
	}
	
	public BoardVo getBoardVoByBoardNo (Long boardNo ) { 
		BoardVo boardVo = null;
		boardVo = boardDao.getBoardVoByBoardNo(boardNo);
		return boardVo;
	}
	public boolean writeBoard(PostVo postVo) {
		boolean retFlag = false;
		retFlag = boardDao.insertPost(postVo);
		return retFlag;
	}
	public boolean insertUnreadCountByBoardNoAndWritterUserNo ( Long boardNo, Long writterUserNo ) {
		boolean retFlag = false;
		List<Long> memberList = boardDao.getMemberNoListByBoardNo(boardNo);
		memberList.remove(writterUserNo);
		for ( Long userNo : memberList) {
			boardDao.insertUnreadBoardCountByBoardNoAndUserNo(boardNo, userNo);
		}
		return retFlag;
	}
	public boolean deleteUnreadCountByUserNoAndBoardNo( Long userNo, Long boardNo ) {
		boolean retFlag = false;
		retFlag = boardDao.deleteUnreadCountByUserNoAndBoardNo(userNo, boardNo);
		return retFlag;
	}
	
	public boolean deleteUnreadCountByUserNo ( Long userNo ) {
		boolean retFlag = false;
		retFlag = boardDao.deleteUnreadCountByUserNo(userNo);
		return retFlag;
	}
	///////////////////////////////////////////////////////////////////
	
	public List<BoardVo> listBoard(Long classNo) {
		List<BoardVo> list = boardDao.getList(classNo);
		// List<BoardVo> list = boardDao.getList(Long classNo);
		// Map<String, Object> map = new HashMap<String, Object>();
		// map.put( "list", list );
		return list;
	}

	public BoardVo viewBoard(Long postNo) {
		BoardVo vo = boardDao.get(postNo);
		return vo;
	}

	public ClassVo viewBoardName(Long classNo) {
		ClassVo vo = boardDao.getStirng(classNo);
		return vo;
	}


	public void updateBoard(BoardVo vo) {
		boardDao.updateBoard(vo);
	}

	public void updateViewCount(Long postNo) {
		boardDao.updateViewCount(postNo);
	}

	public PostVo getPostVoByPostNo(Long postNo) {
		PostVo retVo = null;
		retVo = boardDao.getPostVoByPostNo(postNo);
		return retVo;
	}
	
	public void deleteBoard( Long postNo ){
		boardDao.delete(postNo );
	}	
	
	public BoardVo getClassNo( Long postNo ){
		BoardVo boardVo = boardDao.getClassNo(postNo);
		return boardVo;
	}

}
