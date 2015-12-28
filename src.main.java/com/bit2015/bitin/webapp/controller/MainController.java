package com.bit2015.bitin.webapp.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit2015.bitin.annotation.Auth;
import com.bit2015.bitin.annotation.AuthUser;
import com.bit2015.bitin.service.ChrisService;
import com.bit2015.bitin.service.ClassService;
import com.bit2015.bitin.service.UserService;
import com.bit2015.bitin.vo.UserVo;

@Controller("WebAppController")
@RequestMapping("/webapp")
public class MainController {
	@Autowired
	UserService userService;
	@Autowired
	ClassService classService;
	@Autowired
	ChrisService chrisService;

//	@Auth
	@RequestMapping("/index")
	public String index(
			Model model,
			@RequestParam(value="userId", required=false)String userId	) {
		System.out.println("userId : "+userId);
		UserVo userVo = chrisService.getUserVoViaUserId(userId);
		System.out.println("userVo : " +userVo);
		chrisService.getRecentChatsByUserNo(userVo.getUserNo());
		
		
		
		if( userVo!= null){
			List<UserVo> list = userService.classmateList(userVo);
			model.addAttribute( "classMate", list );
			List<UserVo> list2 = userService.classnameList(userVo);
			model.addAttribute( "className", list2 );
		}
		
		
		
		return "/junhyun-test/index2";
	}

	

}
