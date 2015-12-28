package com.bit2015.bitin.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bit2015.bitin.vo.AttdNumberVo;
import com.bit2015.bitin.vo.AttendanceVo;

@Repository
public class AttdDao {
	@Autowired
	SqlSession sqlSession;
	
	
	
	
	/**
	 * @param attdNumberVo (randomNumber, classNo ) 필수
	 * @return 성공하면 true return
	 */
	public boolean insertAttdNumberVo ( AttdNumberVo attdNumberVo ) {
		boolean retFlag = false;
		System.out.println("@dao attdNumberVo : "+attdNumberVo);
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
		retFlag = (1== sqlSession.insert("attd.insertStartAttd",attdVo));
		return retFlag;
	}

	/************ test DONE
	 * @param classNo
	 * @return 지각으로 update된 row 숫자
	 * 변경된 숫자 없으면 -1L return
	 *  * 해당 classNo 의 출첵중을 모두 결석으로 변경
	 */
	public Long updateEndAttdViaClassNo (Long classNo ) {
		Long retLong = -1L;
		System.out.println("@dao : classNo : "+classNo);
		retLong = (long)sqlSession.update("attd.updateEndAtttdViaClassNo" , classNo);
		return retLong;
	}
	
	
	
	
	/************** 송이 사용중
	 * @param strDate (YYYYMMDD) 형식
	 * @param userNo
	 * @return 	해당 유저(선생)가  출석체크 실행한 특정 date의 수업목록들 List<강의명, startTime,  출석한 인원수, 전체인원수>
	 */
	public List<HashMap<String, Object>> getClassAttdInfoListByAttdNoAndUserNo ( String strDate, Long userNo,String classRole ) {
		System.out.println("the dao");
		List<HashMap<String, Object>> retList = null;
		HashMap<String, Object> inputMap = new HashMap<String, Object>();
		inputMap.put("userNo", userNo);//10L
		inputMap.put("strDate", "20151208");
		inputMap.put("classRole", classRole);
		retList = sqlSession.selectList("attd.getClassAttdByDateAndUserNo", inputMap );
		System.out.println("The Dao result : "+retList);
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
	
	public Long getClassNoByAttdNo ( Long attdNo ) {
		Long retLong = null;
		System.out.println("attdNo @: "+ attdNo);
		retLong =  sqlSession.selectOne("attd.getClassNoByAttdNo", attdNo);
		return retLong;
	}
	public List<HashMap<String, Object>> getAttdStatusListByUserNo ( Long userNo ) {
		List<HashMap<String, Object>> retList = null;
		retList = sqlSession.selectList("attd.getAttdStatusListByUserNo", userNo);
		return retList;
	}
}
