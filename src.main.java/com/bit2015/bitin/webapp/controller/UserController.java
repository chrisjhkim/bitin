package com.bit2015.bitin.webapp.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bit2015.bitin.service.ChrisService;
import com.bit2015.bitin.service.NaviService;
import com.bit2015.bitin.service.UserService;
import com.bit2015.bitin.vo.UserVo;


@Controller("WebAppUserController")
@RequestMapping("/webapp-user")
public class UserController {
	@Autowired
	UserService userService;
	@Autowired
	ChrisService chrisService;
	@Autowired
	NaviService naviService;
	
	@RequestMapping("/profile")
	public String viewProfile(
			@RequestParam(value="myNo", required=true)Long myUserNo,
			@RequestParam(value="otherNo", required=true)Long otherUserNo, Model model) {
		System.out.println("/profile [myUserNo : "+myUserNo + "otherUserNo : "+otherUserNo+"]");
		
		//내 정보 처리
		UserVo fakeAuthUser= userService.getUserVo(myUserNo);
		if( fakeAuthUser!= null){
			Map<String, Object> naviDataMap = naviService.getNaviDataMap(fakeAuthUser.getUserNo()) ;
			model.addAttribute("naviDataMap", naviDataMap );
			model.addAttribute("fakeAuthUser", fakeAuthUser);
		}
		
		//상대방 정보 처리
		UserVo otherUserVo = userService.getUserVo(otherUserNo);
		model.addAttribute("otherUser", otherUserVo);
		
		return "/webapp/webapp-profile";
	}

}
