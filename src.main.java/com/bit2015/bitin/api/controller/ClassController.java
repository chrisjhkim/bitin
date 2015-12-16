package com.bit2015.bitin.api.controller;

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
	
	/****************************************************************
	 * db 데이터 만들기 위해서 임시
	 */
	@ResponseBody
	@RequestMapping("/data-create")
	public Map<String, Object> dataCreate(  ) {
		HashMap<String, Object>retMap = new HashMap<String, Object>();
		String userId = "iron";
		String className = "전기회로";
		
		System.out.println("userId : "+userId);
		
		String resString ="fail";
		
		if(className== null || userId==null ){
			resString = "fail";
			retMap.put("message", "name 한개 이상 empty");
		}
		else{
			resString="success";
			Long randomLong = util.createRandomNumber(); //랜덤 숫자 생성
			System.out.println("================RAND NUMBER : "+randomLong);
			AttdNumberVo attdNumberVo = new AttdNumberVo();
			Long classNo  = classService.getClassNoViaClassName(className); 
			if(classNo == null) {
				System.out.println("getClassNo 실패");
				retMap.put("message", "className 에 해당하는 수업이 없음");
			}
			else {
				attdNumberVo.setClassNo(classNo);
				attdNumberVo.setRandomNumber(randomLong); 
				if( !attdService.insertAttdNumberVo(attdNumberVo) ) {  //랜덤 숫자 저장
					List<UserVo> userList = classService.getUserInfoListViaClassNo(classNo); //학생 리스트구해서
					AttendanceVo attdVo = new AttendanceVo();
					attdVo.setClassNo(classNo);
					for(UserVo vo : userList) {				//학생들 각각
						attdVo.setUserNo(vo.getUserNo());
						attdService.startAttd(attdVo);		// 출석중 으로 변경
					}
					System.out.println("AttdNumVo DB insert실패");
					resString="fail";
					retMap.put("message", "insert실패 서버잘못");
				}else{
					resString="success";
				}
			}
			retMap.put("data", randomLong);
		}
		retMap.put("result", resString);
		System.out.println("@start-class" + retMap);
		
		return retMap;
	}
	/****************************************************************
	 * @param className
	 * @param userName
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/start-class")
	public Map<String, Object> login( 
			@RequestBody String strInput) {
		HashMap<String, Object>retMap = new HashMap<String, Object>();
		Map<String, Object> inputMap = util.transformStringToHashMap(strInput);
		String className = (String)inputMap.get("className");
		String userId = (String)inputMap.get("userId");

		String resString ="fail";
		
		if(className== null || userId==null ){
			resString = "fail";
			retMap.put("message", "name 한개 이상 empty");
		}
		else{
			resString="success";
			Long randomLong = util.createRandomNumber(); //랜덤 숫자 생성
			System.out.println("================RAND NUMBER : "+randomLong);
			AttdNumberVo attdNumberVo = new AttdNumberVo();
			Long classNo  = classService.getClassNoViaClassName(className); 
			if(classNo == null ) {
				System.out.println("getClassNo 실패");
				retMap.put("message", "className 에 해당하는 수업이 없음");
			}
			else {
				attdNumberVo.setClassNo(classNo);
				attdNumberVo.setRandomNumber(randomLong); 
				if( !attdService.insertAttdNumberVo(attdNumberVo) ) {  //랜덤 숫자 저장
					List<UserVo> userList = classService.getUserInfoListViaClassNo(classNo); //학생 리스트구해서
					AttendanceVo attdVo = new AttendanceVo();
					attdVo.setClassNo(classNo);
					for(UserVo vo : userList) {				//학생들 각각
						attdVo.setUserNo(vo.getUserNo());
						attdService.startAttd(attdVo);		// 출석중 으로 변경
					}
					System.out.println("AttdNumVo DB insert실패");
					resString="fail";
					retMap.put("message", "insert실패 서버잘못");
				}else{
					resString="success";
				}
			}
			retMap.put("data", randomLong);
		}
		retMap.put("result", resString);
		System.out.println("@start-class" + retMap);
		
		return retMap;
	}
	
	/********송이가 쓰는거 
	 * @param userVo (userId 받아와야됨)
	 * (Id가 고유한 아이디 아니면 error 남)
	 * @return List<String> 으로    List<"groupName"> return 함 
	 */
	@ResponseBody
	@RequestMapping(value="/classlist")
	public Map<String, Object> getClassListByUserId(@RequestBody UserVo userVo	){
		HashMap<String, Object>retMap = new HashMap<String, Object>();
		String resString ="fail";
		
		System.out.println("userVo : "+userVo);
		
		String userId = userVo.getUserId();
		Long userNo = userService.getUserNoViaUserId(userId);
		List<ClassVo> classNameList = classService.getClassNameTimeListByUserNo(userNo);
		
		if(classNameList== null ){
			retMap.put("message", "groupList==null이다.");
		}else{
			resString="success";
			retMap.put("data", classNameList);
		
			
		}
		retMap.put("result", resString);
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
		
		System.out.println("@testserver2-ClassController : getClassInfoViaUserId userVo : "+userVo);
		String resString ="fail";

		if(userVo== null){
			retMap.put("message", "userVo is null");
		}
		else {
			List<HashMap<String, Object>> classInfoList = classService.getClassInfoByUserId(userVo.getUserId());
			if(classInfoList== null ){
				resString = "fail";
				retMap.put("message", "group is empty");
			}
			else{
				resString="success";
				retMap.put("data", classInfoList);
			}
		}
		retMap.put("result", resString);
		System.out.println("retMap :"+ retMap);
		return retMap;
	}

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
	
	
 
	/**	//TODO : 송이가 사용할것.
	 * @param userVo
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/class-name-and-no")
	public Map<String , Object> getClassNameAndNoViaUserId (
			@RequestBody UserVo userVo ){
		System.out.println("@b ClassCont getClassInfo: getClassNameAndNoViaUserId userVo : "+userVo);
		HashMap<String, Object>retMap = new HashMap<String, Object>();
		String resString ="fail";
	
		if(userVo== null){
			retMap.put("message", "에러 : userVo == null");
		}else {
			List<HashMap<String, Object>> classInfoList = classService.getClassNameAndNoByUserId(userVo.getUserId());
			if(classInfoList== null ){
				resString = "fail";
				retMap.put("message", "group is empty");
			}else{
				resString="success";
				retMap.put("data", classInfoList);
			}
		}
		retMap.put("result", resString);
		System.out.println("retMap :"+ retMap);
	
		return retMap;
	}
		
		
}
