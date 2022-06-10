package com.solmarket.dto;

import lombok.Data;

@Data
public class AuthDTO {
	private String userId;
	private String userName;
	private String userMail;
	private String userPw;
}
