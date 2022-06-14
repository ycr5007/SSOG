package com.solmarket.dto;

import java.util.*;
import lombok.*;

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
	
	private List<AttachDTO> attachList; // 첨부파일
	private String dummy; // join 활용 추가 데이터
}