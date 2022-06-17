package com.solmarket.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class OrderDTO {
	private int orderNo; // 주문번호
	private int productNo; // 상품번호 ( Product 테이블 참조 )
	private int userNo; // 회원번호(구매자) ( myUser 테이블 참조 )
	private int orderQN; // 주문 총 수량
	private int orderPay; // 금액
	private String orderSend; // 배송지
	private int orderState;	// 주문 상태
	private Date orderDate; // 주문일
	private String orderMemo; //배송 요청사항
	
}
