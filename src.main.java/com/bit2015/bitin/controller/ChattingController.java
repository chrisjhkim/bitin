package com.bit2015.bitin.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.bind.annotation.ResponseBody;

import com.bit2015.bitin.annotation.AuthUser;
import com.bit2015.bitin.service.ChattingService;

import com.bit2015.bitin.vo.MessageVo;
import com.bit2015.bitin.vo.UserVo;


@Controller("ChattingController")		
@RequestMapping("/chatting")	
public class ChattingController {
	
	
	@Autowired
	ChattingService chattingService;

	/**
	 *            채팅  컨트롤러 아직 미완성( 기능구현은 다했는데 테스트를 안해봄)
	 */
	
	
	@RequestMapping("/list/{userNo}")
	public String aa (
			@PathVariable ("userNo") Long userNo, @AuthUser UserVo authUser, Model model ) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("fromUserNo", userNo);
		map.put("toUserNo", authUser.getUserNo());
		
		
		List<MessageVo> list = chattingService.list(map);
		model.addAttribute( "chatlist", list );
		System.out.println("/list/userNo chatList :_ "+list);
		model.addAttribute("toUserNo",  authUser.getUserNo());
		return "/message/list";
	}
	
//	@ResponseBody 
//	@RequestMapping("/list2")
//	public Map<String, Object> list(@AuthUser UserVo authUser, Model model ) {
//		System.out.println("리스트2222222      들어오는값" + authUser);
//		List<MessageVo> list = chattingService.list(authUser);
//		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("data", list);
//		model.addAttribute( "chatlist", list );
//		System.out.println("리스트2222222         반환값" + map.get("data"));
//		return map;
//	}
		
	@ResponseBody 
	@RequestMapping(value = "/send", method = RequestMethod.POST)
	public  Map<String, Object> send (@ModelAttribute MessageVo vo  ) {
		List<MessageVo> list = new ArrayList<MessageVo>();
		list = chattingService.send( vo );	
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put( "result", "success" );
		map.put( "data", list );
		
		return map;
	}
	

}
