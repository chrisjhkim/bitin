package com.bit2015.bitin.api.controller;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit2015.bitin.service.AttdService;
import com.bit2015.bitin.service.ChrisService;
import com.bit2015.bitin.service.ClassService;
import com.bit2015.bitin.service.UserService;
import com.bit2015.bitin.service.UtilService;
import com.bit2015.bitin.vo.AttdNumberVo;
import com.bit2015.bitin.vo.AttendanceVo;
import com.bit2015.bitin.vo.ClassVo;
import com.bit2015.bitin.vo.TempVo;
import com.bit2015.bitin.vo.UserVo;
import com.fasterxml.jackson.databind.jsonFormatVisitors.JsonObjectFormatVisitor;

////////////////////////////////////////////tttest
@Controller("classAPIController")
@RequestMapping("/api/class")
public class ClassController {
	@Autowired
	ClassService classService;
	@Autowired
	UserService userService;
	@Autowired
	UtilService util;
	@Autowired
	AttdService attdService;
	@Autowired
	ChrisService chrisService;

	
	/****************************************************************
	 * 
	 * @param className
	 * @param userName
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/start-class")
	public Map<String, Object> login( 
			@RequestBody String strInput) {
		System.out.println("/start-class strInput : "+strInput);
		HashMap<String, Object>retMap = new HashMap<String, Object>();
		Map<String, Object> inputMap = util.transformStringToHashMap(strInput);
		String className = (String)inputMap.get("className");
		String userId = (String)inputMap.get("userId");
		
		String resString ="fail";
		
		if(className== null || userId==null ){
			resString = "fail";
			retMap.put("message", "name 한개 이상 empty");
			System.out.println("/start-class error #1");
		}
		else{
			resString="success";
			Long randomLong = util.createRandomNumber(); //랜덤 숫자 생성
			System.out.println("================RAND NUMBER : "+randomLong);
			AttdNumberVo attdNumberVo = new AttdNumberVo();
			Long classNo  = classService.getClassNoViaClassName(className); 
			if(classNo == -1L) {
				System.out.println("/start-class error #2");
				retMap.put("message", "className 에 해당하는 수업이 없음");
			}
			else {
				attdNumberVo.setClassNo(classNo);
				attdNumberVo.setRandomNumber(randomLong);
				if( !attdService.insertAttdNumberVo(attdNumberVo) ) {  //랜덤 숫자 저장
					System.out.println("/start-class error #3");
					resString="fail";
					retMap.put("message", "insert실패 서버잘못");
				}else{
					resString="success";
				}
			}
			retMap.put("data", randomLong);
			retMap.put("data2", classNo);
		}
		retMap.put("result", resString);
		System.out.println("/start-class retMap : "+retMap );
		return retMap;
	}
	/********송이가 쓰는거 
	 * @param userVo (userId 받아와야됨)
	 * (Id가 고유한 아이디 아니면 error 남)
	 * @return List<String> 으로    List<"groupName"> return 함 
	 */
	@ResponseBody
	@RequestMapping(value="/classlist")
	public Map<String, Object> getClassListByUserId(
			@RequestBody HashMap<String, Object> inputMap ){
		System.out.println("/classlist inputMap : "+inputMap);
		HashMap<String, Object>retMap = new HashMap<String, Object>();
		String resString ="fail";
		
		if(inputMap.get("userId")== null || inputMap.get("nowDate")==null ) {
			System.out.println("/classlist error #1");
			retMap.put("message", "userId , nowDate 한개 이상 empty");
		}else{
			String userId = (String)inputMap.get("userId");
			String nowDate = (String)inputMap.get("nowDate");
			
			Long userNo = userService.getUserNoViaUserId(userId);
			if( userNo == null ){
				System.out.println("/classlist error #2");
				retMap.put("message", "잘못된 userId");
			}else{
				List<HashMap<String, Object>> classNameList = chrisService.getClassNameNoTimeListByUserNoAndDate(userNo, nowDate);
				
				if(classNameList== null ){
					retMap.put("message", "groupList==null이다.");
					System.out.println("/classlist error #3");
				}else{
					resString="success";
					for( HashMap<String, Object> vo : classNameList) {
						Long newTimer = ((BigDecimal)vo.get("TIMERMIN")).longValue();
						vo.replace("TIMERMIN", newTimer);
					}
					retMap.put("data", classNameList);
				}
			}
			
		}
		retMap.put("result", resString);
		System.out.println("/classlist result - retMap : "+retMap);
		return retMap;
	}
	
