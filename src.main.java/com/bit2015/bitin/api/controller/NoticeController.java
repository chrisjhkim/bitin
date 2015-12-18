package com.bit2015.bitin.api.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit2015.bitin.service.NoticeService;
import com.bit2015.bitin.vo.NoticeVo;

@Controller("noticeAPIController")
@RequestMapping("/api/notice")
public class NoticeController {
	
	@Autowired
	NoticeService noticeService;
	

	@ResponseBody
	@RequestMapping("/insert")
	public Map<String, Object> noticeInsert(
			@RequestBody HashMap<String, Object> inputMap ) {
		System.out.println("@insert "+inputMap);
		HashMap<String, Object>retMap = new HashMap<String, Object>();
		String resultStr = "fail";

		if( inputMap==null) {
			retMap.put("message", "inputMap== null 인 상태");
		}else {
			NoticeVo noticeVo = new NoticeVo();
			resultStr = "success";
			noticeVo.setUserId((String)	inputMap.get("userId"));
			noticeVo.setClassName((String)inputMap.get("className"));
			noticeVo.setMessage((String)inputMap.get("message"));
			noticeVo.setTitle((String)inputMap.get("title"));
			noticeVo.setClassNo(Long.valueOf(inputMap.get("classNo")+""));
			System.out.println(noticeVo+"확인");
			noticeService.noticeInsert(noticeVo);
		}
		retMap.put("result", resultStr);
		return retMap;
	} 
	
	
	@ResponseBody
	@RequestMapping("/list")
	public Map<String, Object> noticeList(
			@RequestBody HashMap<String, Object> inputMap ) {
		
		HashMap<String, Object>retMap = new HashMap<String, Object>();
		String resultStr = "fail";

		if( inputMap==null) {
			retMap.put("notice/list", "inputMap== null 인 상태");
		}else {
		NoticeVo noticeVo = new NoticeVo();
		resultStr = "success";
		noticeVo.setUserId((String)	inputMap.get("userId"));
		System.out.println("notice-list"+noticeVo);
		retMap.put("data",noticeService.noticeList(noticeVo));
		}
		retMap.put("result", resultStr);
		return retMap;
	}
	
	
	
}
