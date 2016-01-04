package com.bit2015.bitin.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit2015.bitin.dao.ClassDao;
import com.bit2015.bitin.dao.UserDao;
import com.bit2015.bitin.vo.QnaQVo;
import com.bit2015.bitin.vo.YjQVo;


@Service
public class UtilService {
	@Autowired
	UserDao userDao;
	@Autowired
	ClassDao classDao;
	
	/**
	 * @param inputStrDate
	 * @return
	 * 2015/1/11 형태의 date 를 20150111 로 변경해줌
	 * 
	 */
	public String changeDateFormat(String inputStrDate ) {
		String retString=null;
		
		String[] token = inputStrDate.split("/");
		String year = token[0];
		String month = token[1];
		String day = token[2];
		
		if(month.length() <2){	
			month = "0"+month;	
		}
		if(day.length()<2){		
			day= "0"+day;		
		}
		retString = year+month+day;
		return retString;
	}
	/*******************TEST DONE
	 * 4자리 Long random 숫자 생성
	 * @return 
	 */
	public Long createRandomNumber( ) {
		int randomInt= (int)(Math.random()*10000);
		Long randomLong = Long.parseLong(randomInt+"");
		return randomLong;
	}
	
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////사용중      /////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	
	
	/**
	 * @param yjQVo
	 * @return QnaQVo
	 * 윤주가 보내준 형태의 qVo 를 DB(서버쪽 QVo) 형태로 바꿔줌
	 */
	public QnaQVo transfromYjQVoToQnaQVo (YjQVo preQVo) {
		QnaQVo postQVo = new QnaQVo();
		postQVo.setToWhoNo( userDao.getUserNoViaUserPhoneId(preQVo.getReceiverId()) );
		postQVo.setFromUserNo(userDao.getUserNoViaUserId(preQVo.getSenderId()));
		postQVo.setqMessage(preQVo.getqMessage());
		postQVo.setClassNo(classDao.getClassNoViaClassNameTemp(preQVo.getLesson()) );
		//if( 학생이 선생한테 보낸거면) TODO : 규약 정하기,이후에 추가
		//if( 선생이 학생한테 ) 등등
		postQVo.setqType("StuToTea");
		postQVo.setqRef("-");
		
		return postQVo;
	}
	
	/**
	 * @param strInput
	 * @return HashMap<String,Object>
	 * string으로 들어온 hashmap 으로 hashmap 으로 파싱해줌
	 */
	public Map<String, Object> transformStringToHashMap( String strInput ) {
		Map<String, Object> retMap = new HashMap<String, Object>();
		strInput = strInput.substring(1, strInput.length()-1);	//{, } 두개 지움
		String[] keyValuePairs = strInput.split(",");
		for(String pair : keyValuePairs) {
			String[] entry = pair.split(":");
			String keyName =entry[0].substring(1,entry[0].length()-1);
			String keyValue = entry[1].substring(1,entry[1].length()-1);

			retMap.put(keyName, keyValue);
		}
		return retMap;
	}
	
	
	
	
	/**
	 * @param strInput
	 * @return List<String,Object>
	 * string으로 들어온List를  hashmap 으로 파싱해줌
	 */
	public List<String> transformStringToList( String strInput ) {
		List<String> retList = new ArrayList<>();
		strInput = strInput.substring(1, strInput.length()-1);	//[, ] 두개 지움
		String[] strArray = strInput.split(", ");
		for(String token : strArray ) {
			retList.add(token);
		}
		return retList;
	}
}
