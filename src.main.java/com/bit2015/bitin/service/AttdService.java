package com.bit2015.bitin.service;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Timer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit2015.bitin.api.thread.AttdThread;
import com.bit2015.bitin.dao.AttdDao;
import com.bit2015.bitin.dao.ChrisDao;
import com.bit2015.bitin.dao.ClassDao;
import com.bit2015.bitin.vo.AttdNumberVo;
import com.bit2015.bitin.vo.AttendanceVo;


@Service
public class AttdService {
	@Autowired
	AttdDao attdDao;

	@Autowired
	ClassDao classDao;
	@Autowired
	ChrisDao chrisDao;
	/** use.
	 * @param strDate
	 * @param userNo
	 * @return
	 */
	public List<HashMap<String, Object>> getClassAttdInfoListByAttdNoAndUserNo ( String strDate, Long userNo,String classRole ) {
		List<HashMap<String, Object>> retList = null;
		retList = attdDao.getClassAttdInfoListByAttdNoAndUserNo(strDate, userNo,classRole);
		return retList;
	}
	
	public List<HashMap<String, Object>> getAttdStatusListByUserNo ( Long userNo ) {
		List<HashMap<String, Object>> retList = null;
		retList = attdDao.getAttdStatusListByUserNo(userNo);
		
		for( HashMap<String, Object> item : retList) {
			Long attdNo = ((BigDecimal)item.get("ATTD_NO")).longValue();
			String status = attdDao.getAttdStatusViaAttdNoAndUserNo(attdNo, userNo);
			if(status == null){
				status="결석";
			}
			item.put("STATUS", status);
		}
		System.out.println("list : "+retList);
		return retList;
	}
	
	/**
	 * @param attdNo 어떤 출첵때 였냐
	 * @return 
	 */
	public List<HashMap<String, Object>> getClassAttdInfoListByAttdNo ( Long attdNo ) {
		List<HashMap<String, Object>> retList = null;
		Long classNo = attdDao.getClassNoByAttdNo(attdNo);
		
		retList = attdDao.getClassAttdInfoListByClassNoAndAttdNo( classNo);
		
		//출석여부 확인 하나씩
		for( HashMap<String, Object> item : retList) {
			Long userNo = ((BigDecimal)item.get("USERNO")).longValue();
			String status = attdDao.getAttdStatusViaAttdNoAndUserNo(attdNo, userNo);
			if(status == null){
				status="결석";
			}
			item.put("STATUS", status);
		}
		return retList;
	}
	
	/**
	 * @param attdNumberVo (randomNumber, classNo ) 필수
	 * @return 성공하면 true return
	 */
	public boolean insertAttdNumberVo ( AttdNumberVo attdNumberVo ) {
		boolean retFlag = false;
		retFlag = attdDao.insertAttdNumberVo(attdNumberVo);
		return retFlag;
	}
	
	public List<HashMap<String, Object>> getAttdStatusListByClassNoAndDates ( 
			Long classNo , 
			String startDate, 
			String endDate ) {
		List<HashMap<String, Object>> retList = new ArrayList<HashMap<String,Object>>();
		List<Long> studentList = chrisDao.getStudentNoListViaClassNo(classNo);
		System.out.println("01/13 studentList : "+studentList);
		List<Long> attdNumList = chrisDao.getAttdNumListViaClassNoAndDates(classNo, startDate, endDate);
		System.out.println("01/13 attdNumList : "+attdNumList);
		
		for( Long userNo : studentList ) {
			HashMap<String, Object> onePerson = new HashMap<String, Object>();
			onePerson.put("userNo", userNo);
			onePerson.put("userName", chrisDao.getUserNameViaUserNo(userNo));
			
			List<AttendanceVo> onePersonAttdList = new ArrayList<AttendanceVo>();
			for( Long attdNo : attdNumList ) {
				String attdDate = chrisDao.getAttdDateViaAttdNo(attdNo);
				String attdStatus = chrisDao.getAttdStatusViaAttdNoAndUserNo(attdNo, userNo);
				if(attdStatus == null ) attdStatus = "no";
				String description = chrisDao.getDescriptionViaAttdNoAndUserNo(attdNo, userNo);
				AttendanceVo attdVo = new AttendanceVo();
				attdVo.setAttdStatus(attdStatus);
				attdVo.setClassDate(attdDate);
				attdVo.setAttdNo(attdNo);
				if( description != null && description != "-" )
					attdVo.setDescription(description);
				onePersonAttdList.add(attdVo);
			}
			onePerson.put("attdList", onePersonAttdList);
			retList.add(onePerson);
			
		}
		
		return retList;
	}
	
