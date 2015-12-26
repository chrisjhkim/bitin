package com.bit2015.bitin.controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bit2015.bitin.service.ReplyService;
import com.bit2015.bitin.vo.ReplyVo;

@Controller("ReplyController")
@RequestMapping("/reply")
public class ReplyController {

	@Autowired
	ReplyService replyService;

	/*@RequestMapping("/view/{postNo}")
	public String viewReply(@PathVariable("postNo") Long postNo, Model model) {
		ReplyVo replyVo = replyService.getReplyByPostNo(postNo);
		model.addAttribute("replyVo", replyVo);
		return "/board/view";
	}*/

}