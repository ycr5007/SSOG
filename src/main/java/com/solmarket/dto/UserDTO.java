package com.solmarket.dto;

import java.util.List;

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
	private String userPhone; // 연락처 ('-' 포함)
	private String userProfile; // 프로필 문구
	private String userAddress; // 주소 (추가)
	private boolean enabled;
	private int userStatus;
	private List<AuthDTO> authorities;
	
	private List<AttachDTO> attachList; // 파일첨부 리스트
}
