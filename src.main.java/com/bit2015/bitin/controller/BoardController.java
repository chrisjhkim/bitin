package com.bit2015.bitin.controller;		
		
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;		
import org.springframework.stereotype.Controller;		
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;		
import org.springframework.web.bind.annotation.RequestMapping;		
		
		
import com.bit2015.bitin.service.BoardService;		
import com.bit2015.bitin.vo.BoardVo;
import com.bit2015.bitin.vo.UserVo;
		
		
		
@Controller("BoardController")		
@RequestMapping("/board")		
public class BoardController {		
		
		
	@Autowired		
	BoardService boardService;		
			
	@RequestMapping("/writeform")		
	public String writeForm(){		
		return "/board/writeform";		
	}
	@RequestMapping("/view")		
	public String viewForm(){		
		return "/board/view";		
	}		
			
	/**		
	 * @param model		
	 * @return map("listData",게시판글목록을 list에 담고 그거다시 map에 담아서 리턴)		
	 */		
	@RequestMapping("/list")		
	public String list(Model model){		
				
		Map<String, Object> map = boardService.listBoard();		
		model.addAttribute( "listData", map );		
				
		return "/board/list";		
	}	
	
			
	/**		
	 * @param no		
	 * @param model		
	 * @return boardNo,title,content,userNo		
	 */		
	@RequestMapping( "/view/{boardNo}" )		
	public String view( @PathVariable( "boardNo" ) Long boardNo, Model model ) {		
		BoardVo vo = boardService.viewBoard( boardNo );		
		model.addAttribute( "vo", vo );		
		return "/board/view";		
	}		
	
	@RequestMapping( "/insert" )
	public String insert( HttpSession session, @ModelAttribute BoardVo vo ) {
		UserVo authUser = (UserVo) session.getAttribute("authUser");
		// 로그인 사용자 체크
		if( authUser == null ) {
			return "redirect:/board";
		}
		vo.setUserNo( authUser.getUserNo() );
		boardService.writeBoard( vo );
		
		return "redirect:/board/list";
	}
}