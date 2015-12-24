package com.bit2015.bitin.controller;


import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.bit2015.bitin.service.AttdService;
import com.bit2015.bitin.service.ClassService;
import com.bit2015.bitin.service.UserService;
import com.bit2015.bitin.service.UtilService;


@Controller
@RequestMapping("/tester")
public class TesterController {
	@Autowired
	AttdService attdService;
	@Autowired
	UtilService util;
	@Autowired
	ClassService classService;
	
	@Autowired
	UserService userService;
	
	
	/**
	 * 그냥test 용도
	 */
	@RequestMapping("/main")
	public String TesterMain( ) {  
		
		System.out.println("result 100 "+attdService.getClassAttdInfoListByAttdNo(100L));
		System.out.println("result 101 "+attdService.getClassAttdInfoListByAttdNo(101L));

		System.out.println();
		
		System.out.println("test!!!!!!");
		System.out.println( userService.getClassNameListByTeacherId("lsl") );
		System.out.println("=========================================");
		
		System.out.println(attdService.getAttdStatusListByUserNo(10L));
		
/////////////////////////////////////////////////////////
//		Test 하고 남은 코드들
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
		
		return "junhyun-test/chart-test";
	}

}
