package com.bit2015.bitin.controller;





import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Timer;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.bit2015.bitin.api.thread.AttdThread;
import com.bit2015.bitin.api.thread.EndAttd;
import com.bit2015.bitin.service.AttdService;
import com.bit2015.bitin.service.ChrisService;
import com.bit2015.bitin.service.ClassService;
import com.bit2015.bitin.service.UserService;
import com.bit2015.bitin.service.UtilService;
import com.bit2015.bitin.vo.AttdNumberVo;
import com.bit2015.bitin.vo.AttendanceVo;
import com.bit2015.bitin.vo.ClassVo;
import com.bit2015.bitin.vo.UserVo;


@Controller
@RequestMapping("/tester")
public class ChrisTestController {

	@Autowired
	AttdService attdService;
	@Autowired
	UtilService util;
	@Autowired
	ClassService classService;
	@Autowired
	ChrisService chrisService;
	
	@Autowired
	UserService userService;
	
//	@RequestMapping("/by-classno-and-dates")
	@ResponseBody
	@RequestMapping("/ck")
	public Map<String, Object> getAttdStatusViaClassNoAndDates ( 
//			@RequestParam(value="startDate")String startDate,
//			@RequestParam(value="endDate")String endDate,
//			@RequestParam(value="classNo")Long classNo
			) {
//		System.out.println("date: "+startDate + " ~ "+endDate);
		Long classNo = 3L;
		System.out.println("classNo : "+classNo);
		HashMap<String, Object> retMap = new HashMap<String, Object>();
		String strResult = "fail";
		
		List<HashMap<String, Object>> dataList = null;
		dataList = chrisService.getAttdStatusViaClassNoAndDates(classNo, "2015 12 09","2015 12 14" );		
//		dataList = attdService.getAttdStatusViaClassNoAndDates(classNo, "2015 12 13","2015 12 13" );
		if(dataList != null){
			strResult = "success";
			retMap.put("data", dataList);
		}
		
		retMap.put("result", strResult);
		return retMap;
	}
	/**
	 * 그냥test 용도
	 */
	@RequestMapping("/main")
	public String TesterMain( Model model ) {  
		
		Long classNo = 3L;
		
		
		List<HashMap<String, Object>> dataList = null;
		dataList = chrisService.getAttdStatusViaClassNoAndDates(classNo, "2015 01 08","2015 12 31" );
//		dataList = attdService.getAttdStatusViaClassNoAndDates(classNo, "2015 12 08","2015 12 16" );
		
//test결과 되는건데 필요가 없어짐		Long attdNumCount = (long)((ArrayList<HashMap<String, Object>>)dataList.get(0).get("attdList")).size();
		model.addAttribute("dataList", dataList);
		System.out.println("출석 일수 size : "+           ((List<AttendanceVo>)dataList.get(0).get("attdList")).size()          );
		
		model.addAttribute("attdCounter", ((long)((List<AttendanceVo>)dataList.get(0).get("attdList")).size()) );
		String dateDupCheck = "-";
		Long dupCounter = 1L;
		for( HashMap<String, Object>person : dataList){
			dupCounter=2L;
			
			List<AttendanceVo>personalAttdList = (List<AttendanceVo>)person.get("attdList");
			for(AttendanceVo attdVo : personalAttdList) {
				String classDate = attdVo.getClassDate();
				String temp;
				temp = classDate.substring(0, 2) + "월"+classDate.substring(2) + "일";
				if( dateDupCheck.equals(classDate) ){
					System.out.println("겹침! at attdNo : "+attdVo.getAttdNo());
					temp += "_"+dupCounter;
					dupCounter +=1;
				}
				dateDupCheck = classDate;
				attdVo.setClassDate(temp);
			}
		}
		
		
		System.out.println("/main result : "+dataList);
//		System.out.println(attdService.getClassNameViaAttdNo(1L));
		
		
		
/////////////////////////////////////////////////////////
//		Test 하고 남은 코드들
//		System.out.println("result 100 "+attdService.getClassAttdInfoListByAttdNo(100L));
//		System.out.println("result 101 "+attdService.getClassAttdInfoListByAttdNo(101L));
//
//		System.out.println();
//		
//		System.out.println("test!!!!!!");
//		System.out.println( userService.getClassNameListByTeacherId("lsl") );
//		System.out.println("=========================================");
//		
//		System.out.println(attdService.getAttdStatusListByUserNo(10L));
//		
		
		
//		attdService.endAttd(3L);
		
//		List<UserVo> userList = classService.getUserInfoListViaClassNo(3L);
//		AttendanceVo attdVo = new AttendanceVo();
//		attdVo.setClassNo(3L);
//		for(UserVo vo : userList) {
//			attdVo.setUserNo(vo.getUserNo());
//			attdService.startAttd(attdVo);
//		}
		
//		classService.getUserInfoListViaClassNo(3L); 
		
//		classService.getClassNameAndNoByUserId("chrisjhkim" );
		
//		classService.joinClass(7L, 3L, "student");
//		classService.joinClass(10L, 3L, "teacher");
		
//		ClassVo classVo = new ClassVo();
//		classVo.setClassRef("-");
//		classVo.setGroupNo(1L);
//		classVo.setClassName("미적분");
//		classVo.setClassType("class");
//		classVo.setCoordName("이학관  101호");
//		classVo.setCoordLati("-");
//		classVo.setCoordLongi("-");
//		classVo.setStartTime("-");
//		classVo.setEndTime("-");
//		classService.insertClass(classVo);
		
//		System.out.println(classService.getClassNoViaClassName("전기회로"));
//		
//		System.out.println(util.createRandomNumber());
//		
//		AttdNumberVo attdVo = new AttdNumberVo();
//		attdVo.setClassNo(1L);
//		attdVo.setRandomNumber(1522L);
//		attdService.insertAttdNumberVo(attdVo);
		
		return "junhyun-test/attd-class";
	}

}