package com.bit2015.bitin.webapp.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit2015.bitin.service.ChrisService;
import com.bit2015.bitin.vo.MessageVo;


@Controller("ChrisWebAppAPIController")
@RequestMapping("/chriswebapp-api")
public class ChrisWebAppApiController {
	@Autowired
	ChrisService chrisService;
	
	@ResponseBody 
	@RequestMapping("/message-read")
	public  Map<String, Object> messageReadCounterUpdate(
			@RequestParam(value="userNo", required=false)Long userNo	) {
//			@AuthUser UserVo authUser, 
		System.out.println("/chriswebapp-api userNo : "+userNo);
	
		chrisService.toZeroUnreadCountByUserNo(userNo);
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put( "result", "success" );
		
		return map;
	}

}
