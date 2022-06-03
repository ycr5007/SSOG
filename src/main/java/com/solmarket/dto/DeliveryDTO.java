package com.solmarket.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class DeliveryDTO {
	private int deliveryNo; // 배송번호
	private int orderNo; // 주문번호 ( myOrder 테이블 참조 )
	private String deliverySendNo; // 송장번호
	private String deliveryStatus; // 배송상태
}
