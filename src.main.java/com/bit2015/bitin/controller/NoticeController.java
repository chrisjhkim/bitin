package com.bit2015.bitin.controller;

import java.util.HashMap;
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
import com.bit2015.bitin.service.NoticeService;
import com.bit2015.bitin.service.ReplyService;
import com.bit2015.bitin.service.UserService;
import com.bit2015.bitin.vo.BoardVo;
import com.bit2015.bitin.vo.ClassVo;
import com.bit2015.bitin.vo.NoticeVo;
import com.bit2015.bitin.vo.ReplyVo;
import com.bit2015.bitin.vo.UserVo;

@Controller("NoticeController")
@RequestMapping("/notice")
public class NoticeController {

	@Autowired
	BoardService boardService;
	@Autowired
	ReplyService replyService;
	@Autowired
	ChrisService chrisService;
	@Autowired
	UserService userService;
	@Autowired
	NoticeService noticeService;
	

	@RequestMapping("/list")
	public String list(
			@RequestParam(value = "classNo")Long classNo,
			@RequestParam(value = "userNo")Long userNo,
			Model model) {
		UserVo authUser = chrisService.getUserVoViaUserId(chrisService.getUserIdViaUserNo(userNo));
		List<NoticeVo> list = noticeService.listBoard(classNo);
		model.addAttribute("list", list);
		//ClassVo vo = noticeService.viewNoticeName(classNo);
		//model.addAttribute("vo", vo);
		if( authUser!= null){
			model.addAttribute("myNo", authUser.getUserNo());
			List<UserVo> list1 = userService.classmateList(authUser);
			model.addAttribute( "classMate", list1 );
			model.addAttribute("classMateSize", list1.size());
			List<UserVo> list2 = userService.classnameList(authUser);
			model.addAttribute( "className", list2 );
			List<HashMap<String, Object>> recentChatList = chrisService.getRecentChatsByUserNo(authUser.getUserNo());
			model.addAttribute("recentChatList", recentChatList);
			
			model.addAttribute("authUser",authUser);
		}
		return "/notice/list";
	}

	@RequestMapping("/view/{noticeNo}")
	public String viewForm(
		@AuthUser UserVo authUser, 
		@PathVariable("noticeNo") Long noticeNo, Model model) {
		NoticeVo noticeVo = noticeService.getNoticeByNoticeNo(noticeNo);
		model.addAttribute("noticeVo", noticeVo);
		//List<ReplyVo> list = replyService.getReplyByNoticeNo(noticeNo);
		//model.addAttribute("list", list);
		if( authUser!= null){
			List<UserVo> list1 = userService.classmateList(authUser);
			model.addAttribute( "classMate", list1 );
			model.addAttribute("classMateSize", list1.size());
			List<UserVo> list2 = userService.classnameList(authUser);
			model.addAttribute( "className", list2 );
		}
		return "/notice/view";
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

}