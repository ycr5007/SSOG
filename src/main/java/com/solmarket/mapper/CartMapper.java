package com.solmarket.mapper;

import java.util.List;

import com.solmarket.dto.CartDTO;

public interface CartMapper {
	//cart부분
		public int addCart(CartDTO cart) throws Exception;	// 장바구니 추가 - 예외발생시 멈추는거 방지
		public int deleteCart(int cartNo);	// 삭제
		public int modifyCount(CartDTO cart);	// 수량 수정
		public List<CartDTO> getCart(String userNo); // 목록
		public CartDTO checkCart(CartDTO cart); // 해당 row 존재여부 확인
}
