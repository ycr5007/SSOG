package com.solmarket.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.solmarket.dto.UserDTO;
import com.solmarket.service.MemberService;
//import com.solmarket.dto.ChangeDTO;
import com.solmarket.dto.AuthDTO;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/member/*")
public class MemberController {
	
	@Autowired
	private MemberService service;
	
	// signUp1 보여주는 컨트롤러
	@GetMapping("/signUp1")
	public void signUp1() {
		log.info("signUp1 페이지 요청");
	}
	
	@PostMapping("/signUp2")
	public String signUp2(boolean agree, RedirectAttributes rttr) {
		log.info("회원가입 페이지 요청" + agree);
		
		if(!agree) {
			rttr.addFlashAttribute("check", "false");
			return "redirect:/member/signUp1";
		}
		// 약관동의했다면, signUp2 페이지 보여주기
		return "/member/signUp2";
	}
	
	@PostMapping("/regist")
	public String regist(UserDTO regist) {
		log.info("회원가입 요청" + regist);
		
		if(service.register(regist)) {
			return "redirect:/member/signIn";
		}
		return "/member/signUp2";
	}
	
	// signIn 보여주는 컨트롤러
	@GetMapping("/signIn")
	public void signIn() {
		log.info("로그인 페이지 요청");
	}
	
	@PostMapping("/signIn")
	public String signInPost(String userId, String userPw,HttpSession session) {
		log.info(""+userId+" userPw" +userPw);
		
		AuthDTO authDto = service.login(userId, userPw);
		
		if(authDto==null) {
			return "redirect:/member/signIn"; // 로그인 실패시 다시 로그인 페이지를 보여줘야함
		}
		//SessionAttribute : Model 에 담은 객체를 session 유지
		//HttpSession : 
		session.setAttribute("login", authDto);
		return "redirect:/";
	}
	
	// logout + get => session 해제 후 index 이동
		@GetMapping("/logout")
		public String logout(HttpSession session) {
			log.info("로그아웃");
			
			session.invalidate();
			
			return "redirect:/";
		}
		
		// 비밀번호 변경 폼 요청
		@GetMapping("/changePwd")
		public void changePwd() {
			log.info("비밀번호 변경 폼 요청");
		}
		
		// 비밀번호 변경 - post
		/*
		 * @PostMapping("/changePwd") public String changePwdPost(ChangeDTO
		 * changeDto,HttpSession session,RedirectAttributes rttr) {
		 * log.info("비밀번호 변경 폼 요청" + changeDto);
		 * 
		 * // 현재 비밀번호 확인 // 일치 => 비밀번호 변경 및 세션해제 // 이유....;; AuthDTO authDto =
		 * (AuthDTO)session.getAttribute("login");
		 * 
		 * // 세션에 있는 userId 를 ChangeDTO에 담아주기 changeDto.setUserId(authDto.getUserId());
		 * 
		 * if(service.login(changeDto.getUserId(), changeDto.getUserPw())!=null) {
		 * service.changePwd(changeDto); session.invalidate(); return
		 * "redirect:/member/signin"; }else { //일치 안하면 비밀번호 변경 폼으로 돌아가기
		 * rttr.addAttribute("error", "비밀번호를 확인해주세요"); return
		 * "redirect:/member/changePwd"; } }
		 */
		
		// 탈퇴 폼(leave) 보여주기
		@GetMapping("/leave")
		public void leave() {
			log.info("탈퇴 폼 요청");
		}
		
		// 탈퇴 post
		@PostMapping("/leave")
		public String leavePost(String userId, String userPw, HttpSession session, RedirectAttributes rttr) {
			log.info("탈퇴 요청"+userId+","+userPw);
			
			if(!service.leave(userId, userPw)) {
				rttr.addFlashAttribute("error", "비밀번호 확인해주세요");
				return "redirect:/member/leave";
			}else {
				session.invalidate();
				return "redirect:/";
			}
		}
		
		// @Controller => 컨트롤러 종료 시점에 view가 결정
		//				  void + /member/checkId => WEB-INF/views/member/checkId.jsp
		//				  String + "/checkId" => WEB-INF/views/checkId.jsp
		
		// 중복 아이디 검사
		@ResponseBody
		@PostMapping("/checkId")
		public String checkId(String userId) {
			log.info("중복 아이디 검사" +userId);
			
			// userId1 값이 있다면 중복, null 이면 사용가능
			if(service.dupId(userId)!=null) {
				return "false"; // jsp 페이지가 아님 -> @ResponseBody (리턴값이 jsp 아님)
			}
			
			return "true";
		}
		
		
		// 아이디 찾기 폼 보여주기
		@GetMapping("/findId")
		public void findId() {
			log.info("아이디 찾기 폼 요청");
		}
		
		// 아이디 찾기 Post
		@PostMapping("/findId")
		public String findIdPost(String userName, String userMail, RedirectAttributes rttr) {
			log.info("아이디 찾기");
			log.info(""+userName);
			log.info(""+userMail);
			
			AuthDTO authDto = service.findId(userName, userMail);
			
			if(authDto!=null) {
				rttr.addAttribute("userName", userName);
				rttr.addAttribute("userMail", userMail);
				rttr.addFlashAttribute("userId", authDto.getUserId());
				log.info(""+userName);
				log.info(""+userMail);
				log.info(""+authDto.getUserId());
				return "redirect:/member/findIdResult";
			}else {
				rttr.addFlashAttribute("error", "입력값을 다시 확인해주세요");
				log.info(""+userName);
				log.info(""+userMail);
				return "redirect:/member/findIdResult";
				
			}
		}
		
		@GetMapping("/findIdResult")
		public void findIdGet(String userName, String userEmail) {
		}
		
		// 비밀번호 찾기
		@GetMapping("/findPw")
		public void findPw() {
			log.info("비밀번호 찾기 폼 요청");
		}
		
		@PostMapping("/findPw")
		public String findPwPost(String userId, String userMail, RedirectAttributes rttr) {
			log.info("비밀번호 찾기");
			log.info(""+userId);
			log.info(""+userMail);
			
			AuthDTO authDto = service.findPw(userId, userMail);
			
			if(authDto!=null) {
				rttr.addAttribute("userId", userId);
				rttr.addAttribute("userMail", userMail);
				rttr.addFlashAttribute("userPw", authDto.getUserPw());
				log.info(""+userId);
				log.info(""+userMail);
				log.info(""+authDto.getUserPw());
				return "redirect:/member/findPwResult";
			}else {
				rttr.addFlashAttribute("error", "입력값을 다시 확인해주세요");
				log.info(""+userId);
				log.info(""+userMail);
				return "redirect:/member/findPw";
				
			}
		}
		
		@GetMapping("/findPwResult")
		public void findPwResultGet(String userId, String userMail) {
			
		}

		
		// 메일인증
		@GetMapping("/mailCheck")
		@ResponseBody
		public String mailCheckGet(String userMail) {
			
			// jsp로부터 넘어온 데이터 확인
			log.info("이메일 데이터 전송확인");
			log.info("입력한 메일 : " + userMail);
			
			String authkey = service.authMail(userMail);
			log.info(authkey);
			
			return authkey;
		}
		
		
}
