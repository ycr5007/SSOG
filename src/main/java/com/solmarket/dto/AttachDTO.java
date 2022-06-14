package com.solmarket.dto;

import lombok.Data;

@Data
public class AttachDTO {
	private String uuid;
	private String uploadPath;
	private String fileName;
	private int no; // ( 회원 / 게시판 / 공지 / 장터 / 상품 )
}
