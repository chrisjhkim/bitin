package com.bit2015.bitin.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bit2015.bitin.annotation.AuthUser;
import com.bit2015.bitin.service.ChrisService;
import com.bit2015.bitin.service.UserService;
import com.bit2015.bitin.vo.ReplyVo;
import com.bit2015.bitin.vo.UserVo;

@Controller("userController")
@RequestMapping("/user")
public class UserController {

	
	@Autowired
	ChrisService chrisService;
	@Autowired
	UserService userService;
//**************************************************auth만들어서 주석처리해놨습니다(김현준)************************************************************************
	/**
	 * @param userVo
	 *            (id, password 필수)
	 * @return 성공시 result:success 실패시 result:fail / message:이유
	 * 
	 *         사실상 로그인 기능은 없고 아이디,비밀번호가 일치하는 유저가 있는지만 확인해줌
	 */

//	@RequestMapping("/login")
//	public String loginWeb(HttpSession session, @ModelAttribute UserVo userVo) {
//		if (userVo == null) {
//			System.out.println("@UserController ERROR : userVo==null");
//		} else if (userVo.getUserId() == null || userVo.getUserPassword() == null) {
//			System.out.println("@UserController ERROR : userVo.name or userVo.password ==null");
//		} else {
//			UserVo retUserVo = userService.getUserVoViaIdAndPassword(userVo);
//			if (retUserVo == null) {
//				// 로그인실패 - 어차피 modal ajax에서 미리 check 해서 실패 case없음
//			} else {
//				session.setAttribute("authUser", retUserVo);
//			}
//		}
//		Map<String, Object> retMap = new HashMap<String, Object>();
//		retMap.put("result", "success");
//		return "redirect:/index";
//	}
//*******************************************************************************************************************************************************
//	@RequestMapping("/logout")
//	public String logoutWeb(HttpSession session) {
//		session.removeAttribute("authUser");
//		session.invalidate();
//		return "redirect:/index";
//	}
//*******************************************************************************************************************************************************
	
	
	@RequestMapping("/join")
	public String joinWeb( @ModelAttribute UserVo userVo ){
		System.out.println(userVo);
		userService.insertUser(userVo);
		return "main/index";
	}
	
	//miniprofil connection Minyoung
	@RequestMapping("/miniprofile")
	public String viewForm(@RequestParam(value="myNo", required=false)Long myUserNo,
			@RequestParam(value="otherNo", required=false)Long otherUserNo, Model model) {
		UserVo userVo = userService.getProfilebyUserNo(otherUserNo);
		String myUserId = chrisService.getUserIdViaUserNo(myUserNo);
		UserVo myUserVo = chrisService.getUserVoViaUserId(myUserId);
		model.addAttribute("userVo", userVo);
		model.addAttribute("userNo", otherUserNo);
		model.addAttribute("myNo", myUserNo);
		model.addAttribute("otherNo", otherUserNo);
		System.out.println("fgggggggggg"+ userVo);
		if( myUserVo!= null){
			List<UserVo> classMateList = userService.classmateList(myUserVo);
			model.addAttribute( "classMate", classMateList );
			List<UserVo> list2 = userService.classnameList(myUserVo);
			model.addAttribute( "className", list2 );
			model.addAttribute("authUser", myUserVo);
			
			List<HashMap<String, Object>> recentChatList = chrisService.getRecentChatsByUserNo(myUserVo.getUserNo());
			model.addAttribute("recentChatList", recentChatList);
			
		}
		
		return "/main/miniprofile";
	}
	
}
