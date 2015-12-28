package com.bit2015.bitin.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestBody;

import com.bit2015.bitin.dao.VoteDao;
import com.bit2015.bitin.vo.VoteVo;

@Service
public class VoteService {

	@Autowired
	VoteDao voteDao;
	@Autowired
	UtilService utilService;
	
	
	public boolean insertVoteTitleAndContent(  HashMap<String, Object> map) {
		boolean retFlag = false;
		HashMap<String, Object>map2 = new HashMap<String, Object>();
//		ArrayList<String> list = new ArrayList<>();
		List<String >voteContList = utilService.transformStringToList((String)map.get("voteContent"));
//		voteContList = (ArrayList<String>) map.get("voteContent");
		retFlag = voteDao.insertVoteTitle(map);
		for( int i = 0 ; i <voteContList.size(); i++){
			map2.put("voteContent", voteContList.get(i));
			voteDao.insertVoteContent(map2);
		}
		return retFlag;
	}
	public List<String> phoneIdListbyUserIdAndClassName( HashMap<String, Object> map){
		List<String> list = new ArrayList<String>();
		list = voteDao.phoneIdListbyUserIdAndClassName(map);
		return list;
	}
	
	
	
	public List<VoteVo> getVoteList(String userId){
		List<VoteVo> list = null;
		System.out.println("aaaa");
		list = voteDao.getVoteList(userId);
		System.out.println(list);
		return list;
	}
	
	
	public boolean voting(  @RequestBody HashMap<String, Object> map) {
			boolean retFlag= voteDao.voting(map);
			return retFlag;
	}
	
	public boolean votingCheck(VoteVo voteVo){
		boolean retFlag = false;
		retFlag = voteDao.votingCheck(voteVo);
		return retFlag;
	}
	
	
	
	
	
	
	
	
	public boolean delete(  int voteNumber) {
		boolean retFlag = (voteDao.deleteVoteTitle(voteNumber) &&  voteDao.deleteVoteContent(voteNumber)   &&   voteDao.deleteVoteAnswer(voteNumber)  );
		return retFlag;
	}
	
	
	
	
	
	public List<String> voteListByVoteNo(int voteNumber){
		List<String> list = null;
		list = voteDao.voteListByVoteNo(voteNumber);
		return list;
	}
	
	public List<String> votingState(HashMap<String, Object> map){
		List<String> list = null;
		list = voteDao.votingState(map);
		return list;
	}
	public int extract(HashMap<String, Object> map){
		List<String> list = null;
		list = voteDao.extract(map);
		int a = list.size();
		return a;
	}
	
	
	
//	public VoteVo voteChart(Long voteNumber) {
//		VoteVo voteVo = voteDao.voteChart(voteNumber);
//		return voteVo;
//	}
	
}
