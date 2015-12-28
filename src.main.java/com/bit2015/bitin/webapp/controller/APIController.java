package com.bit2015.bitin.webapp.controller;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit2015.bitin.annotation.AuthUser;
import com.bit2015.bitin.service.ChattingService;
import com.bit2015.bitin.service.ChrisService;
import com.bit2015.bitin.vo.MessageVo;
import com.bit2015.bitin.vo.UserVo;

@Controller("WebAppAPIController")
@RequestMapping("/webapp-api")
public class APIController {
	@Autowired
	ChattingService chattingService;
	@Autowired
	ChrisService chrisService;
	
	@ResponseBody 
	@RequestMapping(value = "/send", method = RequestMethod.POST)
	public  Map<String, Object> send (
			@ModelAttribute MessageVo vo, 
//			@AuthUser UserVo authUser, 
			Model model) {
		System.out.println("sdafasfafwaefwae");
		System.out.println("/webapp-api/send messageVo:"+vo);
		List<MessageVo> list = new ArrayList<MessageVo>();
		String a = "";
		String az = vo.getMessage();
		if(a == az){
			
		}else{
			list = chattingService.send( vo );	
		}
		
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put( "result", "success" );
		map.put( "data", list );
		
		return map;
	}
	
	@ResponseBody 
	@RequestMapping("/apilist")
	public Map<String, Object> list(
			@RequestParam(value="toUserNo", required=false)Long userNo,
			@RequestParam(value="chrisTempUserNo", required=false)Long chrisTempUserNo,
//			@AuthUser UserVo authUser, 
			Model model ) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("fromUserNo", userNo);
		

		
		UserVo fakeAuthUser  = chrisService.getUserVoViaUserId( chrisService.getUserIdViaUserNo(chrisTempUserNo) );
		map.put("toUserNo", fakeAuthUser.getUserNo());
		List<MessageVo> list = chattingService.list(map);
		Map<String, Object> retmap = new HashMap<String, Object>();
		retmap.put("data", list);
		model.addAttribute( "chatlist", list );
		retmap.put("data2", ((MessageVo)list.get( list.size()-1 )).getCreatedDate() );
		
	
		
		
		return retmap;
	}
		

}
