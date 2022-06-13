package com.solmarket.mapper;

import java.util.List;

import com.solmarket.dto.ProductDTO;

public interface ProductMapper {
	
	// 마켓 참여 신청 및 상품 등록
	public int insert(ProductDTO productDto);
	// 판매자 이름 가져오기
	public String userName(int userNo);
	// 마켓 등록한 상품 수정
	public int update();
	// 마켓 등록한 상품 삭제
	public int delete();
	// 장터에 등록된 상품 조회
	public List<ProductDTO> select();
	//재고상점 상품 이동 및 상품 수정
	public int updateProduct();	
	// 재고상점 상품 삭제
	public int deleteProduct();
	//검색
	public List<ProductDTO> search(String productName);
	
}
