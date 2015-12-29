package com.bit2015.bitin.webapi.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit2015.bitin.service.AttdService;
import com.bit2015.bitin.service.ChrisService;
import com.bit2015.bitin.service.ClassService;
import com.bit2015.bitin.vo.AttendanceVo;

@Controller("attdWebAPIController")
@RequestMapping("/webapi/attd")
public class WebAPIAttdController {
	@Autowired
	AttdService attdService;
	@Autowired
	ClassService classService;
	@Autowired
	ChrisService chrisService;
	
	/*@ResponseBody
	@RequestMapping("/by-classno-and-dates")
	public Map<String, Object> getAttdStatusViaClassNoAndDates ( 
//			@RequestParam(value="startDate")String startDate,
//			@RequestParam(value="endDate")String endDate,
			@RequestParam(value="classNo")Long classNo
			) {
//		System.out.println("date: "+startDate + " ~ "+endDate);
		
		System.out.println("classNo : "+classNo);
		HashMap<String, Object> retMap = new HashMap<String, Object>();
		String strResult = "fail";
		
		List<List<HashMap<String, Object>>> dataList = null;
		dataList = attdService.getAttdStatusViaClassNoAndDates(classNo, "20151207","20151215" );		
		
		
		
		retMap.put("result", strResult);
		return retMap;
	}*/
	
	@ResponseBody
	@RequestMapping("/edit-status")
	public Map<String, Object> editStatus(
			@RequestParam(value="classDate")String tempClassDate,
			@RequestParam(value="userNo")Long userNo,
			@RequestParam(value="attdStatus")String newAttdStatus,
			@RequestParam(value="firstAttdNo")Long firstAttdNo
			) {
		System.out.println("/edit-status - [userNo : " +userNo + "] / [classDate :"+tempClassDate+"] / [newAttdStatus : "+newAttdStatus + "] / "+firstAttdNo);
		HashMap<String, Object>retMap = new HashMap<String, Object>();
		
		Long classNo = chrisService.getClassNoViaAttdNo(firstAttdNo);
		String classDate = "2015"+tempClassDate.substring(0,2)+tempClassDate.substring(3,5);
		
		Long attdNo = null;
		Long attdIndex = 1L;
		if( tempClassDate.length()>6 ){ //////////////1번경우
			attdIndex = Long.parseLong(tempClassDate.substring(6));
		}
		
		attdNo = chrisService.getAttdNoViaClassDateAndClassNo(classDate, classNo, attdIndex);

		System.out.println("[classDate:"+classDate+"] / [attdNo:"+attdNo+"] / [ classNo:"+classNo+"]");
		
		AttendanceVo attdVo = new AttendanceVo();
		String oldAttdStatus = chrisService.getAttdStatusViaAttdNoAndUserNo(attdNo, userNo);
		System.out.println("["+oldAttdStatus+"] -> ["+newAttdStatus+"]");
		if ( !( newAttdStatus.equals("yes") || newAttdStatus.equals("late") || newAttdStatus.equals("info") || newAttdStatus.equals("no") )) {
			System.out.println("newAttdStatus 잘못됐음");
		}else if( oldAttdStatus == null ){
			if( newAttdStatus.equals("no") ){ 																		//할거 없음(변화 없음) no->no
				System.out.println("no->no 변화없음");
			}else if ( newAttdStatus.equals("yes") || newAttdStatus.equals("late") || newAttdStatus.equals("info") ){	//no->yes   // no->late		//no->info
				System.out.println("no->"+newAttdStatus);
				attdVo.setUserNo(userNo);
				attdVo.setAttdNo(attdNo);
				attdVo.setAttdStatus(newAttdStatus);
				chrisService.insertAttdVo(attdVo);
			}
		}else if( oldAttdStatus.equals("no")){
			System.out.println("잘못됐음   old == no");			//뭔가 잘못됐을 가능성이 있음
		}else if( oldAttdStatus.equals("yes") || oldAttdStatus.equals("late") || oldAttdStatus.equals("info") ) {													
			if( newAttdStatus.equals("no") ){ 												//late, info , yes-> no
				System.out.println("yes-> no");
				chrisService.deleteAttd(userNo, attdNo);
			}else if ( newAttdStatus.equals(oldAttdStatus) ){										//할거없음 ( 변화 X
				System.out.println(oldAttdStatus + "->"+newAttdStatus+"  변화없음");
			}else  {																			//late, info , yes-> 다른거
				chrisService.updateAttd(userNo, attdNo, newAttdStatus);
			}
		}else { //
			System.out.println("old == else");			//뭔가 잘못됐을 가능성이 엄청남
		}

		String strResult = "success";
		retMap.put("result",  strResult);
		return retMap;
	}
}