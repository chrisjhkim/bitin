package com.bit2015.bitin.api.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit2015.bitin.service.AttdService;
import com.bit2015.bitin.service.ChrisService;
import com.bit2015.bitin.service.UserService;
import com.bit2015.bitin.service.UtilService;
import com.bit2015.bitin.vo.UserVo;

@Controller("attdAPIController")
@RequestMapping("/api/attd")
public class AttdController {
	@Autowired
	AttdService attdService;
	@Autowired
	UserService userService;
	@Autowired
	UtilService utilService;
	@Autowired
	ChrisService chrisService;
	
	/************* TEST DONE 송이가 사용
	 * @param inputMap  (checkDay , userId )필수
	 * @return 
	 * checkDay "YYYY/M/D" 형식으로 들어와서 utilService에서 YYYYMMDD 로 변환해서 DB에 넣음
	 */
	@ResponseBody
	@RequestMapping("/classattd-by-date-and-user")	// 데이터 빈거 1:53
	public Map<String, Object> getClassAttdInfoListByAttdNoAndUserNo( 
			@RequestBody HashMap<String, Object> inputMap ) { //이거안되면 HashMap<> 대신 String 으로 해서 util 에 있는거 쓰기 
		System.out.println("/classattd-by-date-and-user inputMap : "+inputMap);
		String retString = "fail";
		HashMap<String, Object> retMap = new HashMap<String, Object>();
		
		String checkDay = (String)inputMap.get("checkDay"); // TODO : or attdNo
		String userId = (String)inputMap.get("userId");  //TODO : id 로 할지 userNo로 할지 안정함
		String classRole = (String)inputMap.get("type");
		classRole = "teacher";
		System.out.println("1111"+classRole);
		if( checkDay==null || userId==null){
			System.out.println("안들어온 값 있음");
			retMap.put("message", "userId or checkDay 가 null 임.");
		}
		String strDate=utilService.changeDateFormat(checkDay); 
		Long userNo = userService.getUserNoViaUserId(userId);
		System.out.println("@1:51" + userNo + strDate);
		List<HashMap<String, Object>>retList = attdService.getClassAttdInfoListByAttdNoAndUserNo(strDate, userNo,classRole);
		retString = "success";
		retMap.put("data", retList);
		retMap.put("result", retString);
		
		System.out.println("/classattd-by-date-and-user retMap : "+retMap);
		return retMap;
	}
	
	@ResponseBody
	@RequestMapping("/by-userno")	//에러
	public Map<String, Object> getAttdStatusListByUserNo(
			@RequestBody HashMap<String, Object> inputMap ) {
		System.out.println("/by-userno inputMap : "+inputMap);
		String retString = "fail";
		HashMap<String, Object> retMap = new HashMap<String, Object>();
		String userId= (String)inputMap.get("userId");
		UserVo userVo = userService.getUserVo(userId);
		
		List<HashMap<String,Object>> attList = attdService.getAttdStatusListByUserNo(userVo.getUserNo());
		retMap.put("data", attList);
		retString= "success";
		
		retMap.put("result", retString);
		
		System.out.println("/by-userno retMap : "+retMap);
		return retMap;
	}
	
	@ResponseBody
	@RequestMapping("/by-attdno")
	public Map<String, Object> getClassAttdInfoListByAttdNo( 
			@RequestBody HashMap<String, Object> inputMap ) {
		System.out.println("/by-attdno inputMap : "+inputMap);
		String retString = "fail";
		HashMap<String, Object> retMap = new HashMap<String, Object>();
		Long attdNo = (long)inputMap.get("attdNo");
		List<HashMap<String	, Object>>attdList = attdService.getClassAttdInfoListByAttdNo(attdNo);
		
		retMap.put("data",attdList);
		retString = "success";
		retMap.put("result", retString);
		
		System.out.println("/by-attdno retMap : "+retMap);
		return retMap;
	}
	
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////// 사용중      /////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	
	@ResponseBody
	@RequestMapping("/test")
	public Map<String, Object> test( ){
		HashMap<String, Object> retMap = new HashMap<String, Object>();
		Long classNo = 3L;;
//		String classDate = (String)inputMap.get("classDate"); // TODO : or attdNo
		Long attdNo = 1L;
		
		String userId ="iron";  //TODO : id 로 할지 userNo로 할지 안정함
		Long userNo = userService.getUserNoViaUserId(userId);
		
		String strDate="20151209";
		String year=(strDate.substring(0, 4));
		
		
		System.out.println(year);
		
		
		System.out.println(strDate.substring(4));
		System.out.println(strDate);
		System.out.println("length : "+strDate.length());
		
		if(strDate.length()==6){
			
		}
//		attdService.getClassAttdInfoListByAttdNoAndUserNo(strDate, userNo);
		return retMap;
	}
}
