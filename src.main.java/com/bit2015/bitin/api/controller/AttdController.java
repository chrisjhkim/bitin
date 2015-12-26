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
import com.bit2015.bitin.service.UserService;
import com.bit2015.bitin.service.UtilService;

@Controller("attdAPIController")
@RequestMapping("/api/attd")
public class AttdController {
	@Autowired
	AttdService attdService;
	@Autowired
	UserService userService;
	@Autowired
	UtilService utilService;
	
	/************* TEST DONE 송이가 사용
	 * userId가 듣고 있는 수업들중에 checkDay 에 출책한것들 정보들 목록
	 * 
	 * @param inputMap  (checkDay , userId )필수
	 * checkDay "YYYY/M/D" 형식으로 들어와서 utilService에서 YYYYMMDD 로 변환해서 DB에 넣음
	 * 
	 * 
	 * @return 
	 * data 안에
	 * CREATED_DATE , RANDOM_NUMBER, CLASS_NO, ATTD_NO, CLASS_NAME, START_TIME, TOTAL_USER, ATTD_TOTAL_USER 보냄
	 * 
	 * TOTAL_USER : 수업듣는 총 인원  
	 * ATTD_TOTAL_USER : 출석한 총 인원
	 * 
	 * TODO : 이거 총인원들이 선생포함이였던거 같음
	 */
	@ResponseBody
	@RequestMapping("/classattd-by-date-and-user")
	public Map<String, Object> getClassAttdInfoListByAttdNoAndUserNo( 
			@RequestBody HashMap<String, Object> inputMap ) { //이거안되면 HashMap<> 대신 String 으로 해서 util 에 있는거 쓰기 
//		System.out.println("/classattd-by-date @ inputMap : "+inputMap);
		System.out.println("15:22 @1");
		String retString = "fail";
		HashMap<String, Object> retMap = new HashMap<String, Object>();
		
		String checkDay = (String)inputMap.get("checkDay"); // TODO : or attdNo
		String userId = (String)inputMap.get("userId");  //TODO : id 로 할지 userNo로 할지 안정함
		String classRole = (String)inputMap.get("type");
		System.out.println("1111"+classRole);
		if( checkDay==null || userId==null){
			System.out.println("안들어온 값 있음");
			retMap.put("message", "userId or checkDay 가 null 임.");
		}
		System.out.println("15:23 @1");
		String strDate=utilService.changeDateFormat(checkDay); 
		Long userNo = userService.getUserNoViaUserId(userId);
		
		List<HashMap<String, Object>>retList = attdService.getClassAttdInfoListByAttdNoAndUserNo(strDate, userNo,classRole);
		retString = "success";
		retMap.put("data", retList);
		retMap.put("result", retString);
		
		System.out.println("@Attd @1- retMap : "+retMap);
		return retMap;
	}
	@ResponseBody
	@RequestMapping("/by-userno")
	public Map<String, Object> getAttdStatusListByUserNo(
			@RequestBody HashMap<String, Object> inputMap ) {
//		System.out.println("byUserNo : input "+inputMap);
		System.out.println("15:26 @1 input : "+inputMap);
		String retString = "fail";
		System.out.println("15:32 @1");
		HashMap<String, Object> retMap = new HashMap<String, Object>();
		System.out.println("15:32 @2");

		Long userNo = null;
		String userId = null;
		
		if( inputMap.get("userNo") == null ) {
			if( inputMap.get("userId")==null ) {
				System.out.println("userNo, userId 중 하나는 보내야됨 . 서버잘못 아님");
				retMap.put("message",  "userNo, userId 중 하나는 보내야됨 .");
			}else {//아이디만 들어온 경우
				userId = (String)inputMap.get("userId");
				userNo = (long)userService.getUserNoViaUserId(userId);
			}
		}else{// userNo 들어온 경우
		}
		
		System.out.println("ha");
//			List<HashMap<String,Object>> attList = attdService.getAttdStatusListByUserNo(userNo);
		List<HashMap<String,Object>> attList = attdService.getAttdStatusListByUserNo(userNo);
		retMap.put("data", attList);
		retString= "success";
			
		
		
		retMap.put("result", retString);
		System.out.println("@Attd @2 - retMap : "+retMap);
		return retMap;
	}
	
	@ResponseBody
	@RequestMapping("/by-attdno")
	public Map<String, Object> getClassAttdInfoListByAttdNo( 
			@RequestBody HashMap<String, Object> inputMap ) {
		System.out.println("@/by-attdno : inputMap : "+inputMap);
		String retString = "fail";
		HashMap<String, Object> retMap = new HashMap<String, Object>();
		
		if( inputMap.get("attdNo") == null ) {
			System.out.println("attdNo == null");
		}
		String strAttdNo = (String)inputMap.get("attdNo");
		Double doubleAttdNo = Double.parseDouble(strAttdNo);
		Long attdNo = doubleAttdNo.longValue();

		
		List<HashMap<String	, Object>>attdList = attdService.getClassAttdInfoListByAttdNo(attdNo);
		System.out.println("@3");
				
		retMap.put("data",attdList);
		
		String className = attdService.getClassNameViaAttdNo(attdNo);
		retMap.put("data2", className);
		
		retString = "success";
		retMap.put("result", retString);
		
		System.out.println("@Attd @3 - retMap : "+retMap);
		return retMap;
	}
	
	
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
