package com.bit2015.bitin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller("guestBookController")
@RequestMapping("/guestbook")
public class GuestBookController {
	
	@RequestMapping("/writeform")
	public String writeForm(){
		return "guestbook/writeform";
	}

	@RequestMapping("/list")
	public String list() {
		return "guestbook/list";
	}
}
