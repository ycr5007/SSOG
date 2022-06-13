package com.solmarket.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.solmarket.dto.Criteria;
import com.solmarket.dto.MarketDTO;
import com.solmarket.dto.ProductDTO;

public interface ProductService {
	// 상품 등록 
	public boolean insert(ProductDTO productDto);
	//판매자 이름 가져오기
	public String userName(int userNo);
	// 리스트보여주기
	public List<ProductDTO> getList(@Param("cri")Criteria cri,@Param("userNo")int userNo); 
	// 리스트에서 상품이름 클릭시
	public ProductDTO getRow(int productNo);
	// 리스트 페이징 처리
	public int getTotalCnt(int userNo);
	// 상품 수정 
	public boolean update(ProductDTO updateDto);
	// 장터 이름 가져오기
	public String marketName(int marketNo);
	// 장터 리스트 보여주기
	public List<MarketDTO> marketList(@Param("cri")Criteria cri,@Param("userNo")int userNo); 
	// 장터 리스트 페이징 처리
	public int marketTotal(Criteria cri);

	// 검색
	public List<ProductDTO> getSearchList(String productName);
	
}
