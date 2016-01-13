package com.bit2015.bitin.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bit2015.bitin.vo.BoardVo;
import com.bit2015.bitin.vo.ClassVo;
import com.bit2015.bitin.vo.PostVo;

@Repository
public class BoardDao {

	@Autowired
	SqlSession sqlSession;
	
	public List<HashMap<String, Object>> getBoardListByClassNo (Long classNo ) {
		List<HashMap<String, Object>> retList = null;
		retList = sqlSession.selectList("board.getBoardListByClassNo", classNo);
		return retList;
	}
	
	public List<PostVo> getPostListByBoardNo ( Long boardNo ) {
		List<PostVo> retList = null;
		retList = sqlSession.selectList("board.getPostListByBoardNo", boardNo );
		return retList;
	}
	
	public HashMap<String, Object> getPostInfoByPostNo (Long postNo ) {
		HashMap<String, Object > retMap = null;
		retMap = sqlSession.selectOne("board.getBoardVoByPostNo",postNo);
		return retMap;
	}
	public PostVo getPostVoByPostNo(Long postNo) {
		PostVo retVo = null;
		retVo = sqlSession.selectOne("board.getPostVoByPostNo", postNo);
		return retVo;
	}
	
	public boolean updatePost ( PostVo postVo ) {
		boolean retFlag = false;
		retFlag = (1 == sqlSession.update("board.updatePost",postVo));
		return retFlag;
	}
	
	public boolean deletePostByPostNo ( Long postNo ) {
		boolean retFlag = false;
		retFlag = (1== sqlSession.delete("board.deletePostByPostNo",postNo));
		return retFlag;
	}
	
	public Long getPrevPostNoByPostNo (Long postNo ) {
		Long retLong = null;
		retLong = sqlSession.selectOne("board.getPrevPostNoByPostNo", postNo);
		return retLong;
	}
	public Long getNextPostNoByPostNo (Long postNo ) {
		Long retLong = null;
		retLong = sqlSession.selectOne("board.getNextPostNoByPostNo", postNo);
		return retLong;
	}

	public BoardVo getBoardVoByBoardNo (Long boardNo ) { 
		BoardVo retVo = null;
		retVo = sqlSession.selectOne("board.getBoardVoByBoardNo", boardNo);
		return retVo;
	}
	public boolean insertPost(PostVo postVo) {
		boolean retFlag = false;
		retFlag = (1== sqlSession.insert("board.insertPost", postVo) );
		return retFlag;
	}
	
	public List<HashMap<String, Object>> getRecentReadBoardListByUserNo (Long userNo) {
		List<HashMap<String, Object>> retList = null;
		retList = sqlSession.selectList("board.getRecentReadBoardListByUserNo",userNo);
		return retList;
	}
	
	public List<HashMap<String, Object>> getRecentUnreadBoardListByUserNo ( Long userNo ) {
		List<HashMap<String, Object>> retList = null;
		retList = sqlSession.selectList("board.getRecentUnreadBoardListByUserNo", userNo);
		return retList;
	}
	
	
	public List<Long> getMemberNoListByBoardNo ( Long boardNo ) {
		List<Long > retList = null;
		retList = sqlSession.selectList("board.getMemberNoListByBoardNo", boardNo);
		return retList;
	}
	public boolean insertUnreadBoardCountByBoardNoAndUserNo(Long boardNo, Long userNo) {
		boolean retFlag = false;
		HashMap<String, Object> inputMap  =new HashMap<String, Object>();
		inputMap.put("boardNo", boardNo);
		inputMap.put("userNo", userNo);
		retFlag = (1 == sqlSession.insert("board.insertUnreadCount", inputMap) );
		return retFlag;
	}
	
	public boolean deleteUnreadCountByUserNoAndBoardNo( Long userNo, Long boardNo ) {
		boolean retFlag = false;
		HashMap<String, Object> inputMap = new HashMap<String, Object>();
		inputMap.put("boardNo", boardNo);
		inputMap.put("userNo", userNo);
		retFlag = (0 < sqlSession.delete("board.deleteUnreadCountByUserNoAndBoardNo",inputMap));
		return retFlag;
	}
	
	public Long getTotalUnreadBoardCountByUserNo (Long userNo ) {
		Long retLong = null;
		retLong = sqlSession.selectOne("board.getTotalUnreadBoardCountByUserNo", userNo);
		return retLong;
	}
	public boolean deleteUnreadCountByUserNo ( Long userNo ) {
		boolean retFlag = false;
		retFlag = ( 0 < sqlSession.delete("board.deleteUnreadCountByUserNo",userNo) );
		return retFlag;
	}
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////아래꺼 전부 다 다시해야될지도 ///////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/*
	 * update 글 수정
	 */
	public void updateBoard(BoardVo vo) {
		sqlSession.update("board.update", vo);
	}
	
	public void delete(Long postNo ) {
		sqlSession.delete( "board.delete", postNo );
	}

	public List<BoardVo> getList(Long classNo) {
		List<BoardVo> list = sqlSession.selectList("board.selectList", classNo);
		return list;

	}

	public ClassVo getStirng(Long classNo) {
		ClassVo vo = sqlSession.selectOne("board.selectBoardName", classNo);
		return vo;
	}

	public void updateViewCount(Long postNo) {
		sqlSession.update("board.updateViewCount", postNo);
	}

	public BoardVo get(Long postNo) {
		BoardVo vo = sqlSession.selectOne("board.selectByNo", postNo);
		return vo;
	}


	
	public void update( BoardVo vo ) {
		sqlSession.update( "board.update", vo );
	}
	
	public BoardVo getClassNo( Long postNo ) {
		BoardVo boardVo = sqlSession.selectOne( "board.selectClassNobyPostNo", postNo );
		return boardVo;
	}
	
	
}
