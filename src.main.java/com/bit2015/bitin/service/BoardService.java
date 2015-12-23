package com.bit2015.bitin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit2015.bitin.dao.BoardDao;
import com.bit2015.bitin.vo.BoardVo;
import com.bit2015.bitin.vo.ClassVo;

@Service
public class BoardService {
	
	@Autowired
	BoardDao boardDao;
	
	public List<BoardVo> listBoard(Long classNo) {
		List<BoardVo> list =boardDao.getList(classNo);
//			List<BoardVo> list = boardDao.getList(Long classNo);
//			Map<String, Object> map = new HashMap<String, Object>();
//			map.put( "list", list );
			return list;
	}
	
	public BoardVo viewBoard( Long boardNo ){
		BoardVo vo = boardDao.get( boardNo );
		boardDao.updateViewCount( boardNo );
		return vo;
	}

	public ClassVo viewBoardName( Long classNo ){
		ClassVo vo = boardDao.getStirng( classNo );
		return vo;
	}
	
	public void writeBoard( BoardVo vo ){
		boardDao.insert( vo );
		
	}
	public void updateBoard( BoardVo vo ){
		boardDao.updateBoard( vo );
	}
}
