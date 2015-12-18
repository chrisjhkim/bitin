package com.bit2015.bitin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit2015.bitin.service.ChattingService;
import com.bit2015.bitin.service.MessageService;

@Controller("ChattingController")		
@RequestMapping("/Chatting")	
public class ChattingController {
	
	
	@Autowired
	ChattingService chattingService;

	/**
	 *            채팅  컨트롤러 아직 미완성( 기능구현은 다했는데 테스트를 안해봄)
	 */
	@ResponseBody
	@RequestMapping("/list")
	public Map<String, Object> list(
			@RequestBody HashMap<String, Object> map) {
		
		HashMap<String, Object> retMap = new HashMap<String, Object>();
		List<String> retList = chattingService.list(map);
		
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
	public boolean send (
			@RequestBody HashMap<String, Object> map  ) {
		System.out.println("@chatting Controller : Send : "+map);
		boolean retFlag = false;
		retFlag = chattingService.send(map);
		return retFlag;
	}
}
