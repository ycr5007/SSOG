package com.solmarket.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class CartDTO {
	private int cartNo; // 장바구니 번호
	private int userNo; // 회원번호 ( myUser 테이블 참조 )
	private int productNo; // 상품번호 ( Product 테이블 참조 )
	private int cartQN; // 수량
	private int cartPay; // 금액
}
