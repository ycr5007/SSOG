package com.solmarket.service;

import java.util.List;

import com.solmarket.dto.ProductDTO;

public interface ProductService {
	// 상품 등록 
	public boolean insert(ProductDTO productDto);
	//판매자 이름 가져오기
	public String userName(int userNo);
	// 리스트보여주기
	public List<ProductDTO> getList(); 
	

}
