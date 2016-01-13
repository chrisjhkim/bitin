package com.bit2015.bitin.api.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit2015.bitin.annotation.AuthUser;
import com.bit2015.bitin.service.ChrisService;
import com.bit2015.bitin.service.UtilService;
import com.bit2015.bitin.service.VoteService;
import com.bit2015.bitin.vo.UserVo;
import com.bit2015.bitin.vo.VoteVo;


@Controller("voteAPIController")
@RequestMapping("/api/vote")
public class VoteController {
	@Autowired
	ChrisService chrisService;
	
	@Autowired
	VoteService voteService;
	@Autowired
	UtilService utilService;
	
	/**
	 * @param map(userId, className, voteTitle, voteContent)
	 * @return map{"message",파라미터가 null일때 발생하는 메세지),("result",success or fail),("data",해당 수업에 학생들의 phoneId) }
	 * 투표를 새로만드는 메소드입니다.
	 * 조윤주 요구
	 * made by 현준.
	 */
	@ResponseBody
	@RequestMapping(value="/enroll")
	public Map<String, Object> insertVote(
			@RequestBody HashMap<String, Object> map ) {
		HashMap<String, Object>retMap = new HashMap<String, Object>();
		System.out.println("control - insertVote  : map : "+map);
//		
//		System.out.println("list : "+voteContList);
//		System.out.println(voteContList.getClass());
//		System.out.println(map.get("voteContent").getClass());
		String resultStr = "fail";
		if( map == null){
			retMap.put("message", "모든 파라미터값 null 상태임");
		}else{
			voteService.insertVoteTitleAndContent(map);
			retMap.put("result", resultStr);
			retMap.put("data", voteService.phoneIdListbyUserIdAndClassName(map));
			resultStr = "success"; 
		}	
		return retMap;
	}
	
	/**
	 * @param map(userId)
	 * @return map{"message",파라미터가 null일때 발생하는 메세지),("result",success or fail),("data", 투표리스트) }
	 * 파라미터로 받아오는 아이디에 해당되는 투표리스트를 받아오는 메소드입니다.
	 * 조윤주 요구
	 * made by 현준.
	 */
	@ResponseBody
	@RequestMapping("/list")
	public Map<String, Object> voteList(
			@RequestBody HashMap<String, Object> map) {
		String userId = (String)map.get("userId");
		System.out.println("control - voteList  : String : "+userId);
		List<VoteVo> list = null;
		HashMap<String, Object>retMap = new HashMap<String, Object>();
		String resultStr = "fail";
		if( userId == null){
			retMap.put("message", "userId가 null 상태임");
		}else{
			list = voteService.getVoteList(userId);
			resultStr = "success"; 
			retMap.put("result", resultStr);
			retMap.put("data", list);
		}	
		System.out.println(retMap);
		return retMap;
	}
	
	
	/**
	 * @param map(userId)
	 * @return map{"message",파라미터가 null일때 발생하는 메세지),("result",success or fail) }
	 * 유저가 투표하는 메소드
	 * 조윤주 요구
	 * made by 현준.
	 * 
	 *            미완성
	 */
	@ResponseBody
	@RequestMapping("/voting")
	public Map<String, Object> voting(
			@RequestBody HashMap<String, Object> map){
		HashMap<String, Object>retMap = new HashMap<String, Object>();
		System.out.println("control - voting  : map : "+map);
		String resultStr = "fail";
		if( map == null){
			retMap.put("message", "모든 파라미터값 null 상태임");
		}else{
			VoteVo voteVo =new VoteVo();
			voteVo.setVoteNumber((int) map.get("voteNumber"));
			voteVo.setUserId((String)map.get("userId"));
			voteVo.setVoteContent((String)map.get("voteContent"));
			System.out.println("확인");
			if(true==voteService.votingCheck(voteVo)){
				System.out.println("확인2");
				retMap.put("message", "이미 투표하셨습니다.");
			}else{
			boolean flag = voteService.voting(map);
			System.out.println(flag);
			resultStr = "success"; 
			retMap.put("result", resultStr);
			}
		}		
		return retMap;
	}
	
	
	@SuppressWarnings("unused")
	@ResponseBody
	@RequestMapping("/delete")
	public Map<String, Object> delete(
			@RequestBody HashMap<String, Object> map){
		System.out.println("control - vote - delete  : map : "+map);
		HashMap<String, Object>retMap = new HashMap<String, Object>();
		int voteNumber = (int)map.get("voteNumber");
		System.out.println("control - votedelete : int : "+voteNumber);
		String resultStr = "fail";
		if( map == null){
			retMap.put("message", "모든 파라미터값 null 상태임");
		}else{
			boolean flag = voteService.delete(voteNumber);
			System.out.println(flag);
			resultStr = "success"; 
			retMap.put("result", resultStr);
		}		
		return retMap;
	}
	
	
	
	
	
