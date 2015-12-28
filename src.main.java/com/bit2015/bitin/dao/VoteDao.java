package com.bit2015.bitin.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bit2015.bitin.vo.VoteVo;

@Repository
public class VoteDao {

	@Autowired
	SqlSession sqlSession;

	public boolean insertVoteTitle(HashMap<String, Object> map) {
		boolean retFlag = true;
		sqlSession.insert("vote.setVoteTitle", map);
		return retFlag;
	}
	public boolean insertVoteContent(HashMap<String, Object>Map) {
		boolean retFlag = false;
		System.out.println("voteDao" + Map);
		retFlag = (1 == sqlSession.insert("vote.setVoteContent", Map));
		return retFlag;
	}
	public List<String> phoneIdListbyUserIdAndClassName(HashMap<String, Object> map){
		List<String> list = sqlSession.selectList("vote.phoneIdListbyUserIdAndClassName", map);
		return list;
	}
	
	
	
	
	public List<VoteVo> getVoteList(String userId) {
		List<VoteVo> list = null;
		System.out.println("aaaa");
		System.out.println(userId);
		list=sqlSession.selectList("vote.getVoteList", userId);
		System.out.println("!!!!!!!!!!!!!!!!!" + list);
		return list;
	}
	
	
	
	
	public boolean  voting(HashMap<String, Object> map) {
		boolean retFlag = false;
			retFlag = (1 == sqlSession.insert("vote.voting", map));
		return retFlag;
	}
	public boolean votingCheck(VoteVo voteVo){
		boolean retFlag = false;
		System.out.println("확인체크");
		retFlag = sqlSession.selectOne("vote.votingCheck", voteVo);
		System.out.println("확인체크2");
		return retFlag;
	}
	
	
	
	public boolean  deleteVoteTitle( int voteNumber) {
		boolean retFlag = false;
		try {
			retFlag = (1 == sqlSession.delete("vote.deleteVoteTitle", voteNumber));
		} catch (Exception e) {
			System.out.println("@bitin@VoteDao - deleteVoteTitle exception 발생 !!!!!!!!!!!!!!!!!!!!!!! exception e : " + e);
			e.printStackTrace();
		}
		return retFlag;
	}
	public boolean  deleteVoteContent( int voteNumber) {
		boolean retFlag = false;
		try {
			retFlag = (1 == sqlSession.delete("vote.deleteVoteContent", voteNumber));
		} catch (Exception e) {
			System.out.println("@bitin@VoteDao - deleteVoteContent exception 발생 !!!!!!!!!!!!!!!!!!!!!!! exception e : " + e);
			e.printStackTrace();
		}
		return retFlag;
	}
	
	
	public boolean  deleteVoteAnswer( int voteNumber) {
		boolean retFlag = false;
		try {
			retFlag = (1 == sqlSession.delete("vote.deleteVoteAnswer", voteNumber));
		} catch (Exception e) {
			System.out.println("@bitin@VoteDao - deleteVoteAnswer exception 발생 !!!!!!!!!!!!!!!!!!!!!!! exception e : " + e);
			e.printStackTrace();
		}
		return retFlag;
	}
	
	
	public List<String> voteListByVoteNo(int voteNumber) {
		List<String> list = null;
		System.out.println(voteNumber);
		list=sqlSession.selectList("vote.voteListByVoteNo", voteNumber);

		return list;
	}
	
	
	
	public List<String> votingState(HashMap<String, Object> map) {
		List<String> list = null;
		list=sqlSession.selectList("vote.votingState", map);
		return list;
	}
	public List<String> extract(HashMap<String, Object> map) {
		List<String> list = null;
		System.out.println("map"+map);
		list=sqlSession.selectList("vote.extract", map);
		System.out.println("list"+list);
		return list;
	}
	
	public String voteTitle(Long voteNumber) {
		String aa = sqlSession.selectOne("vote.voteTitle", voteNumber);
		return aa;
	}
	
}
