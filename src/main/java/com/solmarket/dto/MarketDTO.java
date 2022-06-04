package com.solmarket.dto;

import java.util.Date;

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
	private Date marketSD; // 시작일
	private Date marketED; // 종료일
	private double marketRate; // 총 평점
	private int marketStatus; // 장터 상태
}