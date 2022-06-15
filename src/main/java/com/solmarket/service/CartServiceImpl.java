package com.solmarket.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.solmarket.dto.CartDTO;
import com.solmarket.mapper.CartMapper;

@Service
public class CartServiceImpl implements CartService {
	
	@Autowired
	private CartMapper mapper;

	@Override
	public int addCart(CartDTO cart) {
		
		CartDTO checkCart = mapper.checkCart(cart);
		
		if(checkCart != null) {	// 데이터가 이미 DB에 존재시 2 반환
			return 2;
		}
		
		// 장바구니 등록 - 에러 시 0반환
		try {
			return mapper.addCart(cart);
		} catch (Exception e) {
			return 0;
		}
	}

}
