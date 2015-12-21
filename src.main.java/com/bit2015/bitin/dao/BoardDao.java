package com.bit2015.bitin.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bit2015.bitin.vo.BoardVo;

@Repository
public class BoardDao {
	
	@Autowired
	SqlSession sqlSession;

	public List<BoardVo> getList() {
		List<BoardVo> list = sqlSession.selectList( "board.selectListTemp");
		return list;
	
	}
	
	public void updateViewCount( Long no ) {
		sqlSession.update( "board.updateViewCount", no );
	}
	
	public BoardVo get( Long boardNo ) {
		BoardVo vo = sqlSession.selectOne( "board.selectByNo", boardNo );
		return vo;
	}
	
	public void insert( BoardVo vo ) {
		sqlSession.insert( "board.insert", vo );
	}
}
