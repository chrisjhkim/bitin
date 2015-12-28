package com.bit2015.bitin.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bit2015.bitin.annotation.AuthUser;
import com.bit2015.bitin.service.BoardService;
import com.bit2015.bitin.service.ChrisService;
import com.bit2015.bitin.service.ReplyService;
import com.bit2015.bitin.service.UserService;
import com.bit2015.bitin.vo.BoardVo;
import com.bit2015.bitin.vo.ClassVo;
import com.bit2015.bitin.vo.ReplyVo;
import com.bit2015.bitin.vo.UserVo;

@Controller("BoardController")
@RequestMapping("/board")
public class BoardController {

	@Autowired
	BoardService boardService;
	@Autowired
	ReplyService replyService;
	@Autowired
	ChrisService chrisService;
	@Autowired
	UserService userService;

	@RequestMapping("/writeform/{classNo}")
	public String writeForm(@AuthUser UserVo authUser, @PathVariable("classNo") Long classNo, Model model) {
		model.addAttribute("classNo", classNo);
		model.addAttribute("boardType", 1L);
		if( authUser!= null){
			List<UserVo> list1 = userService.classmateList(authUser);
			model.addAttribute( "classMate", list1 );
			List<UserVo> list2 = userService.classnameList(authUser);
			model.addAttribute( "className", list2 );
		}
		return "/board/writeform";
	}

	@RequestMapping("/modifyform/{postNo}")
	public String modifyform(@AuthUser UserVo authUser, @PathVariable("postNo") Long postNo, Model model) {
		BoardVo boardVo = boardService.getPostByPostNo(postNo);
		model.addAttribute("boardVo", boardVo);
		if( authUser!= null){
			List<UserVo> list1 = userService.classmateList(authUser);
			model.addAttribute( "classMate", list1 );
			List<UserVo> list2 = userService.classnameList(authUser);
			model.addAttribute( "className", list2 );
		}
		return "/board/modifyform";
	}
	
	@RequestMapping("/modify")
	public String modify(@RequestParam(value = "content") String content, @RequestParam(value = "title") String title,
			@RequestParam(value = "postNo") Long postNo, HttpSession session, @ModelAttribute BoardVo vo) {
		UserVo authUser = (UserVo) session.getAttribute("authUser");

		if (authUser == null) {
			return "redirect:/board";
		}
		boardService.updateBoard(vo);

		return "redirect:/board/view/" + postNo;
	}
	
	

	/**
	 * @param model
	 * @return map("listData",게시판글목록을 list에 담고 그거다시 map에 담아서 리턴)
	 */
	@RequestMapping("/list/{classNo}")
	public String list(@AuthUser UserVo authUser, @PathVariable("classNo") Long classNo, Model model) {

		List<BoardVo> list = boardService.listBoard(classNo);
		model.addAttribute("list", list);
		ClassVo vo = boardService.viewBoardName(classNo);
		model.addAttribute("vo", vo);
		if( authUser!= null){
			List<UserVo> list1 = userService.classmateList(authUser);
			model.addAttribute( "classMate", list1 );
			model.addAttribute("classMateSize", list1.size());
			List<UserVo> list2 = userService.classnameList(authUser);
			model.addAttribute( "className", list2 );
		}
		return "/board/list";
	}
/*
	@RequestMapping("/update")
	public String update(HttpSession session, @ModelAttribute BoardVo vo) {
		UserVo authUser = (UserVo) session.getAttribute("authUser");

		if (authUser == null) {
			return "redirect:/bitin/index";
		}
		vo.setUserNo(authUser.getUserNo());
		boardService.updateBoard(vo);

		return "redirect:/board";
	}

*/	
	/**
	 * @param no
	 * @param model
	 * @return boardNo,title,content,userNo
	 */

	@RequestMapping("/view/{postNo}")
	public String viewForm(@AuthUser UserVo authUser, @PathVariable("postNo") Long postNo, Model model) {
		BoardVo boardVo = boardService.getPostByPostNo(postNo);
		model.addAttribute("boardVo", boardVo);
		List<ReplyVo> list = replyService.getReplyByPostNo(postNo);
		model.addAttribute("list", list);
		boardService.updateViewCount(postNo);
		if( authUser!= null){
			List<UserVo> list1 = userService.classmateList(authUser);
			model.addAttribute( "classMate", list1 );
			model.addAttribute("classMateSize", list1.size());
			List<UserVo> list2 = userService.classnameList(authUser);
			model.addAttribute( "className", list2 );
		}
		return "/board/view";
	}

	@RequestMapping("/insert")
	public String insert(@RequestParam(value = "content") String content, @RequestParam(value = "title") String title,
			@RequestParam(value = "classNo") Long classNo, HttpSession session, @ModelAttribute BoardVo vo) {
		UserVo authUser = (UserVo) session.getAttribute("authUser");

		if (authUser == null) {
			return "redirect:/board";
		}
		vo.setUserNo(authUser.getUserNo());
		boardService.writeBoard(vo);

		return "redirect:/board/list/" + classNo;
	}
	
	@RequestMapping("/reply")
	public String insert(@RequestParam(value = "reply") String reply,
			@RequestParam(value = "postNo") Long postNo, HttpSession session, @ModelAttribute ReplyVo vo) {
		UserVo authUser = (UserVo) session.getAttribute("authUser");
		if (authUser == null) {
			return "redirect:/bitin/index";
		}
		vo.setUserNo(authUser.getUserNo());
		replyService.writeReply(vo);

		return "redirect:/board/view/" + postNo;
	}
	
	@RequestMapping( "/delete/{postNo}" )
	public String delete(@PathVariable( "postNo" ) Long postNo) {
		Long classNo = chrisService.getClassNoViaPostNo(postNo);
		boardService.deleteBoard(postNo);
		return "redirect:/board/list/" + classNo;
	}	


}