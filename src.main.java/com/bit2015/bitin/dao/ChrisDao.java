package com.bit2015.bitin.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bit2015.bitin.vo.AttdNumberVo;
import com.bit2015.bitin.vo.AttendanceVo;

@Repository
public class ChrisDao {
	@Autowired
	SqlSession sqlSession;

	/** 사용중
	 * @param classNo
	 * @return
	 */
	public List<Long> getStudentNoListViaClassNo ( Long classNo ) {
		List<Long> retList = null;
		retList = sqlSession.selectList("chris.getStudentNoListViaClassNo", classNo);
		return retList;
	}
	
	
	/** 사용중
	 * @param classNo
	 * @param startDate
	 * @param endDate
	 * @return
	 */
	public List<Long> getAttdNumListViaClassNoAndDates( Long classNo, String startDate, String endDate ) {
		List<Long> retList = null;
		HashMap<String, Object> inputMap = new HashMap<String, Object>();
		inputMap.put("classNo", classNo);
		inputMap.put("startDate", startDate);
		inputMap.put("endDate", endDate);
		System.out.println("dao inputMap : "+inputMap);
		retList = sqlSession.selectList("chris.getAttdNumListViaClassNo", inputMap);
		return retList;
	}
	/** 사용중
	 * @param userNo
	 * @return
	 */
	public String getUserNameViaUserNo ( Long userNo ) {
		String userName = null;
		userName = sqlSession.selectOne("chris.getUserNameViaUserNo", userNo);
		return userName;
	}
	
public boolean insertAttdNumberVo ( AttdNumberVo attdNumberVo ) {
		
		boolean retFlag = false;
		retFlag = (1==sqlSession.insert("attd.insertAttdNumberVo", attdNumberVo) );
		return retFlag;
	}
	
	/**
	 * @param attdVo (userNo, classNo, 필수)
	 * @return
	 * 출석 시작할때 attd 출석중 으로 입력
	 */
	public boolean insertStartAttd (AttendanceVo attdVo) {
		boolean retFlag = false;
		//TODO : attendanceVo 에서 classNo에서 attdNo 로 바뀜. 수정필요한거는 수정하기
		retFlag = (1== sqlSession.insert("attd.insertStartAttd",attdVo));
		return retFlag;
	}

	/************ test DONE
	 * @param classNo
	 * @return 지각으로 update된 row 숫자
	 * 변경된 숫자 없으면 -1L return
	 *  * 해당 classNo 의 출첵중을 모두 결석으로 변경
	 *//*
	public Long updateEndAttdViaClassNo (Long classNo ) {
		Long retLong = -1L;
		System.out.println("@dao : classNo : "+classNo);
		retLong = (long)sqlSession.update("attd.updateEndAtttdViaClassNo" , classNo);
		return retLong;
	}*/
	
	
	
	
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
	public List<HashMap<String, Object>> getClassAttdInfoListByAttdNoAndUserNo ( String strDate, Long userNo,String classRole ) {
		List<HashMap<String, Object>> retList = null;
		HashMap<String, Object> inputMap = new HashMap<String, Object>();
		inputMap.put("userNo", userNo);//10L
		inputMap.put("strDate", "20151208"); //20151208 TODO 
		inputMap.put("classRole", classRole);
		retList = sqlSession.selectList("attd.getClassAttdByDateAndUserNo", inputMap );
		return retList;
	}

	public List<HashMap<String, Object>> getClassAttdInfoListByClassNoAndAttdNo ( Long classNo) {
		List<HashMap<String, Object>> retList = null;
		retList = sqlSession.selectList("class.getStudentHashMapListViaClassNo", classNo);
		return retList;
	}
	public String getAttdStatusViaAttdNoAndUserNo( Long attdNo, Long userNo) {
		String retString = null;
		HashMap<String, Object> inputMap = new HashMap<String, Object>();
		inputMap.put("attdNo", attdNo);
		inputMap.put("userNo", userNo);
		retString = sqlSession.selectOne("attd.getAttdStatusViaAttdNoAndUserNo", inputMap);
		return retString;
	}
	/** 사용중
	 * @param attdNo
	 * @param userNo
	 * @return
	 */
	public String getDescriptionViaAttdNoAndUserNo( Long attdNo, Long userNo) {
		String retString = null;
		HashMap<String, Object> inputMap = new HashMap<String, Object>();
		inputMap.put("attdNo", attdNo);
		inputMap.put("userNo", userNo);
		retString = sqlSession.selectOne("chris.getDescriptionViaAttdNoAndUserNo", inputMap);
		return retString;
	}
	
