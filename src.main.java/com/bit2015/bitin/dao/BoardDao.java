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
	 *  update 글 수정
	 */
	public void updateBoard( BoardVo vo ) {
		sqlSession.update( "board.update", vo );
	}
	
	public List<BoardVo> getList(Long classNo) {
		System.out.println("classNo: "+classNo);
		List<BoardVo> list = sqlSession.selectList( "board.selectList", classNo);
		System.out.println("list test2" + list);
		return list;
	
	}

	public ClassVo getStirng( Long classNo ) {
		System.out.println("test : " + classNo);
		ClassVo vo = sqlSession.selectOne( "board.selectBoardName", classNo );
		System.out.println("daovo : " + vo);
		return vo;
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
