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
import com.bit2015.bitin.service.UserService;
import com.bit2015.bitin.vo.MessageVo;
import com.bit2015.bitin.vo.UserVo;


@Controller("ChattingController")		
@RequestMapping("/chatting")	
public class ChattingController {
	
	
	@Autowired
	ChattingService chattingService;
	
	@Autowired
	UserService userService;

	/**
	 *            채팅  컨트롤러 아직 미완성( 기능구현은 다했는데 테스트를 안해봄)
	 */
	
	
	@RequestMapping("/list/{userNo}")
	public String aa (
			@PathVariable ("userNo") Long userNo, @AuthUser UserVo authUser, Model model ) {
		Map<String, Object> map = new HashMap<String, Object>();
		String userName = userService.getUserNamebyUserNo(userNo);
		map.put("fromUserNo", userNo);
		map.put("toUserNo", authUser.getUserNo());
		List<MessageVo> list = chattingService.list(map);
		model.addAttribute( "chatlist", list );
		model.addAttribute("toUserNo",  userNo);
		model.addAttribute("userName", userName);
		int a = list.size();
		if(a==0){
			
		}else{
		model.addAttribute("lastTime", (   (MessageVo)list.get( a-1 )).getCreatedDate());		
		}
		
		
		

		if( authUser!= null){
			List<UserVo> list1 = userService.classmateList(authUser);
			model.addAttribute( "classMate", list1 );
			List<UserVo> list2 = userService.classnameList(authUser);
			model.addAttribute( "className", list2 );
		}
		return "/message/list";
	}
	
	@ResponseBody 
	@RequestMapping("/list2/{userNo}")
	public Map<String, Object> list(@PathVariable ("userNo") Long userNo, @AuthUser UserVo authUser, Model model ) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("fromUserNo", userNo);
		map.put("toUserNo", authUser.getUserNo());
		List<MessageVo> list = chattingService.list(map);
		Map<String, Object> retmap = new HashMap<String, Object>();
		retmap.put("data", list);
		model.addAttribute( "chatlist", list );
		retmap.put("data2", ((MessageVo)list.get( list.size()-1 )).getCreatedDate() );
		
	
		
		
		return retmap;
	}
		
	
	@ResponseBody 
	@RequestMapping(value = "/send", method = RequestMethod.POST)
	public  Map<String, Object> send (@ModelAttribute MessageVo vo, @AuthUser UserVo authUser, Model model) {
		System.out.println("sdafasfafwaefwae");
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
	

}
