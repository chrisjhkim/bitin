package com.bit2015.bitin.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit2015.bitin.dao.BoardDao;
import com.bit2015.bitin.vo.BoardVo;

@Service
public class BoardService {
	
	@Autowired
	BoardDao boardDao;
	
	public Map<String, Object> listBoard() {
		
			List<BoardVo> list = boardDao.getList();
			Map<String, Object> map = new HashMap<String, Object>();
			map.put( "list", list );
			return map;
	}
	
	public BoardVo viewBoard( Long boardNo ){
		BoardVo vo = boardDao.get( boardNo );
		//boardDao.updateViewCount( boardNo );
		return vo;
	}
	
	public void writeBoard( BoardVo vo ){
		boardDao.insert( vo );
	}
}
