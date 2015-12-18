package com.bit2015.bitin.webapi.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit2015.bitin.service.MessageService;

@Controller("messageAPIController")
@RequestMapping("/api/message")
public class MessageController {

	@Autowired
	MessageService messageService;
	

	
	
	/**
	 *            메세지 컨트롤러 아직 미완성( 기능구현은 다했는데 테스트를 안해봄)
	 */
	@ResponseBody
	@RequestMapping("/messagelist")
	public Map<String, Object> messageList(
			@RequestParam(value = "userId", required=false)String userId	) {
		
		HashMap<String, Object> retMap = new HashMap<String, Object>();
		List<String> retList = messageService.getMessageList(userId);
		
		retMap.put("result", "success");
		retMap.put("data", retList);
		
		
		/*if( 문제){
			retMap.put("result", "fail");
			retMap.put("message", "실패이유");
		}*/
		
		return retMap;
	}
	
	@ResponseBody 
	@RequestMapping("/sendmessagelist")
	public Map<String, Object> sendMessageList (
			@RequestParam(value = "userId", required=false)String userId	) {
		
		HashMap<String, Object> retMap = new HashMap<String, Object>();
		List<String> retList = messageService.getSendMessageList(userId);
		
		retMap.put("result", "success");
		retMap.put("data", retList);
		
		
		/*if( 문제){
			retMap.put("result", "fail");
			retMap.put("message", "실패이유");
		}*/
		
		return retMap;
	}
	
	
	
	
	@ResponseBody 
	@RequestMapping("/send")
	public boolean sendMessage (
			@RequestBody HashMap<String, Object> map  ) {
		System.out.println("@Message Controller : messageSend : "+map);
		boolean retFlag = false;
		retFlag = messageService.sendMessage(map);
		return retFlag;
	}

}
