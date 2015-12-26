package com.bit2015.bitin.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit2015.bitin.dao.UserDao;
import com.bit2015.bitin.vo.UserVo;


@Service
public class UserService {
	
	
	@Autowired
	UserDao userDao;
	
	/**
	 * @param userVo (id, name, password 필수 ) (phoneId 필수아님)
	 * @return 잘 insert되면 true return
	 * 실패하면 false return
	 */
	public boolean insertUser( UserVo userVo) {
		boolean retFlag = false;
		if(userVo.getUserPhoneId()==null ){
			userVo.setUserPhoneId("-");
		}
		retFlag = userDao.insertUser(userVo);
		return retFlag;
	}
	
	/**
	 * @param String id
	 * @return id가 있는지 확인. 있으면 true return.
	 */
	public boolean checkExistUserViaId ( String id ){
		boolean retFlag = false;
		if (userDao.getUserById(id) != null ) {
			retFlag = true;
		}
		return  retFlag;
	}
	
	
	
	public UserVo getUserVo ( String id ){
		UserVo retVo = null;
		retVo = userDao.getUserById(id);
		return  retVo;
	}
	
	
	/**
	 * @param userVo
	 * @return 아이디 비번 일치하면 true보냄
	 * 불일치 하면 false
	 */
	public boolean checkIdAndPassword(UserVo userVo ) {
		return userDao.checkIdAndPassword(userVo);
	}
	
	/**
	 * @return 모든 userVo 의 List
	 */
	public List<UserVo> getUserListAll ( ) {
		List<UserVo> retList = null;
		retList = userDao.getUserListAll();
		return retList;
	}
	
	public UserVo getUserVoViaIdAndPassword( UserVo userVo ){
		userDao.updatePhoneId(userVo);
		UserVo retVo = userDao.getUserVoViaIdAndPassword(userVo);
		return retVo;
	}
	
	/**
	 * @param userId (Id가 고유한 아이디 아니면 error 남)
	 * @return userNo
	 * userId에 해당하는 userNo return함
	 */
	public Long getUserNoViaUserId ( String userId ) {
		Long retLong = 0L;
		retLong = userDao.getUserNoViaUserId(userId);
		return retLong;
	}
	
	
	/**
	 * @param classNo 
	 * @return List<String> 으로 List<"userPhoneId"> return 함
	 *  classNo의 class안에 있는 유저들의 phone id return 함
	 */
	public List<String> getUserPhoneIdListByClassNo (Long classNo) {
		List<String> retList= null;
		retList = userDao.getPhoneIdListByClassNo(classNo); 
		return retList;
	}
	
	
	/************Test done
	 * @param lat1, lon1
	 * @param lat2, lon2
	 * @return m 단위로 반환
	 */
	public double calDistance(double lat1, double lon1, double lat2, double lon2){  
	    double theta, dist;  
	    theta = lon1 - lon2;  
	    dist = Math.sin(deg2rad(lat1)) * Math.sin(deg2rad(lat2)) + Math.cos(deg2rad(lat1))   
	          * Math.cos(deg2rad(lat2)) * Math.cos(deg2rad(theta));  
	    dist = Math.acos(dist);  
	    dist = rad2deg(dist);  
	      
	    dist = dist * 60 * 1.1515;   
	    dist = dist * 1.609344;    // 단위 mile 에서 km 변환.  
	    dist = dist * 1000.0;      // 단위  km 에서 m 로 변환  
	  
	    return dist;  
	}  
	// 주어진 도(degree) 값을 라디언으로 변환  
	private double deg2rad(double deg){  
	    return (double)(deg * Math.PI / (double)180d);  
	}  
	// 주어진 라디언(radian) 값을 도(degree) 값으로 변환  
	private double rad2deg(double rad){  
	    return (double)(rad * (double)180d / Math.PI);
	    
	}
	
	/************* TEST 완료 
	 * @param userId
	 * @return userId가 들어가 있는 수업의 목록
	 * List<String >    형태로 
	 */
	public List<HashMap<String, Object>>  getClassNameListByTeacherId (String userId) {
		List<HashMap<String, Object>>retList = null;
		//TODO : retList 뽑아오는 과정
		retList = userDao.getClassNameListByTeacherId(userId);
		return retList;
	}

	
	/**
	 * @param vo
	 * @return vo
	 *  auth를 사용한 로그인
	 */
	public UserVo login( UserVo vo ) {
		UserVo userVo = userDao.get( vo );
		return userVo;
	}
	
	public List<UserVo> classmateList(UserVo vo){
		List<UserVo> list = userDao.classmateList( vo );
		return list;
	}
	
	
	public List<UserVo> classnameList(UserVo vo){
		List<UserVo> list2 = userDao.classnameList( vo );
		System.out.println("list2" + list2);
		return list2;
	}
	
	
	
	public String userIdByPhoneId(UserVo userVo){
		String retString = userDao.userIdByPhoneId(userVo);
		return retString;
	}
}