	public HashMap<String, Object> getAttdDataMapByClassNoAndDates (
			Long classNo,
			String startDate,
			String endDate ) {
		HashMap<String, Object> retMap = new HashMap<String, Object>();
		
		List<HashMap<String, Object>> dataList = this.getAttdStatusListByClassNoAndDates(classNo, startDate, endDate);
		retMap.put("dataList", dataList );
		retMap.put("attdCounter", ((long)((List<AttendanceVo>)dataList.get(0).get("attdList")).size() ));
		
		String dateDupCheck = "-";
		Long dupCounter = 1L;
		for( HashMap<String, Object>person : dataList ) {
			dupCounter = 2L;
			Long yesNoLateTotalCounter = 0L;
			Long yesOrLateCounter = 0L;//used
			List<AttendanceVo> personalAttdList = (List<AttendanceVo>)person.get("attdList");
			for(AttendanceVo attdVo : personalAttdList ) {
				String classDate = attdVo.getClassDate();
				String temp;
				temp = classDate.substring(0, 2) +"월"+classDate.substring(2)+"일";
				if(dateDupCheck.equals(classDate)) {
					temp += "_"+dupCounter;
					dupCounter +=1;
				}else {
					dupCounter = 2L;
				}
				if(attdVo.getAttdStatus().equals("yes")){
					yesOrLateCounter++;//
					yesNoLateTotalCounter++;//
				}else if( attdVo.getAttdStatus().equals("info")){
				}else if (attdVo.getAttdStatus().equals("late")) {
					yesOrLateCounter++;//
					yesNoLateTotalCounter++;//
				}else if( attdVo.getAttdStatus().equals("no")) {
					yesNoLateTotalCounter++;//
				}
				dateDupCheck = classDate;
				attdVo.setClassDate(temp);
			}
			System.out.println("yesNo counter : "+yesNoLateTotalCounter);
			if(yesNoLateTotalCounter == 0L) {
				person.put("attdRate", "N/A");
			}else {
				person.put("attdRate", 100*yesOrLateCounter/yesNoLateTotalCounter);
			}
			System.out.println("yesNo counter : "+yesNoLateTotalCounter);
		}
		retMap.put("startDate", startDate);
		retMap.put("endDate", endDate);
		
		return retMap;
	}
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	//////////////////////////////////////////////////// 사용중      /////////////////////////////////////////////////////////////////
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	

	/***********TEST DONE
	 * @param attdVo (userNo, classNo, 필수)
	 * @return
	 * classNo받아서 그 class의 출석 시작. 
	 * 출석 시작할때 attd 출석중 으로 입력
	 */
	public boolean startAttd( AttendanceVo  attdVo ) {
		boolean retFlag = false;
		retFlag = attdDao.insertStartAttd(attdVo);
		return retFlag;
	}
	
	/************ test DONE
	 * @param classNo
	 * @return 지각으로 update된 row 숫자
	 * 변경된 숫자 없으면 -1L return
	 *  * 해당 classNo 의 출첵중을 모두 결석으로 변경
	 */
	public Long endAttd ( Long classNo) {
		Long retLong = -1L;
		retLong = attdDao.updateEndAttdViaClassNo(classNo);
		return retLong;
	}
	
	
	
	
//	public List<HashMap<String, Object>> getClassAttdInfoListByDateAndUserNo ( String strDate, Long userNo ) {
//		List<HashMap<String, Object>> retList = null;
//		retList = attdDao.getClassAttdInfoListByDateAndUserNo(strDate, userNo);
//		return retList;
//	}
//	public HashMap<String, Object> getClassAttdInfoByDateAndUserNoAndClassNo ( String strDate, Long userNo, Long classNo ) {
//		HashMap<String, Object> retMap = null;
//		return retMap;
//	}
	
	
	
	/*public boolean startAttdTimer ( Long classNo ) {
		boolean retFlag  =false;
		AttdThread attdThread = new AttdThread(classNo);
		Timer timer1 = new Timer();
		timer1.schedule(attdThread, 5000);
		return retFlag;
	}*/
}
