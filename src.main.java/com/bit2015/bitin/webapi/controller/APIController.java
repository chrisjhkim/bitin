package com.bit2015.bitin.webapi.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit2015.bitin.annotation.AuthUser;
import com.bit2015.bitin.service.BoardService;
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
	@Autowired
	BoardService boardService;
	
	@ResponseBody 
	@RequestMapping(value = "/send", method = RequestMethod.POST)
	public  Map<String, Object> saveSentMessage (
			@ModelAttribute MessageVo vo, 
			Model model) {
		System.out.println("/webapp-api/send input messageVo:"+vo);
		Map<String, Object> returnMap = new HashMap<String, Object>();
		String result = "fail";
		
		
		if( vo==null || vo.getMessage()==null || vo.getFromUserNo()==null || vo.getToUserNo()== null){
			
		}else{
			result = (chattingService.insertMessageAndUpdateUnreadCount(vo))? "success" : "fail";
		}
		
		returnMap.put( "result", result );
		System.out.println("/webapp-api/send retMap :"+ returnMap);
		return returnMap;
	}
	@ResponseBody 
	@RequestMapping(value = "/delete-unread-count", method = RequestMethod.POST)
	public  Map<String, Object> deleteUnreadCount (
			@RequestParam(value="myUserNo", required=true)Long myUserNo,
			@RequestParam(value="otherUserNo", required=true)Long otherUserNo  ) {
		System.out.println("/webapp-api/delete-unread-count input myUserNo:"+myUserNo+", otherUserNo:"+otherUserNo);
		Map<String, Object> returnMap = new HashMap<String, Object>();
		String result = "fail";
		
		
		if( myUserNo==null || otherUserNo == null ){
		}else{
			result = (chattingService.deleteUnreadCountByUserNoAndOtherUserNo(myUserNo, otherUserNo) )? "success" : "fail";
		}
		
		returnMap.put( "result", result );
		System.out.println("/webapp-api/delete-unread-count retMap :"+ returnMap);
		return returnMap;
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
		
	@ResponseBody
	@RequestMapping("/delete-all-unread-board-count")
	public Map<String, Object> deleteAllUnreadBoardCount (
			@RequestParam(value="userNo", required=true) Long userNo ) {
		Map<String, Object> retMap = new HashMap<String, Object>();
		String result = "fail";
		
		result = (boardService.deleteUnreadCountByUserNo(userNo))? "success" : "fail";
		
		retMap.put("result", result);
		return retMap;
	}
			
			

}