	/**
	 * @param userId 
	 * @return List(hashmap> 으로 
	 * userId가 들어있는 수업 '들'의  수업명, 선생PhoneId
	 * List(class_Name , user_phone_id )
	 */
	@ResponseBody
	@RequestMapping(value="/classinfo-by-userid")
	public Map<String , Object> getClassInfoViaUserId (
			@RequestBody UserVo userVo ){
		HashMap<String, Object>retMap = new HashMap<String, Object>();
		
		System.out.println("/classinfo-by-userid input userVo : "+userVo);
		String resString ="fail";
		
		if(userVo== null){
			System.out.println("/classinfo-by-userid error #1");
			retMap.put("message", "userVo is null");
		}
		else {
			List<HashMap<String, Object>> classInfoList = classService.getClassInfoByUserId(userVo.getUserId());
			if(classInfoList== null ){
				System.out.println("/classinfo-by-userid error #2");
				retMap.put("message", "group is empty");
			}
			else{
				resString="success";
				retMap.put("data", classInfoList);
			}
		}
		retMap.put("result", resString);
		System.out.println("/classinfo-by-userid retMap : "+retMap);
		return retMap;
	}
	
	@ResponseBody
	@RequestMapping("/student-phone-list")
	public Map<String, Object> getStudetPhoneIdListViaTeacherId ( 
			@RequestBody HashMap<String, Object> inputMap ) {
		System.out.println("/student-phone-list inputMap : "+inputMap);
		
		HashMap<String, Object>retMap = new HashMap<String, Object>();
		String userId = (String)inputMap.get("userId");
		String resString ="fail";
		
		if(userId== null){
			retMap.put("message", "userId is null");
			System.out.println("/student-phone-list error #1");
		}
		else if( !userService.checkExistUserViaId(userId)){	//없는 아이디면
			System.out.println("/student-phone-list error #2");	
			retMap.put("message", "없는 아이디임");
		}
		else {
			List<HashMap<String, Object >>dataList = classService.getStudentPhoneIdListByUserId(userId);
			if(dataList == null){
				retMap.put("message", "가르치는 수업 없거나 듣는 학생이 없음");
				System.out.println("/student-phone-list error #3");	
			}
			else{
				resString="success";
				retMap.put("data", dataList);
			}
		}
		retMap.put("result", resString);
		System.out.println("retMap :"+ retMap);
		return retMap;
	}
	
