package com.bit2015.bitin.service;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit2015.bitin.dao.ClassDao;
import com.bit2015.bitin.vo.ClassVo;
import com.bit2015.bitin.vo.UserVo;


@Service
public class ClassService {
	@Autowired
	ClassDao classDao;
	
	/**********TEST DONE
	 * @param className
	 * @return classNo
	 * className 갖고 있는  classNo return
	 * className 겹치면 안됨
	 */
	public Long getClassNoViaClassName (String className ) {
		Long retLong = -1L;
		retLong = classDao.getClassNoViaClassName(className);
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
		retList = classDao.getClassInfoByUserId(userId);
		return retList;
	}
	
	public List<HashMap<String, Object>> getStudentPhoneIdListByUserId (String userId ){
		List<HashMap<String, Object>> retList = null;
		retList = classDao.getCLassListByUserId(userId);
		
		for( HashMap<String, Object> map : retList){
			Long classNo = ((BigDecimal)map.get("CLASS_NO")).longValue();
			List<String> phoneIdList = null;
			phoneIdList = classDao.getStudentPhoneIdListViaClassNo(classNo);
			map.put("PHONE_ID_LIST", phoneIdList);
		}
		return retList;
	}
	
	/************* 송이 사용할거 - testserver2 사용중   [test done]
	 * @param userId
	 * @return List<수업Name, 수업No>
	 * userId 의 id를 가진 유저가 듣는 수업'들'의 CLASS_NAME, CLASS_NO return 
	 */
	public List<HashMap<String, Object>> getClassNameAndNoByUserId ( String userId ) {
		List<HashMap<String, Object>> retList = null;
		retList = classDao.getClassNameAndNoViaUserId(userId);
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
		retFlag = classDao.insertClass(classVo);
		return retFlag;
	}
	
	/********* TEST DONE
	 * @param userNo
	 * @param classNo
	 * @param role
	 * @return insert되면 return true
	 */
	public boolean joinClass(Long userNo, Long classNo, String classRole) {
		return classDao.joinClass(userNo, classNo, classRole);
	}
	
	
	public List<HashMap<String, Object>> getClassInfoListOfUserNo (Long userNo ) {
		List<HashMap<String, Object>> retList = null;
		retList = classDao.getClassInfoListOfUserNo(userNo);
		return retList;
	}

	public HashMap<String, Object> getClassInfoViaClassNo (Long classNo ) {
		HashMap<String, Object> retMap = null;
		classDao.getClassInfoViaClassNo(classNo);
		return retMap;
	}

	/******** 송이 사용중
	 * @param userNo
	 * @return
	 */
	public List<ClassVo> getClassNameTimeListByUserNo(Long userNo ){
		List<ClassVo> retList = null;
		retList = classDao.getClassNameTimeListByUserNo(userNo);
		return retList;
	}
	/************* 송이 사용중
	 * @param userNo
	 * @return
	 */
	public List<String> getClassNameListByUserNo ( Long userNo ) {
		List<String> retList = null;
		retList = classDao.getClassNameListByUserNo(userNo);
		return retList;
	}
	
	
	
	
	/*********TEST DONE
	 * @param classNo
	 * @return
	 * 수업 듣는 사람의 userNo, userId, userName, userPhoneId
	 */
	public List<UserVo> getUserInfoListViaClassNo ( Long classNo) {
		List<UserVo> retList = null;
		retList = classDao.getUserInfoListViaClassNo( classNo);
		return retList;
	}
	
	
}
