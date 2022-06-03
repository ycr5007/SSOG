package com.solmarket.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class UserDTO {
	private int userNo; // sequence 번호
	private String userId; // ID
	private String userPw; // 비밀번호
	private String userName; // 이름
	private String userMail; // 이메일주소
	private String userProfile; // 프로필 문구
	private int userVer; // 이메일 인증상태 ( 0 / 1 )
	private String userPF; // 프로필 이미지 파일
	private int userPFSize; // 프로필 이미지 파일크기
	private int userStatus; // 회원 상태 ( 0 / 1 / 2 )
	private String userAuth; // 권한 ( USER, SELLER, MARKET, ADMIN )
}
