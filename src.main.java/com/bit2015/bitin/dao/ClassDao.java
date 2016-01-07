package com.bit2015.bitin.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bit2015.bitin.vo.ClassVo;
import com.bit2015.bitin.vo.UserVo;

@Repository
public class ClassDao {
	@Autowired
	SqlSession sqlSession;
	
	/**********TEST DONE
	 * @param className
	 * @return classNo
	 * className 갖고 있는  classNo return
	 * className 겹치면 안됨
	 */	
	public Long getClassNoViaClassName (String className ) {
		Long retLong = -1L;
		retLong = sqlSession.selectOne("class.getClassNoViaClassName",className);
		return retLong;
	}
	/**
	 * @param userId 
	 * @return List(hashmap> 으로 
	 * userId가 들어있는 수업 '들'의  수업명, 선생PhoneId
	 * List(class_Name , user_phone_id )
	 */
	public List<HashMap<String, Object>> getClassInfoByUserId ( String userId ) {
		List<HashMap<String, Object>> retList = null;
		retList = sqlSession.selectList("class.getClassNameAndPhoneIdOfThatClassViaUserId",userId);
		return retList;
	}
	public List<HashMap<String, Object>> getCLassListByUserId (String userId ){
		List<HashMap<String, Object>> retList = null;
		retList = sqlSession.selectList("class.getClassNoAndClassNameViaUserId",userId);
		return retList;
	}
	public List<String> getStudentPhoneIdListViaClassNo( Long classNo) {
		List<String> retList = null;
		retList = sqlSession.selectList("class.getStudentPhoneIdListViaClassNo", classNo );
		return retList;
	}
	/************* 송이 사용할거 - testserver2 사용중
	 * @param userId
	 * @return List<수업Name, 수업No>
	 * userId 의 id를 가진 유저가 듣는 수업'들'의 CLASS_NAME, CLASS_NO return 
	 */
	public List<HashMap<String, Object>> getClassNameAndNoViaUserId ( String userId ) {
		List<HashMap<String, Object>> retList = null;
		retList = sqlSession.selectList("class.getClassNameAndNoOfThatClassViaUserId",userId);
		return retList;
	}
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////사용중      /////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	
	/*******************Test done
	 * @param classVo (groupNo, className, classType,
	 * 				   coordName, coordLati, coordLongi,
	 * 				   startTime, endTime,   classRef ) 필수
	 * @return insert되면 return true
	 */
	public boolean insertClass( ClassVo classVo ) {
		boolean retFlag = false;
		retFlag = (1==sqlSession.insert("class.insertClass", classVo) );
		return retFlag;
	}

	
	/********* TEST DONE
	 * @param userNo
	 * @param classNo
	 * @param role
	 * @return insert되면 return true
	 */
	public boolean joinClass(Long userNo, Long classNo, String classRole) {
		boolean retFlag = false;
		HashMap<String, Object> insertMap = new HashMap<String, Object>();
		insertMap.put("userNo", userNo);
		insertMap.put("classNo",classNo);
		insertMap.put("classRole", classRole);
		retFlag = (1 == sqlSession.insert("class.joinClass", insertMap) );
		return retFlag;
	}

	/** 사용중인가.. 모르겠음
	 */
	public List<HashMap<String, Object>> getClassInfoListOfUserNo (Long userNo ) {
		List<HashMap<String, Object>> retList = null;
		retList = sqlSession.selectList("class.getClassInfoListOfUserNo", userNo);
		return retList;
	}
	
	
	public HashMap<String, Object> getClassInfoViaClassNo (Long classNo ) {
		HashMap<String, Object> retMap = null;
		sqlSession.selectOne("class.getClassInfoViaClassNo", classNo);
		return retMap;
	}
	
	
	public Long getClassNoViaClassNameTemp ( String className ) {
		Long retLong = 0L;
		retLong = sqlSession.selectOne("class.getClassNoViaClassName", className);
		System.out.println("@Class Dao className :"+className);
		System.out.println("@Class Dao classNo :"+retLong);
		return retLong;
	}

	public List<String> getClassNameListByUserNo ( Long userNo ) {
		List<String> retList = null;
		retList = sqlSession.selectList("class.getClassNameListByUserNo", userNo);
		return retList;
		
	}

	/******** 송이 사용중
	 * @param userNo
	 * @return
	 */
	public List<ClassVo> getClassNameTimeListByUserNo(Long userNo ){
		List<ClassVo> retList = null;
		retList = sqlSession.selectList("class.getClassNameTimeListByUserNo", userNo);
		return retList;
	}
	
	
	
	
	/*********TEST DONE
	 * @param classNo
	 * @return
	 * 수업 듣는 사람의 userNo, userId, userName, userPhoneId
	 */
	public List<UserVo> getUserInfoListViaClassNo ( Long classNo) {
		List<UserVo> retList = null;
		retList = sqlSession.selectList("class.getUserInfoListViaClassNo", classNo);
		return retList;
	}
	
}
