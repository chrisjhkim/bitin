package com.bit2015.bitin.webapp.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bit2015.bitin.service.ChrisService;
import com.bit2015.bitin.service.UserService;
import com.bit2015.bitin.vo.UserVo;


@Controller("WebAppUserController")
@RequestMapping("/webapp-user")
public class UserController {
	@Autowired
	UserService userService;
	@Autowired
	ChrisService chrisService;
	
	@RequestMapping("/profile")
	public String viewProfile(
			@RequestParam(value="myNo", required=true)Long myUserNo,
			@RequestParam(value="otherNo", required=true)Long otherUserNo, Model model) {
		System.out.println("/profile [myUserNo : "+myUserNo + "otherUserNo : "+otherUserNo+"]");
		
		UserVo userVo = userService.getProfilebyUserNo(otherUserNo);
		String myUserId = chrisService.getUserIdViaUserNo(myUserNo);
		UserVo myUserVo = chrisService.getUserVoViaUserId(myUserId);
		model.addAttribute("userVo", userVo);
		model.addAttribute("userNo", otherUserNo);
		model.addAttribute("myNo", myUserNo);
		model.addAttribute("otherNo", otherUserNo);
		if( myUserVo!= null){
			List<UserVo> classMateList = userService.getClassmateList(myUserVo);
			model.addAttribute( "classMate", classMateList );
			List<UserVo> list2 = userService.classnameList(myUserVo);
			model.addAttribute( "className", list2 );
			model.addAttribute("authUser", myUserVo);
			
			List<HashMap<String, Object>> recentChatList = chrisService.getRecentChatsByUserNo(myUserVo.getUserNo());
			model.addAttribute("recentChatList", recentChatList);
			
		}
		
		return "/webapp/webapp-profile";
	}

}
