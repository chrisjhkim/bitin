package com.bit2015.bitin.service;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit2015.bitin.dao.AttdDao;
import com.bit2015.bitin.dao.ClassDao;
import com.bit2015.bitin.dao.UserDao;
import com.bit2015.bitin.vo.AttdNumberVo;
import com.bit2015.bitin.vo.AttendanceVo;


@Service
public class AttdService {
	@Autowired
	AttdDao attdDao;

	@Autowired
	ClassDao classDao;
	
	@Autowired
	UserDao userDao;
	/**
	 * @param attdNumberVo (randomNumber, classNo ) 필수
	 * @return 성공하면 true return
	 */
	public boolean insertAttdNumberVo ( AttdNumberVo attdNumberVo ) {
		
		boolean retFlag = false;
		retFlag = attdDao.insertAttdNumberVo(attdNumberVo);
		return retFlag;
	}
	

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
	 *//*
	public Long endAttd ( Long classNo) {
		Long retLong = -1L;
		retLong = attdDao.updateEndAttdViaClassNo(classNo);
		return retLong;
	}*/
	
	
	/** The ONe
	 * @param strDate
	 * @param userNo
	 * @return
	 */
	public List<HashMap<String, Object>> getClassAttdInfoListByAttdNoAndUserNo ( String strDate, Long userNo,String classRole ) {
		List<HashMap<String, Object>> retList = null;
		retList = attdDao.getClassAttdInfoListByAttdNoAndUserNo(strDate, userNo,classRole);
		return retList;
	}
	
	/**
	 * @param attdNo 어떤 출첵때 였냐
	 * @return 
	 */
	public List<HashMap<String, Object>> getClassAttdInfoListByAttdNo ( Long attdNo ) {
		List<HashMap<String, Object>> retList = null;
		System.out.println("attdNo : "+attdNo);
		Long classNo = attdDao.getClassNoByAttdNo(attdNo);
		
		System.out.println("classNo : "+ classNo);
		retList = attdDao.getClassAttdInfoListByClassNoAndAttdNo( classNo);
		
		System.out.println("pre_retList : "+retList);
		
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
	public String getClassNameViaAttdNo(Long attdNo ) {
		String retString = null;
		retString = classDao.getClassNameViaAttdNo(attdNo);
		return retString;
	}
	public Long getClassNoViaAttdNo(Long attdNo){
		Long retLong = null;
		retLong = classDao.getClassNoViaAttdNo(attdNo);
		return retLong;
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
	 * @param classNo
	 * @param startDate
	 * @param endDate
	 * 결석은 no / 출석은 yes / (TODO : 지각 late / 병결 abc)
	 * @return
	 */
	public List<HashMap<String, Object>> getAttdStatusViaClassNoAndDates(	//반 전체의 출석부
			Long classNo,
			String startDate,
			String endDate	) {
		List<HashMap<String, Object>> retList = new ArrayList<HashMap<String,Object>>();
		
		List<Long> stuList = classDao.getStudentNoListViaClassNo(classNo);								//userNo 목록
		List<Long> attdNumList = classDao.getAttdNumListViaClassNoAndDates(classNo, startDate, endDate);   // attdNo 목록
		for(Long userNo : stuList ) {														
			HashMap<String, Object> onePerson = new HashMap<String, Object>();
			onePerson.put("userNo", userNo);													
			onePerson.put("userName", userDao.getUserNameViaUserNo(userNo) );				//userName
			
			List<AttendanceVo> attdPerson = new ArrayList<AttendanceVo>();					//AttendanceVo
			for( Long attdNo : attdNumList ) {
				String attdDate = attdDao.getAttdDateViaAttdNo(attdNo);							//vo.classDate
				String attdStatus = attdDao.getAttdStatusViaAttdNoAndUserNo(attdNo, userNo);
				String description = attdDao.getDescriptionViaAttdNoAndUserNo(attdNo, userNo);
				if( attdStatus == null ) {
					attdStatus = "no";
				}
				AttendanceVo attdVo = new AttendanceVo();
				attdVo.setAttdStatus(attdStatus);
				attdVo.setClassDate(attdDate);
				attdVo.setAttdNo(attdNo);
				if( description != null && description != "-"){
					attdVo.setDescription(description);
				}
				attdPerson.add(attdVo);
			}
			onePerson.put("attdList", attdPerson);
			retList.add(onePerson);
		}
		System.out.println("result List : "+retList);
		return retList;
	}
	
	
	public Long getAttdNoOfRecentTimeNullViaClassNo( Long classNo ) {
		Long retLong = null;
		retLong = attdDao.getAttdNoOfRecentTimeNullViaClassNo(classNo);
		return retLong;
	}
	
	
	
	public Long updateTimerAndCreatedDate (Long timer, Long attdNo , String startTime) {
		Long retLong = -1L;
		retLong = attdDao.updateTimerAndCreatedDate(timer, attdNo, startTime);
		return retLong;
	}
	
	public HashMap<String,Object> getRecentTimerAndDateViaClassNo ( Long classNo ) {
		HashMap<String,Object> retMap = null;
		attdDao.getRecentTimerAndDateViaClassNo(classNo);
		return retMap;
	}

	public Long getAttdNoViaClassDateAndClassNo (String classDate, Long classNo , Long attdIndex) {
		Long retLong = null;
		retLong = attdDao.getAttdNoViaClassDateAndClassNo(classDate, classNo, attdIndex);
		return retLong;
	}

	public String getAttdStatusViaAttdNoAndUserNo( Long attdNo , Long userNo ){
		String retString = null;
		retString = attdDao.getAttdStatusViaAttdNoAndUserNo(attdNo, userNo);
		return retString;
	}
	
	public boolean insertAttdVo ( AttendanceVo attdVo ) {
		boolean retFlag = false;
		if( attdVo.getattdNo()==null || attdVo.getAttdStatus()==null || attdVo.getUserNo()==null){
			System.out.println("@attdService insertAttdVo 뭔가 null 임. ");
			return false;
		}
		if( attdVo.getDescription() == null ){
			attdVo.setDescription("-");
		}
		retFlag = attdDao.insertAttdVo(attdVo);
		return retFlag;
	}
	
	public boolean deleteAttd ( Long userNo, Long attdNo ) {
		boolean retFlag = false;
		retFlag = attdDao.deleteAttd(userNo, attdNo);
		return retFlag;
	}
	public boolean updateAttd(Long oldUserNo, Long oldAttdNo, String newAttdStatus) {
		boolean retFlag = false;
		retFlag = attdDao.updateAttd(oldUserNo, oldAttdNo, newAttdStatus);
		return retFlag;
	}
}
