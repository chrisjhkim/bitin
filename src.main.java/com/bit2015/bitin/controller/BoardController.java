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

import com.bit2015.bitin.service.BoardService;
import com.bit2015.bitin.service.ReplyService;
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

	@RequestMapping("/writeform/{classNo}")
	public String writeForm(@PathVariable("classNo") Long classNo, Model model) {
		model.addAttribute("classNo", classNo);
		model.addAttribute("boardType", 1L);
		return "/board/writeform";
	}

	@RequestMapping("/list/modifyform/{boardNo}")
	public String modifyform(@PathVariable("boardNo") Long boardNo, Model model) {
		BoardVo vo = boardService.viewBoard(boardNo);
		model.addAttribute("vo", vo);
		return "/board/modifyform";
	}

	/**
	 * @param model
	 * @return map("listData",게시판글목록을 list에 담고 그거다시 map에 담아서 리턴)
	 */
	@RequestMapping("/list/{classNo}")
	public String list(@PathVariable("classNo") Long classNo, Model model) {

		List<BoardVo> list = boardService.listBoard(classNo);
		model.addAttribute("list", list);
		ClassVo vo = boardService.viewBoardName(classNo);
		model.addAttribute("vo", vo);
		return "/board/list";
	}

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

	/**
	 * @param no
	 * @param model
	 * @return boardNo,title,content,userNo
	 */

	@RequestMapping("/view/{postNo}")
	public String viewForm(@PathVariable("postNo") Long postNo, Model model) {
		BoardVo boardVo = boardService.getPostByPostNo(postNo);
		List<ReplyVo> replyVo = replyService.getReplyByPostNo(postNo);
		System.out.println("replyVo cont" + replyVo);
		model.addAttribute("boardVo", boardVo);
		boardService.updateViewCount(postNo);
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

	@RequestMapping("")
	public String insertReply(@RequestParam(value="classNO")Long classNo,@RequestParam(value = "reply") String reply, Model model, HttpSession session, @ModelAttribute BoardVo vo) {
		UserVo authUser = (UserVo) session.getAttribute("authUser");
		if (authUser == null) {
			return "redirect:/board";
		}
		vo.setUserNo(authUser.getUserNo());
		boardService.writeReply(vo);
		
		return "redirect:/board/list/" + classNo;
	}

}