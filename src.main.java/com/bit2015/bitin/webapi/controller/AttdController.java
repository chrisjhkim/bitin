package com.bit2015.bitin.webapi.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit2015.bitin.service.AttdService;


@Controller("attdWebAPIController")
@RequestMapping("/webapi/attd")
public class AttdController {
	@Autowired
	AttdService attdService;
	
	@ResponseBody
	@RequestMapping("/by-classno-and-dates")
	public Map<String, Object> getAttdStatusViaClassNoAndDates ( 
//			@RequestParam(value="startDate")String startDate,
//			@RequestParam(value="endDate")String endDate,
			@RequestParam(value="classNo")Long classNo
			) {
//		System.out.println("date: "+startDate + " ~ "+endDate);
		
		System.out.println("classNo : "+classNo);
		HashMap<String, Object> retMap = new HashMap<String, Object>();
		/*String strResult = "fail";
		
		List<List<HashMap<String, Object>>> dataList = null;
		dataList = attdService.getAttdStatusViaClassNoAndDates(classNo, "20151207","20151215" );		
		
		
		
		retMap.put("result", strResult);*/
		return retMap;
	}

}
