package com.bit2015.bitin.webapp.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bit2015.bitin.service.BoardService;
import com.bit2015.bitin.service.NaviService;
import com.bit2015.bitin.service.ReplyService;
import com.bit2015.bitin.service.UserService;
import com.bit2015.bitin.vo.BoardVo;
import com.bit2015.bitin.vo.PostVo;
import com.bit2015.bitin.vo.ReplyVo;
import com.bit2015.bitin.vo.UserVo;

@Controller("WebAppBoardController")
@RequestMapping("/webapp/board")
public class BoardController {
	@Autowired
	UserService userService;
	@Autowired
	NaviService naviService;
	@Autowired
	BoardService boardService;
	@Autowired
	ReplyService replyService;
	
	// board List
	@RequestMapping("/list")
	public String boardList(
			@RequestParam(value="userNo", required=true)Long userNo,
			@RequestParam(value="boardNo", required=true)Long boardNo,
			
			Model model) {
		System.out.println("/webapp/board/list input [userNo:"+userNo+"/boardNo:"+boardNo+"]");
		
		boardService.deleteUnreadCountByUserNoAndBoardNo(userNo, boardNo);

		UserVo userVo = userService.getUserVo(userNo);
		System.out.println("userVo : "+userVo);
		if( userVo!= null){
			Map<String, Object> naviDataMap = naviService.getNaviDataMap(userVo.getUserNo()) ;
			model.addAttribute("naviDataMap", naviDataMap );
			model.addAttribute("fakeAuthUser", userVo);
		}
		
		List<PostVo> postList = boardService.getPostListByBoardNo(boardNo);
		model.addAttribute("boardNo", boardNo);
		model.addAttribute("list",postList);
		
		System.out.println("/webapp/board/list output model :"+model);
		return "/webapp/board/list";
	}
	
