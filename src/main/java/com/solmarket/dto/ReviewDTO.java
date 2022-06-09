package com.solmarket.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class ReviewDTO {
	private int reviewNo; // 리뷰 번호
	private int userNo; // 회원번호 ( myUser 테이블 참조 )
	private int marketNo; // 장터번호 ( market 테이블 참조 )
	private String reviewContent; // 리뷰 내용
	private Date reviewDate; // 작성일 
	private int reviewRate; // 평점 ( 1 ~ 5 ) 
	private int reviewStatus; // 리뷰 상태 ( 1:show / 0:hidden )
}