	@SuppressWarnings("unused")
	@ResponseBody
	@RequestMapping("/votelistbyvoteno")
	public Map<String, Object> votelistbyvoteno(
			@RequestBody HashMap<String, Object> map){
		System.out.println("/votelistbyvoteno inputMap :"+map);
		HashMap<String, Object>retMap = new HashMap<String, Object>();
		int voteNumber = (int)map.get("voteNumber");
		System.out.println("control - votelistbyvoteno : int : "+voteNumber);
		String resultStr = "fail";
		
		if( map == null){
			retMap.put("message", "모든 파라미터값 null 상태임");
		}else{
			retMap.put("data", voteService.voteListByVoteNo(voteNumber));
			resultStr = "success"; 
			retMap.put("result", resultStr);
			System.out.println(retMap);
		}		
		return retMap;
	}
	

	@ResponseBody
	@RequestMapping("/votingstate")
	public Map<String, Object> votingState(
			@RequestBody HashMap<String, Object> map){
		HashMap<String, Object>retMap = new HashMap<String, Object>();
		List<HashMap<String, Object>> mapList = new ArrayList<HashMap<String, Object>>();
		String resultStr = "fail";
		System.out.println("votingstate 테스트" +map);
		if( map == null){
			retMap.put("message", "모든 파라미터값 null 상태임");
		}else{

			List<String> list = voteService.votingState(map);
			
			System.out.println("votingstate 테스트222" +list.size());
			System.out.println("votingstate 테스트333" +list);
			
			System.out.println( "------->" + list );	
			
			for ( int a=0 ; a < list.size(); a++){
				HashMap<String, Object>insertMap = new HashMap<String, Object>();
				
				String state = list.get( a );
				
				map.put("voteContent", state );
				int selectCount = voteService.extract( map );
				
				insertMap.put("contentName", state);
				insertMap.put("selectedCount",  selectCount );
				
				mapList.add(insertMap);
			}

			System.out.println( "------->" + mapList );	
			retMap.put("data",mapList );
			resultStr = "success"; 
			retMap.put("result", resultStr);
			System.out.println("VoteController - votingState - retMap : "+retMap);
		}		
		return retMap;
	}
	
	
	


	@RequestMapping("/votechart/{voteNumber}")
	public String voteChart(
			@RequestParam(value="id", required=false)String userId,
			@PathVariable ("voteNumber") Long voteNumber, 
			Model model){
				UserVo authUser = chrisService.getUserVoViaUserId(userId);
				
				
				HashMap<String, Object> map = new HashMap<>();
				map.put("voteNumber", voteNumber);
				List<String> firstlist = voteService.votingState(map);
				HashMap<String, Object> retMap = new HashMap<>();
				retMap.put( "voteNumber", voteNumber );
				retMap.put( "data", firstlist );
				System.out.println("sdfsdf"+model);
				

				
				List<HashMap<String, Object>> mapList = new ArrayList<HashMap<String, Object>>();
				List<String> list = voteService.votingState(map);
				
				System.out.println("votingstate 테스트222" +list.size());
				System.out.println("votingstate 테스트333" +list);
				
				System.out.println( "------->" + list );	
				
				for ( int a=0 ; a < list.size(); a++){
					HashMap<String, Object>insertMap = new HashMap<String, Object>();
					
					String state = list.get( a );
					map.put("voteContent", state );
					int selectCount = voteService.extract( map );
					
					insertMap.put("contentName", state);
					insertMap.put("selectedCount",  selectCount );

					mapList.add(insertMap);
				}
				
				retMap.put("data1",mapList );
				List<Integer> lastlist = new ArrayList<>();
				List<String> lastlist2 = new ArrayList<>();
				for ( int a=0 ; a < mapList.size(); a++){
					lastlist.add(a, (Integer) mapList.get(a).get("selectedCount"));
				}
				for ( int a=0 ; a < mapList.size(); a++){
					lastlist2.add(a,  (String) mapList.get(a).get("contentName"));
				}
		retMap.put("data2", lastlist2);
		retMap.put("data", lastlist);
		System.out.println("data2" + lastlist2);
		System.out.println("data" + lastlist);
		String aa = voteService.voteTitle(voteNumber);
		model.addAttribute("voteTitle", aa);
		model.addAttribute("data", lastlist);
		model.addAttribute("data2",lastlist2);
		model.addAttribute("data3", list.size());
		System.out.println("model : " +model);
		return "/hyunjuntest/chart";
	}
	
}
