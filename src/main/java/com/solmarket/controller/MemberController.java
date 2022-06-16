package com.solmarket.controller;

import java.util.Random;

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

		if (!agree) {
			rttr.addFlashAttribute("check", "false");
			return "redirect:/member/signUp1";
		}
		// 약관동의했다면, signUp2 페이지 보여주기
		return "/member/signUp2";
	}

	@PostMapping("/regist")
	public String regist(UserDTO regist, RedirectAttributes rttr) {
		log.info("회원가입 요청" + regist);

		if (service.register(regist)) {
			rttr.addFlashAttribute("regist", "회원가입되었습니다.");
			return "redirect:/member/login";
		}
		return "/member/signUp2";
	}

	// login 보여주는 컨트롤러
	@GetMapping("/login")
	public void login() {
		log.info("로그인 페이지 요청");
	}

	@GetMapping("/login-error")
	public String loginError(RedirectAttributes rttr) {
		rttr.addFlashAttribute("error", "아이디 비밀번호 확인해주세요");
		return "redirect:/member/login";
	}

	@GetMapping("/logout")
	public String logout(HttpSession session) {
		log.info("로그아웃");
		
		session.invalidate();
		return "redirect:/";
	}

	// 비밀번호 변경 폼 요청
	/*
	 * @GetMapping("/changePwd") public void changePwd() { log.info("비밀번호 변경 폼 요청");
	 * }
	 */

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

	// @Controller => 컨트롤러 종료 시점에 view가 결정
	// void + /member/checkId => WEB-INF/views/member/checkId.jsp
	// String + "/checkId" => WEB-INF/views/checkId.jsp

	// 중복 이메일 검사
	@ResponseBody
	@PostMapping("/checkMail")
	public String checkMail(String userMail) {
		log.info("중복 이메일 검사" + userMail);

		// userMail 값이 있다면 중복, null 이면 사용가능
		if (service.dupMail(userMail) != null) {
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
		log.info("" + userName);
		log.info("" + userMail);

		UserDTO userDto = service.findId(userName, userMail);

		if (userDto != null) {
			// model.addAttribute("userName", userName);
			// model.addAttribute("userMail", userMail);
			rttr.addFlashAttribute("userId", userDto.getUserId());
			log.info("" + userName);
			log.info("" + userMail);
			log.info("" + userDto.getUserId());
			return "redirect:/member/findIdResult";
		} else {
			return "redirect:/member/findIdResult";

		}
	}

	@GetMapping("/findIdResult")
	public void findIdGet(String userName, String userMail) {
	}

	// 비밀번호 찾기
	@GetMapping("/findPw")
	public void findPw() {
		log.info("비밀번호 찾기 폼 요청");
	}
	

	private String tempPw() {
		// 인증번호 생성기
		StringBuffer temp = new StringBuffer();
		Random rnd = new Random();
		for (int i = 0; i < 10; i++) {
			int rIndex = rnd.nextInt(3);
			switch (rIndex) {
			case 0:
				// a-z
				temp.append((char) ((int) (rnd.nextInt(26)) + 97));
				break;
			case 1:
				// A-Z
				temp.append((char) ((int) (rnd.nextInt(26)) + 65));
				break;
			case 2:
				// 0-9
				temp.append((rnd.nextInt(10)));
				break;
			}
		}

		return temp.toString();
		}
	// 임시비밀번호 발급 완료... -> 창에 입력 -> 비밀번호 변경 submit -> findPwResult -> 로그인창


	@PostMapping("/findPwResult")
	public String findPwResultPost(String userId, String userMail) {
		log.info("패스워드 결과 페이지 요청");
		log.info("userId :" + userId);
		log.info("userMail :" + userMail);

		
		 if (service.updatePw(userId, userMail, tempPw())) { 
			 return "redirect:/member/login"; 
		 } else {
			 return "redirect:/member/findPw"; 
		 }
		
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

	// 주소
	@GetMapping("/jusoPopup")
	public void jusoPopupGet() {
		log.info("주소 팝업 요청");
	}

	@PostMapping("/jusoPopup")
	public void jusoPopupPost() {
		log.info("주소 팝업 요청;");
	}
	
	// accessdenied mapping
	@GetMapping("/access-denied")
	public void deniedGet() {
		log.info("access-denied 페이지 요청");
	}

}