	/**	//TODO : 송이가 사용할것.
	 * @param userVo
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/class-name-and-no")
	public Map<String , Object> getClassNameAndNoViaUserId (
			@RequestBody UserVo userVo ){
		System.out.println("/class-name-and-no input userVo : "+userVo);
		HashMap<String, Object>retMap = new HashMap<String, Object>();
		String resString ="fail";
		
		if(userVo== null){
			System.out.println("/class-name-and-no #1");
			retMap.put("message", "에러 : userVo == null");
		}else {
			List<HashMap<String, Object>> classInfoList = classService.getClassNameAndNoByUserId(userVo.getUserId());
			if(classInfoList== null ){
				System.out.println("/class-name-and-no #2");
				resString = "fail";
				retMap.put("message", "group is empty");
			}else{
				System.out.println("/class-name-and-no #3");
				resString="success";
				retMap.put("data", classInfoList);
			}
		}
		retMap.put("result", resString);
		System.out.println("/class-name-and-no retMap :"+ retMap);
		return retMap;
	}
	//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	////////////////////////////////////////////////////사용중      /////////////////////////////////////////////////////////////////
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	
	/** 사용 안하고 있음, 미완성
	 * @param classVo
	 * @return 
	 * class 만들기
	 */
	@ResponseBody
	@RequestMapping("/create-class")
	public Map<String, Object> createClass (ClassVo classVo) {
		HashMap<String, Object>retMap = new HashMap<String, Object>();
		String resString = "fail";
		if(classVo ==null) {
			retMap.put("message", "에러 : classVo == null ");
		}else if( classVo.getClassName() == null ) {
			retMap.put("message", "에러 : classVo.className == null ");
		}else {
			//오류 검사
			if( classVo.getClassType() == null ) {
				classVo.setClassType("수업");
			}
			if (classVo.getCoordName()==null) {
				classVo.setCoordName("-");
			}
			if ( classVo.getStartTime()==null ) {
				classVo.setStartTime("-");
				classVo.setEndTime("-");
			}else if ( classVo.getEndTime()==null ) {
				classVo.setEndTime("-");
			}
			if (classVo.getCoordLati()==null || classVo.getCoordLongi()==null ){
				classVo.setCoordLati("-");
				classVo.setCoordLongi("-");
			}
			if(classVo.getGroupNo()==null ){
				classVo.setGroupNo(1L);
			}
			if(classVo.getClassRef()==null) {
				classVo.setClassRef("-");
			}
			// 오류검사 끝
			if( !classService.insertClass(classVo) ) {
				retMap.put("message", "에러 : insert 실패 (서버쪽 잘못)");
			}
			else {
				//TODO : 수업 생성하면서 바로 선생님, 직원으로 등록
				
				resString = "success";
			}
			
		}
		
		classService.insertClass(classVo);
		
		
		retMap.put("result", resString);
		return retMap;
		
	}
	
	
 
		
	@ResponseBody
	@RequestMapping("/start-attd")
	public Map<String, Object> startAttd(
			@RequestBody HashMap<String, Object> inputMap) {
		System.out.println("/start-attd - inputMap : "+inputMap);
		HashMap<String,Object> retMap = new HashMap<String, Object>();
		String retString = "fail";
		
		if( inputMap.get("timer")==null) {
			
			System.out.println("timer == null ");
			retMap.put("message", "timer == null ");
		}else if ( inputMap.get("classNo") ==null){
			System.out.println("classNo == null ");
			retMap.put("message", "classNo == null ");
		
		}else {
			Long timerMin = Long.parseLong(((Integer)inputMap.get("timer")).toString()); 
			Long classNo = Long.parseLong((String)inputMap.get("classNo"));
//			Long attdNo = attdService.getAttdNoOfRecentTimeNullViaClassNo(classNo);
			Long attdNo = chrisService.getAttdNoOfRecentTimeNullViaClassNo(classNo);
			
			String startTime = (String)inputMap.get("startTime");
			System.out.println(startTime);
//			Long longChecker = attdService.updateTimerAndCreatedDate(timerMin, attdNo, startTime);
			Long longChecker = chrisService.updateTimerAndCreatedDate(timerMin, attdNo, startTime);
			
			
			System.out.println("startTime : "+startTime);
			
			
			if( longChecker == -1 ) {
				System.out.println("2:30 @1");
				System.out.println("하나도 update안됨");
				retMap.put("message", "하나도 update안됨");
			}else if( longChecker != 1) {
				System.out.println("2:30 @2");
				System.out.println("여러개 update됨 (db에 잘못된 data 있었거나  sql 잘못됨)");
				retMap.put("message", "여러개 update됨 (db에 잘못된 data 있었거나  sql 잘못됨)");
			}
			else {
				System.out.println("2:30 @3");
//				List<String> studentPhoneList = classService.getStudentPhoneListViaClassNo( classNo );
				List<String> studentPhoneList = chrisService.getStudentPhoneListViaClassNo( classNo );
//				.getStudentPhoneListViaClassNo( classNo );
				
				if( studentPhoneList == null) {
					System.out.println("2:30 @4");
					System.out.println("classPhoneList == null");
					retMap.put("message", "classPhoneList == null");
				}
				else {
					System.out.println("2:30 @5");
					retString = "success";
					retMap.put("data", studentPhoneList);
					
				}
//				getStudentPhoneListViaClassNo
			}
		}
		retMap.put("result", retString);
		System.out.println("/start-attd - retMap : "+retMap);
		return retMap;
	}	
}
