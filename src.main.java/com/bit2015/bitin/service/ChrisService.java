package com.bit2015.bitin.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit2015.bitin.dao.ChrisDao;
import com.bit2015.bitin.dao.ClassDao;
import com.bit2015.bitin.dao.UserDao;
import com.bit2015.bitin.vo.AttendanceVo;

@Service
public class ChrisService {
	@Autowired
	ChrisDao chrisDao;
	@Autowired
	UserDao userDao;
	@Autowired
	ClassDao classDao;
	
	public List<HashMap<String, Object>> getAttdStatusViaClassNoAndDates(	//반 전체의 출석부
			Long classNo,
			String startDate,
			String endDate	) {
		List<HashMap<String, Object>> retList = new ArrayList<HashMap<String,Object>>();
		System.out.println("@@1");
		List<Long> stuList = chrisDao.getStudentNoListViaClassNo(classNo);								//userNo 목록
		List<Long> attdNumList = chrisDao.getAttdNumListViaClassNoAndDates(classNo, startDate, endDate);   // attdNo 목록
		System.out.println("@@2");
		for(Long userNo : stuList ) {														
			HashMap<String, Object> onePerson = new HashMap<String, Object>();
			onePerson.put("userNo", userNo);													
			onePerson.put("userName", chrisDao.getUserNameViaUserNo(userNo) );				//userName
			
			List<AttendanceVo> attdPerson = new ArrayList<AttendanceVo>();					//AttendanceVo
			for( Long attdNo : attdNumList ) {
				String attdDate = chrisDao.getAttdDateViaAttdNo(attdNo);							//vo.classDate
				String attdStatus = chrisDao.getAttdStatusViaAttdNoAndUserNo(attdNo, userNo);
				String description = chrisDao.getDescriptionViaAttdNoAndUserNo(attdNo, userNo);
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
	
	public Long getClassNoViaAttdNo(Long attdNo){
		Long retLong = null;
		retLong = chrisDao.getClassNoViaAttdNo(attdNo);
		return retLong;
	}
	public Long getAttdNoViaClassDateAndClassNo (String classDate, Long classNo , Long attdIndex) {
		Long retLong = null;
		retLong = chrisDao.getAttdNoViaClassDateAndClassNo(classDate, classNo, attdIndex);
		return retLong;
	}
	public String getAttdStatusViaAttdNoAndUserNo( Long attdNo , Long userNo ){
		String retString = null;
		retString = chrisDao.getAttdStatusViaAttdNoAndUserNo(attdNo, userNo);
		return retString;
	}
	public boolean insertAttdVo ( AttendanceVo attdVo ) {
		boolean retFlag = false;
		if( attdVo.getAttdNo()==null || attdVo.getAttdStatus()==null || attdVo.getUserNo()==null){
			System.out.println("@attdService insertAttdVo 뭔가 null 임. ");
			return false;
		}
		if( attdVo.getDescription() == null ){
			attdVo.setDescription("-");
		}
		retFlag = chrisDao.insertAttdVo(attdVo);
		return retFlag;
	}

	public boolean deleteAttd ( Long userNo, Long attdNo ) {
		boolean retFlag = false;
		retFlag = chrisDao.deleteAttd(userNo, attdNo);
		return retFlag;
	}
	public boolean updateAttd(Long oldUserNo, Long oldAttdNo, String newAttdStatus) {
		boolean retFlag = false;
		retFlag = chrisDao.updateAttd(oldUserNo, oldAttdNo, newAttdStatus);
		return retFlag;
	}
	public Long getClassNoViaPostNo (Long postNo ) {
		Long retLong = null;
		retLong =chrisDao.getClassNoViaPostNo(postNo);
		return retLong; 
	}
	public Long getLastRandomNumberByClassNo ( Long classNo ) {
		Long retLong = null;
		retLong = chrisDao.getLastRandomNumberByClassNo(classNo);
		return retLong; 
	}
}