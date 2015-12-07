package com.bit2015.bitin.controller;

import java.util.Calendar;
import java.util.List;
import java.util.Timer;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.bit2015.bitin.api.thread.AttdThread;
import com.bit2015.bitin.api.thread.EndAttd;
import com.bit2015.bitin.service.AttdService;
import com.bit2015.bitin.service.ClassService;
import com.bit2015.bitin.service.UserService;
import com.bit2015.bitin.service.UtilService;
import com.bit2015.bitin.vo.AttdNumberVo;
import com.bit2015.bitin.vo.AttendanceVo;
import com.bit2015.bitin.vo.ClassVo;
import com.bit2015.bitin.vo.UserVo;


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
	@ResponseBody
	@RequestMapping("/main")
	public String TesterMain( ) {
		  
		System.out.println("test!!!!!!");
		System.out.println( userService.getClassNameListByTeacherId("lsl") );
		
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
		
		return "TESTED!";
	}

}
