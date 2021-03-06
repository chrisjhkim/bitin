package com.bit2015.bitin.webapp.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit2015.bitin.annotation.Auth;
import com.bit2015.bitin.annotation.AuthUser;
import com.bit2015.bitin.service.AttdService;
import com.bit2015.bitin.service.BoardService;
import com.bit2015.bitin.service.ChattingService;
import com.bit2015.bitin.service.ChrisService;
import com.bit2015.bitin.service.ClassService;
import com.bit2015.bitin.service.NaviService;
import com.bit2015.bitin.service.UserService;
import com.bit2015.bitin.vo.BoardVo;
import com.bit2015.bitin.vo.MessageVo;
import com.bit2015.bitin.vo.PostVo;
import com.bit2015.bitin.vo.UserVo;

@Controller("WebAppController")
@RequestMapping("/webapp")
public class MainController {
	@Autowired
	NaviService naviService;
	@Autowired
	UserService userService;
	@Autowired
	ClassService classService;
	@Autowired
	ChrisService chrisService;
	@Autowired
	ChattingService chattingService;
	@Autowired
	BoardService boardService;
	@Autowired
	AttdService attdService;

	//메인 페이지
	@RequestMapping("/index")
	public String index(
			@RequestParam(value="id", required=false)String userId,	
			Model model) {
		System.out.println("/webapp/index input userId : "+userId);
		
		UserVo userVo = chrisService.getUserVoViaUserId(userId);
		System.out.println("userVo : "+userVo);
		if( userVo!= null){
			Map<String, Object> naviDataMap = naviService.getNaviDataMap(userVo.getUserNo()) ;
			System.out.println("naviDataMap : "+naviDataMap);
			model.addAttribute("naviDataMap", naviDataMap );
			model.addAttribute("fakeAuthUser", userVo);
		}
		
		return "/webapp/webapp-index";
	}
	// 투표 chart 페이지
	@RequestMapping("/chart")
	public String viewChart(
			@RequestParam(value="userNo", required=true)Long userNo,	
			Model model) {
		System.out.println("/webapp/chart input [userNo:"+userNo+"]");
		
		UserVo userVo = userService.getUserVo(userNo);
		System.out.println("userVo : "+userVo);
		if( userVo!= null){
			Map<String, Object> naviDataMap = naviService.getNaviDataMap(userVo.getUserNo()) ;
			System.out.println("naviDataMap : "+naviDataMap);
			model.addAttribute("naviDataMap", naviDataMap );
			model.addAttribute("fakeAuthUser", userVo);
		}
		
		return "/webapp/charts/webapp-chart";
	}
	//출결 페이지
	@RequestMapping("/attd")
	public String attendance(
			@RequestParam(value="userId", required=true)String userId,	
			@RequestParam(value="classNo", required=true)Long classNo,	
			@RequestParam(value="from", required=false, defaultValue="2015 01 01")String startDate,	
			@RequestParam(value="to", required=false, defaultValue="2015 12 31")String endDate,	
			Model model) {
		System.out.println("/webapp/attd input [ID:"+userId+"/classNo:"+classNo+"]");
		System.out.println("/webapp/attd input [from:"+startDate+"/to:"+endDate+"]");
		
		UserVo userVo = chrisService.getUserVoViaUserId(userId);
//		System.out.println("userVo : "+userVo);
		if( userVo!= null){
			Map<String, Object> naviDataMap = naviService.getNaviDataMap(userVo.getUserNo()) ;
//			System.out.println("naviDataMap : "+naviDataMap);
			model.addAttribute("naviDataMap", naviDataMap );
			model.addAttribute("fakeAuthUser", userVo);
		}
		model.addAttribute("classNo",classNo);
		
		HashMap<String, Object> attdDataMap =attdService.getAttdDataMapByClassNoAndDates(classNo, startDate, endDate);
		model.addAttribute("attdDataMap",attdDataMap);
		
		return "/webapp/user/webapp-attd";
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
		model.addAttribute("otherNo", otherUserNo);
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
			List<UserVo> classMateList = userService.getClassmateList(myUserVo);
			model.addAttribute( "classMate", classMateList );
			List<UserVo> list2 = userService.classnameList(myUserVo);
			model.addAttribute( "className", list2 );
			model.addAttribute("authUser", myUserVo);
			
			List<HashMap<String, Object>> recentChatList = chrisService.getRecentChatsByUserNo(myUserVo.getUserNo());
			model.addAttribute("recentChatList", recentChatList);
			
		}
		
		
		return "/hyunjuntest/temp-chatlist";
	}

	//체팅 페이지
	@RequestMapping("/chat-view")
	public String chatView (
			@RequestParam(value="myNo", required=true, defaultValue="10")Long myUserNo,
			@RequestParam(value="otherNo", required=true, defaultValue="19")Long otherUserNo,
			Model model ) {
		System.out.println("/chat-view [myNo : "+myUserNo+" / otherUserNo :"+otherUserNo+"]");

		//내 정보 처리
		UserVo myUserVo= userService.getUserVo(myUserNo);
		//상대방 정보 처리
		UserVo otherUserVo = userService.getUserVo(otherUserNo);
		model.addAttribute("otherUser", otherUserVo);
		//채팅 읽음 처리로 바꾸기
		chattingService.deleteUnreadCountByUserNoAndOtherUserNo(myUserVo.getUserNo(), otherUserVo.getUserNo());
		
		//네비 메뉴
		if( myUserVo!= null){
			Map<String, Object> naviDataMap = naviService.getNaviDataMap(myUserVo.getUserNo()) ;
			model.addAttribute("naviDataMap", naviDataMap );
			model.addAttribute("fakeAuthUser", myUserVo);
		}
		
		
		//채팅 기록들 불러오기
		List<MessageVo>chatList = chattingService.getChatList(otherUserNo, myUserVo.getUserNo());
		model.addAttribute( "chatlist", chatList );
		
		
		return "/webapp/chatting/chat-view";
	}
	

}
