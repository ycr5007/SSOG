package com.solmarket.service;

import com.solmarket.dto.AuthDTO;
//import com.solmarket.dto.ChangeDTO;
import com.solmarket.dto.UserDTO;

public interface MemberService {

	// 회원가입
	public boolean register(UserDTO register);
			
	// 비밀번호 변경
	//public boolean changePwd(ChangeDTO changeDto);
	
	// 회원정보변경
	public boolean updateUser(UserDTO updateUser, String authority);
			
	// 회원상태변경
	public int delete(String userId);
			
	// 아이디 중복
	public String dupMail(String userMail);
			
	// ID 찾기
	public UserDTO findId(String userName, String userMail);
			
	// 가입시 이메일 인증
	public String authMail(String userMail);
	
	// 임시비밀번호 메일 발송
	public String pwMail(String userMail);
	public String updatePw(String userMail);
	
	// 비밀번호 재확인
	public String checkPw(String userPw);
	
	// 권한요청
	public int reqAuth(AuthDTO authDto);
}
