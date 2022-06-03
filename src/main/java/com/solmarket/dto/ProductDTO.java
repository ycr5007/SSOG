package com.solmarket.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class ProductDTO {
	private int productNo; // 상품 번호
	private int userNo; // 회원 번호 ( myUser 테이블 참조 )
	private int marketNo; // 장터 번호 ( market 테이블 참조 )
	private int categoryNo; // 품목 ( category 테이블 참조 )
	private String productName; // 품명
	private int productQN; // 판매 수량
	private int productPrice; // 판매가
	private int productStatus; // 상품 등록 상태
	// 상품 등록일 추가 필요
}