	public Long getClassNoByAttdNo ( Long attdNo ) {
		Long retLong = null;
		retLong =  sqlSession.selectOne("attd.getClassNoByAttdNo", attdNo);
		return retLong;
	}
	public List<HashMap<String, Object>> getAttdStatusListByUserNo ( Long userNo ) {
		List<HashMap<String, Object>> retList = null;
		retList = sqlSession.selectList("attd.getAttdStatusListByUserNo", userNo);
		return retList;
	}
	
	/** 사용중
	 * @param attdNo
	 * @return
	 */
	public String getAttdDateViaAttdNo (Long attdNo ) {
		String retString = null;
		retString = sqlSession.selectOne("chris.getAttdDateViaAttdNo",attdNo);
		return retString;
	}
	
	public Long getAttdNoOfRecentTimeNullViaClassNo( Long classNo ) {
		Long retLong = null;
		retLong = sqlSession.selectOne("attd.getAttdNoOfRecentTimeNullViaClassNo", classNo);
		return retLong;
	}
	
	public Long updateTimerAndCreatedDate (Long timer, Long attdNo , String startTime) {
		Long retLong = -1L;
		HashMap<String, Object> inputMap = new HashMap<String, Object>();
		inputMap.put("timer", timer);
		inputMap.put("attdNo",attdNo);
		inputMap.put("startTime", startTime);
		retLong = (long)sqlSession.update("attd.updateAttdTime", inputMap);
		return retLong;
	}
	
	public HashMap<String,Object> getRecentTimerAndDateViaClassNo ( Long classNo ) {
		HashMap<String,Object> retMap = null;
		sqlSession.selectList("attd.getRecentTimerAndDateViaClassNo",classNo);
		return retMap;
	}
	
	/** 사용중
	 * @param classDate
	 * @param classNo
	 * @param attdIndex
	 * @return
	 */
	public Long getAttdNoViaClassDateAndClassNo (String classDate, Long classNo , Long attdIndex) {
		Long retLong = null;
		HashMap<String, Object> inputMap = new HashMap<String, Object>();
		inputMap.put("classDate", classDate);
		inputMap.put("classNo", classNo);
		inputMap.put("attdIndex", attdIndex);
		retLong = sqlSession.selectOne("chris.getAttdNoViaClassDateAndClassNo", inputMap);
		return retLong;
	}
	
	public boolean insertAttdVo ( AttendanceVo attdVo ) {
		boolean retFlag = false;
		retFlag = (1 == sqlSession.insert("chris.insertAttdVo", attdVo));
		return retFlag;
	}
	
	/** 사용중
	 * @param userNo
	 * @param attdNo
	 * @return
	 */
	public boolean deleteAttd ( Long userNo, Long attdNo ) {
		boolean retFlag = false;
		HashMap<String, Object> inputMap = new HashMap<String, Object>();
		inputMap.put("userNo", userNo);
		inputMap.put("attdNo", attdNo);
		sqlSession.delete("chris.delteAttd",inputMap);
		return retFlag;
	}

	public boolean updateAttd(Long oldUserNo, Long oldAttdNo, String newAttdStatus) {
		boolean retFlag = false;
		AttendanceVo inputVo = new AttendanceVo();
		inputVo.setUserNo(oldUserNo);
		inputVo.setAttdNo(oldAttdNo);
		inputVo.setAttdStatus(newAttdStatus);
		retFlag = ( 1== sqlSession.update("chris.updateAttd", inputVo));
		return retFlag;
	}
	/** 사용중
	 * @param attdNo 
	 * @return
	 */
	public Long getClassNoViaAttdNo ( Long attdNo ) {
		Long retLong = null;
		retLong = sqlSession.selectOne("chris.getClassNoViaAttdNo", attdNo );
		return retLong;
	}
	
	public Long getClassNoViaPostNo (Long postNo ) { 
		Long retLong = null;
		retLong  = sqlSession.selectOne("chris.getClassNoViaPostNo",postNo);
		System.out.println("dao classNo "+retLong);
		return retLong;
	}
	
	public Long getLastRandomNumberByClassNo ( Long classNo ) {
		Long retLong = null;
		retLong = sqlSession.selectOne("chris.getLastRandomNumberByClassNo", classNo);
		return retLong;
	}
}