	//modify form post
	@RequestMapping("/post/modify-form")
	public String modifyForm(
			@RequestParam(value="userNo", required=true)Long userNo,
			@RequestParam(value="postNo", required=true)Long postNo,
			Model model) {
		System.out.println("/webapp/board/post/modify-form input [userNo:"+userNo+"/postNo:"+postNo+"]");
		
		UserVo userVo = userService.getUserVo(userNo);
		System.out.println("userVo : "+userVo);
		if( userVo!= null){
			Map<String, Object> naviDataMap = naviService.getNaviDataMap(userVo.getUserNo()) ;
			model.addAttribute("naviDataMap", naviDataMap );
			model.addAttribute("fakeAuthUser", userVo);
		}

		HashMap<String,Object >postInfoMap = boardService.getPostInfoByPostNo(postNo);
		model.addAttribute("boardName", postInfoMap.get("BOARDNAME"));
		
		PostVo postVo = boardService.getPostVoByPostNo(postNo);
		model.addAttribute("postVo",postVo);
		
		System.out.println("/webapp/board/post/modify-form output model :"+model);
		return "/webapp/board/modifyform";
	}
	//modify form post
	@RequestMapping("/post/modify")
	public String modify(
			@RequestParam(value="userNo", required=true)Long userNo,
			@ModelAttribute PostVo postVo,
			Model model) {
		
		System.out.println("/webapp/board/post/modify input [userNo:"+userNo +"/postVo : "+postVo);
		UserVo userVo = userService.getUserVo(userNo);
		System.out.println("userVo : "+userVo);
		
		boardService.updatePost(postVo);
		
		
		System.out.println("/webapp/board/post/modify output model :"+model);
		return "redirect:/webapp/board/view-post?userNo="+userNo+"&postNo="+postVo.getPostNo();
	}
	//write form
	@RequestMapping("/write-form")
	public String writeForm( 
			@RequestParam(value="boardNo", required=true)Long boardNo,
			@RequestParam(value="userNo", required=true)Long userNo,
			Model model) {
		
		UserVo userVo = userService.getUserVo(userNo);
		System.out.println("userVo : "+userVo);
		if( userVo!= null){
			Map<String, Object> naviDataMap = naviService.getNaviDataMap(userVo.getUserNo()) ;
			model.addAttribute("naviDataMap", naviDataMap );
			model.addAttribute("fakeAuthUser", userVo);
		}
		
		BoardVo boardVo = boardService.getBoardVoByBoardNo(boardNo);
		model.addAttribute("boardVo", boardVo);
		System.out.println("/webapp/board/writeForm output "+model);
		return "/webapp/board/writeform";
	}
	@RequestMapping("/write-post")
	public String insert(
			@ModelAttribute PostVo postVo,
			Model model
			) {
		System.out.println("/webapp/board/write-post inputPostVo :" +postVo);
		boardService.writeBoard(postVo);
		
		UserVo userVo = userService.getUserVo(postVo.getUserNo());
		if( userVo!= null){
			Map<String, Object> naviDataMap = naviService.getNaviDataMap(userVo.getUserNo()) ;
			model.addAttribute("naviDataMap", naviDataMap );
			model.addAttribute("fakeAuthUser", userVo);
		}
		boardService.insertUnreadCountByBoardNoAndWritterUserNo(postVo.getBoardNo(), postVo.getUserNo());
		
		return "redirect:/webapp/board/list?userNo="+userVo.getUserNo()+"&boardNo="+postVo.getBoardNo();
	}
	@RequestMapping("/write-reply")
	public String writeReply(
			@ModelAttribute ReplyVo replyVo,
			Model model
			) {
		System.out.println("/webapp/board/write-reply inputReplyVo :" +replyVo);
		
		UserVo userVo = userService.getUserVo(replyVo.getUserNo());
		if( userVo!= null){
			Map<String, Object> naviDataMap = naviService.getNaviDataMap(userVo.getUserNo()) ;
			model.addAttribute("naviDataMap", naviDataMap );
			model.addAttribute("fakeAuthUser", userVo);
		}
		replyService.writeReply(replyVo);
		return "redirect:/webapp/board/view-post?userNo="+replyVo.getUserNo()+"&postNo="+replyVo.getPostNo();
//		return "redirect:/webapp/board/list?userNo="+userVo.getUserNo()+"&boardNo="+postVo.getBoardNo();
	}
	
	
	// post View
	@RequestMapping("/view-post")
	public String viewPost(
			@RequestParam(value="userNo", required=true)Long userNo,
			@RequestParam(value="postNo", required=true)Long postNo,
			Model model) {
		System.out.println("/webapp/board/view-post input [userNo:"+userNo+"/postNo:"+postNo+"]");
		
		UserVo userVo = userService.getUserVo(userNo);
		//네비 처리
		if( userVo!= null){
			Map<String, Object> naviDataMap = naviService.getNaviDataMap(userVo.getUserNo()) ;
			model.addAttribute("naviDataMap", naviDataMap );
			model.addAttribute("fakeAuthUser", userVo);
		}

		// 글 정보
		PostVo postVo = boardService.getPostVoByPostNo(postNo);
		model.addAttribute("postVo",postVo);

		// 리플 정보
		List<ReplyVo> replyList = replyService.getReplyListByPostNo(postNo);
		model.addAttribute("replyList", replyList);
		
		//이전 post, 다음 post 
		Long prevPostNo = boardService.getPrevPostNoByPostNo(postNo);
		Long nextPostNo = boardService.getNextPostNoByPostNo(postNo);
		if( prevPostNo != null ) model.addAttribute("prevPostNo", prevPostNo);
		if( nextPostNo != null ) model.addAttribute("nextPostNo", nextPostNo);
		
		
		
		System.out.println("/webapp/board/view-post output model :"+model);
		return "/webapp/board/view-post";
	}

	@RequestMapping("/delete-post")
	public String deletePost ( 
			@RequestParam(value="postNo", required=true)Long postNo,
			@RequestParam(value="userNo", required=true)Long userNo ) {
		System.out.println("/webapp/board/delete-post postNo:"+postNo+"/userNo:"+userNo);
		Long boardNo = boardService.getPostVoByPostNo(postNo).getBoardNo();
		boardService.deletePostByPostNo(postNo);
		return "redirect:/webapp/board/list?userNo="+userNo+"&boardNo="+boardNo;
	}
	
}
