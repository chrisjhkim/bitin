package com.bit2015.bitin.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bit2015.bitin.vo.BoardVo;
import com.bit2015.bitin.vo.ClassVo;

@Repository
public class BoardDao {

	@Autowired
	SqlSession sqlSession;

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

	public void insert(BoardVo vo) {
		sqlSession.insert("board.insert", vo);
	}

	public BoardVo getPostByPostNo(Long postNo) {
		BoardVo retVo = null;
		retVo = sqlSession.selectOne("board.getPostByPostNo", postNo);
		return retVo;
	}
	
	public void update( BoardVo vo ) {
		sqlSession.update( "board.update", vo );
	}
	
	public BoardVo getClassNo( Long postNo ) {
		BoardVo boardVo = sqlSession.selectOne( "board.selectClassNobyPostNo", postNo );
		return boardVo;
	}
	
}
