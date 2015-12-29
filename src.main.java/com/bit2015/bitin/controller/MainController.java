package com.bit2015.bitin.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bit2015.bitin.annotation.AuthUser;
import com.bit2015.bitin.service.ChrisService;
import com.bit2015.bitin.service.ClassService;
import com.bit2015.bitin.service.UserService;
import com.bit2015.bitin.vo.UserVo;

//git test 12/04
@Controller
public class MainController {
	@Autowired
	UserService userService;
	@Autowired
	ClassService classService;
	@Autowired
	ChrisService chrisService;

	@RequestMapping("/main")
	public String main(HttpSession session, Model model) {
		// 로그인 상태 검사
		if (session == null) {
			return "redirect:/intro";
		}
		UserVo userVo = (UserVo) session.getAttribute("authUser");
		if (userVo == null) {
			return "redirect:/intro";
		}

		return "/main/main";
	}

	@RequestMapping("/")
	public String empty() {
		return "redirect:/index";
	}

	@RequestMapping("/bootstrap")
	public String bootStrap() {

		return "/main/main";
	}

	@RequestMapping("/intro")
	public String intro() {
		return "/main/intro";
	}

	/*
	 * //@Auth
	 * 
	 * @RequestMapping("/index") public String index(
	 * 
	 * @AuthUser UserVo authUser, Model model ) { if( authUser!= null){
	 * List<UserVo> list = userService.classmateList(authUser);
	 * model.addAttribute( "classMate", list );
	 * model.addAttribute("classMateSize", list.size()); List<UserVo> list2 =
	 * userService.classnameList(authUser); model.addAttribute( "className",
	 * list2 ); } return "/main/index"; }
	 */

	// auth 수정 포스트 방식
	@RequestMapping("/index")
	public String index(Model model, @RequestParam(value = "userId", required = false) String userId) {
		UserVo userVo = chrisService.getUserVoViaUserId(userId);
		chrisService.getRecentChatsByUserNo(userVo.getUserNo());
		if (userVo != null) {
			List<UserVo> list = userService.classmateList(userVo);
			model.addAttribute("classMate", list);
			List<UserVo> list2 = userService.classnameList(userVo);
			model.addAttribute("className", list2);
		}
		return "/main/index";
	}

	@RequestMapping("/loginform")
	public String loginform() {
		return "/main/loginform";
	}

	@RequestMapping("/registerform")
	public String registerformform() {
		return "/main/registerform";
	}

	@RequestMapping("/miniprofile")
	public String miniprofile(
			) {
//		model.addAttribute("myNo", userVo.getUserNo());
		return "/main/miniprofile";
	}

	// TODO : attd table 만들기
	// TODO : attd 출석하기
	// TODO : attd 조회하기

	/**
	 * class목록 이름
	 * 
	 * 사이트에서 로그인 로그아웃 회원가입 폰추가 개인별 class목록 (className, 시간, 강의실 , class-회원보기 ,
	 * 출석현황보기, 선생, 강의계획서? ,
	 * 
	 * 쪽지보내기 TODO : 쪽지 DB 쪽지 Vo 메시지 보내기 , 개인별 메시지목록 , 메시지확인, 답장, 삭제, 보관, 폴더,
	 * 
	 * 
	 * 폰에서 앱 설치후ㅡ (회원가입 대신) 기존 아이디 연동기능
	 * 
	 * 
	 * 
	 * 
	 * 
	 * 
	 */

}
