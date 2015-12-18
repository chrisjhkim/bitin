package com.bit2015.bitin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit2015.bitin.dao.ClassDao;
import com.bit2015.bitin.dao.QnaDao;
import com.bit2015.bitin.dao.UserDao;
import com.bit2015.bitin.vo.QnaQVo;
import com.bit2015.bitin.vo.YjQVo;

@Service
public class QnaQService {
	@Autowired
	QnaDao qnaDao;
	@Autowired
	UserDao userDao;
	@Autowired
	ClassDao classDao;
	@Autowired
	UtilService util;
	
	
/*	*//**
	 * @param preQVo
	 * @return
	 * 윤주가 보내준 형태를 변환,입력 해주는 method 
	 ***********사용안함 : 변환해주는 method , insert해주는 method 로 나눈걸로 사용함 
	 *//*
	public boolean insertYjQVo( YjQVo preQVo ) {
		boolean retFlag = false;
		QnaQVo qVo = util.transfromYjQVoToQnaQVo(preQVo);
		retFlag = qnaDao.insertQ(qVo);
		return retFlag;
	}*/

	/**
	 * @param qVo ( toWhoNo, fromUserNo, qMessage, classNo, qType, qRef) 필요 
	 * @return isnert 성공하면 true 실패하면 false return
	 */
	public boolean insertQ ( QnaQVo qVo ) {
		System.out.println("insertService qVo : "+qVo);
		boolean retFlag = false;
		retFlag = qnaDao.insertQ(qVo);
		return retFlag;
	}
	
	/**
	 * @param YjQVo preQvo   ( 윤주가 안드로이드에서 사용한 Vo 형태)
	 * @return QnaQVo (DB . 서버. 쪽에 맞춘 Vo 형태로 바꿔서 return 해줌)
	 * 
	 * 
	 * 		preQVo.setSenderId((String)inputMap.get("senderId"));
			preQVo.setReceiverId((String)inputMap.get("receiverId"));
			preQVo.setMessage((String)inputMap.get("message"));
			preQVo.setLesson((String)inputMap.get("lesson"));
	 */
	public QnaQVo transformYjQVoToQnaQVo (YjQVo preQVo ) {
		QnaQVo postQVo = new QnaQVo();
		
		postQVo.setToWhoNo( userDao.getUserNoViaUserPhoneId(preQVo.getReceiverId()) );//
		postQVo.setFromUserNo(userDao.getUserNoViaUserId(preQVo.getSenderId()));
		postQVo.setqMessage(preQVo.getqMessage());
		postQVo.setClassNo(classDao.getClassNoViaClassNameTemp(preQVo.getLesson()) );
		postQVo.setPptNo(preQVo.getPptNo());
		//TODO:qType, qRef  에 관한 규약 안정해져있음
		postQVo.setqType("StuToTea");
		postQVo.setqRef("-");
		System.out.println("transform : postQVo : "+postQVo);
		if(preQVo.getqNo()!=null) {
			postQVo.setQnaQNo(preQVo.getqNo());
		}
		
		if(preQVo.getTime() != null) {	 
			//이건 DB에서 oracle에 맞는 SYSDATE 형식으로 DB에 저장되기때문에 그냥 윤주가 보내준 date를 사용하는것보다 Server쪽에서만 건드리는게 나을것 같다.
			//TODO:그런데 db의 vo형태에 맞춰서  Yj 형태로 바꿔서 android로 보내준 값을 가지고 있을수도 있으니까
			// 알아서 잘 수정하자........ 
		}
		if(preQVo.getPptNo() != null ){
			//TODO: 규약 - 질문할때  어떤 ppt에 관한 질문이냐 라는 부분인데 
			//그건 DB에서  qType과  qRef를 이용해서 정해진 규약에 따라 정보 저장하자 ( 규약 안정해져있음; )
		}
		
		return postQVo;
	}
	
	
	
	
	
	
	
	
	
	
	public List<YjQVo> listQ(YjQVo yjqVo){
		List<YjQVo> retList = null;
		retList = qnaDao.listQ(yjqVo);
		return retList;
	}
	
	
	
	public void deleteQ(YjQVo yjqVo){
		qnaDao.deleteQ(yjqVo);
	}

}
