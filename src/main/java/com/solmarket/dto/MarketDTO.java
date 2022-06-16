package com.solmarket.dto;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class MarketDTO {
	private int marketNo; // 장터 번호
	private int userNo; // 회원 번호 ( myUser 테이블 참조 )
	private String marketName; // 장터명
	private String marketLoc; // 지역
//	@DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm")
	private String marketSD; // 시작일
//	@DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm")
	private String marketED; // 종료일
	private double marketRate; // 총 평점
	private int marketStatus; // 장터 상태
	
	private String dummy;
	
	private List<AttachDTO> attachList; // 첨부파일
}