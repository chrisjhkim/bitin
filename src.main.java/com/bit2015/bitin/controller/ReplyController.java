package com.bit2015.bitin.controller;




import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bit2015.bitin.service.ReplyService;

@Controller("ReplyController")
@RequestMapping("/reply")
public class ReplyController {

	@Autowired
	ReplyService replyService;


}