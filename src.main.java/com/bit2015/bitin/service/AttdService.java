package com.bit2015.bitin.service;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Timer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit2015.bitin.api.thread.AttdThread;
import com.bit2015.bitin.dao.AttdDao;
import com.bit2015.bitin.dao.ClassDao;
import com.bit2015.bitin.vo.AttdNumberVo;
import com.bit2015.bitin.vo.AttendanceVo;


@Service
public class AttdService {
	@Autowired
	AttdDao attdDao;

	@Autowired
	ClassDao classDao;
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
