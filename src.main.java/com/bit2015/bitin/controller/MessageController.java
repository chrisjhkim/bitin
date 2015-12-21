package com.bit2015.bitin.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;




@Controller("MessageController")
@RequestMapping("/message")
public class MessageController {

/*
	@Autowired
	MessageService messageService;
	
*/	
	@RequestMapping("/list")
	public String writeForm(){
		return "/message/list";
	}
	
}
