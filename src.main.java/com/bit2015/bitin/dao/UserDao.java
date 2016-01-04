package com.bit2015.bitin.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bit2015.bitin.vo.UserVo;

@Repository
public class UserDao {
	@Autowired
	SqlSession sqlSession;
	
	/**
	 * @param userId (Id가 고유한 아이디 아니면 error 남)
	 *  TODO : ( selectOne 으로 해서 안나려나???????????????????????)
	 * @return userNo
	 * userId에 해당하는 userNo return함
	 */
	public Long getUserNoViaUserId ( String userId ) {
		Long retLong = 0L;
		retLong = sqlSession.selectOne("user.getUserNoViaUserId", userId);
		return retLong;
	}
	
	//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	////////////////////////////////////////////////////사용중      /////////////////////////////////////////////////////////////////
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	
	/**
	 * @param userVo (userId, userName, userPassword, userPhoneId )필수
	 * @return 잘 insert되면 true return
	 * 실패하면 false return
	 */
	public boolean insertUser( UserVo userVo) {
		boolean retFlag = false;
		System.out.println("@@userDao : userVO : "+userVo);
		try {
			retFlag = ( 1== sqlSession.insert("user.insert", userVo));
		} catch (Exception e) {
			System.out.println("@bitin@UserDao -  exception 발생 !!!!!!!!!!!!!!!!!!!!!!! exception e : "+e);
			e.printStackTrace();
		}
		return retFlag;
	}

	
	/**
	 * @param String id
	 * @return id가 있는지 확인. 있으면 true return.
	 */
	public UserVo getUserById ( String userId ){
		UserVo retVo = null;
		retVo = sqlSession.selectOne("user.getUserById", userId);
		return retVo;
	}
	
	
	
	
	/**
	 * @param userVo
	 * @return 아이디 비번 일치하면 true보냄
	 * 불일치 하면 false
	 */
	public boolean checkIdAndPassword (UserVo userVo ) {
		if ( sqlSession.selectOne("user.getUserVoByIdAndPassword", userVo) == null )
			return false;
		else {
			return true;
		}
	}
	
	/**
	 * @return 모든 userVo 의 List
	 */
	public List<UserVo> getUserListAll( ) {
		List<UserVo> retList = null;
		retList = sqlSession.selectList("user.getUserListAll");
		return retList;
	}
	
	
	public UserVo getUserVoViaIdAndPassword( UserVo userVo ){
		UserVo retVo = null; 
		retVo = sqlSession.selectOne("user.getUserVoByIdAndPassword", userVo);
		return retVo;
	}
	public void updatePhoneId( UserVo userVo ){
		sqlSession.update("user.updatePhoneId", userVo);
	}
	
	
	
	public Long getUserNoViaUserPhoneId (String userPhoneId ) {
		Long retLong = 0L;
		retLong = sqlSession.selectOne("user.getUserNoViaUserPhoneId", userPhoneId);
		return retLong;
	}
	
	
	
	/**
	 * @param classNo 
	 * @return List<String> 으로 List<"userPhoneId"> return 함
	 *  classNo의 class안에 있는 유저들의 phone id return 함
	 */
	public List<String> getPhoneIdListByClassNo (Long classNo){
		List<String> retList = null;
		retList = sqlSession.selectList("user.getPhoneIdListByClassNo" , classNo);
		return retList;
	}
	
	
	/************* TEST 완료 
	 * @param userId
	 * @return userId가 들어가 있는 수업의 목록
	 * List<String >    형태로 
	 */
	public List<HashMap<String, Object>>  getClassNameListByTeacherId (String userId) {
		List<HashMap<String, Object>> retList = null;
		retList = sqlSession.selectList("user.getClassNameListByTeacherId", userId);
		return retList;
	}
	
	
	/** test 안함
	 * @param vo
	 * @return
	 */
	public UserVo get( UserVo vo ) {
		UserVo userVo = sqlSession.selectOne( "user.getUserVoByIdAndPassword",  vo );
		return userVo;
	}
	
	public List<UserVo> classmateList( UserVo vo ) {
		List<UserVo> list = sqlSession.selectList( "user.classmateList",  vo );
		return list;
	}

	
	public List<UserVo> classnameList( UserVo vo ) {
		System.out.println("test" + vo);
		List<UserVo> list2 = sqlSession.selectList( "user.classnameList",  vo.getUserNo() );
		System.out.println("list2 : " + list2);
		return list2;
	}
	
	
	
	public String userIdByPhoneId( UserVo vo ) {
		System.out.println(vo);
		String retString = sqlSession.selectOne( "user.userIdByPhoneId",  vo );
		System.out.println(retString);
		return retString;
	}
	
	public UserVo getProfilebyUserNo(Long userNo) {
		UserVo userVo = sqlSession.selectOne("user.getProfilebyUserNo", userNo);
		return userVo;
	}
	
	public String getUserNamebyUserNo (Long userNo ) { 
		String userName = sqlSession.selectOne("user.getUserNamebyUserNo",userNo);
		System.out.println("dao Name "+ userName);
		return userName;
	}
	
	
}
