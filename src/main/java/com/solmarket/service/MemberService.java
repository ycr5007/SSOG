package com.solmarket.service;

import com.solmarket.dto.AuthDTO;
//import com.solmarket.dto.ChangeDTO;
import com.solmarket.dto.UserDTO;

public interface MemberService {

	// 회원가입
	public boolean register(UserDTO register);
			
	// 로그인
	public AuthDTO login(String userId, String userPw);
			
	// 비밀번호 변경
	//public boolean changePwd(ChangeDTO changeDto);
			
	// 회원탈퇴
	public boolean leave(String userId, String userPw);
			
	// 아이디 중복
	public String dupId(String userId);
			
	// ID 찾기
	public AuthDTO findId(String userName, String userMail);
			
	// PW 찾기
	public AuthDTO findPw(String userId, String userMail);
			
	// 가입시 이메일 인증
	public String authMail(String userMail);
	
	public String myPagePwCheck(String userPw);
}
