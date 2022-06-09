package com.solmarket.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.solmarket.dto.AuthDTO;
import com.solmarket.service.MemberService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/member/*")
public class MyPageController {

	@Autowired
	private MemberService service;
	
	@GetMapping("/myPage")
	public void myPage() {
		log.info("myPage 페이지 요청");
	}
	
	@PostMapping("/myPagePwCheck")
	public String myPagePwCheckPOST(String userPw, HttpSession session) {
		log.info("userPw : " + userPw);
		
		String ch = service.myPagePwCheck(userPw);
		if(ch==null) {
			return "redirect:/myPagePwCheck";
		}
		// 비밀번호가 맞다면, 회원정보 페이지 보여주기
		
		session.setAttribute("myPagePwCheck", ch);
		return "/member/myPageEdit";
	}
	
	@GetMapping("/myPagePwCheck")
	public void myPagePwCheckGet(boolean agree) {
		
	}
}
