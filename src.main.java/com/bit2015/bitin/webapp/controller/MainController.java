package com.bit2015.bitin.webapp.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit2015.bitin.annotation.Auth;
import com.bit2015.bitin.annotation.AuthUser;
import com.bit2015.bitin.service.ChattingService;
import com.bit2015.bitin.service.ChrisService;
import com.bit2015.bitin.service.ClassService;
import com.bit2015.bitin.service.UserService;
import com.bit2015.bitin.vo.MessageVo;
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
	@Autowired
	ChattingService chattingService;

//	@Auth
	@RequestMapping("/index")
	public String index(
			Model model,
		
			@RequestParam(value="userId", required=false)String userId	) {
		System.out.println("userId : "+userId);
		UserVo userVo = chrisService.getUserVoViaUserId(userId);
		System.out.println("userVo : " +userVo);
		
		
		
		if( userVo!= null){
			List<UserVo> list = userService.classmateList(userVo);
			model.addAttribute( "classMate", list );
			List<UserVo> list2 = userService.classnameList(userVo);
			model.addAttribute( "className", list2 );
			model.addAttribute("authUser", userVo);
			
			List<HashMap<String, Object>> recentChatList = chrisService.getRecentChatsByUserNo(userVo.getUserNo());
			model.addAttribute("recentChatList", recentChatList);
			
		}
		
		
		
		
		
		return "/junhyun-test/index2";
	}

	
	@RequestMapping("/chatting")
	public String chatting (
			@RequestParam(value="myNo", required=false)Long myUserNo,
			@RequestParam(value="otherNo", required=false)Long otherUserNo,
//			@PathVariable ("userNo") Long userNo, 
//			@AuthUser UserVo authUser, 
			Model model ) {
		
		
		String otherUserName = userService.getUserNamebyUserNo(otherUserNo);
		model.addAttribute("myNo", myUserNo);
		System.out.println("ㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱ" + myUserNo);
		String myUserId = chrisService.getUserIdViaUserNo(myUserNo);
		UserVo myUserVo = chrisService.getUserVoViaUserId(myUserId);
		model.addAttribute("authUser", myUserVo);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("toUserNo", myUserVo.getUserNo());
		map.put("fromUserNo", otherUserNo);
		
		List<MessageVo> list = chattingService.list(map);
		model.addAttribute( "chatlist", list );
		model.addAttribute("toUserNo",  otherUserNo);
		model.addAttribute("userName", otherUserName);
		int a = list.size();
		if(a==0){
			
		}else{
		model.addAttribute("lastTime", (   (MessageVo)list.get( a-1 )).getCreatedDate());		
		}
		
		
		

		if( myUserVo!= null){
			List<UserVo> classMateList = userService.classmateList(myUserVo);
			model.addAttribute( "classMate", classMateList );
			List<UserVo> list2 = userService.classnameList(myUserVo);
			model.addAttribute( "className", list2 );
			model.addAttribute("authUser", myUserVo);
			
			List<HashMap<String, Object>> recentChatList = chrisService.getRecentChatsByUserNo(myUserVo.getUserNo());
			model.addAttribute("recentChatList", recentChatList);
			
		}
		
		
		return "/message/api-chatting-list";
	}
	

}
