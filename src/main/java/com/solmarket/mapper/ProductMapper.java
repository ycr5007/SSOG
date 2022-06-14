package com.solmarket.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.solmarket.dto.Criteria;
import com.solmarket.dto.MarketDTO;
import com.solmarket.dto.ProductDTO;

public interface ProductMapper {
	
	// 마켓 참여 신청 및 상품 등록
	public int insert(ProductDTO productDto);
	// 판매자 이름 가져오기
	public String userName(int userNo);
	// 상품 리스트 보여주기
	public List<ProductDTO> select(@Param("cri")Criteria cri,@Param("userNo")int userNo);
	// 리스트에서 상품명 클릭시
	public ProductDTO read(int productNo);
	// 상품 리스트 페이징 처리
	public int totalCnt(int userNo);
	// 장터 이름 가져오기
	public String marketName(int martketNo);
	// 마켓 리스트 보여주기
	public List<MarketDTO> marketList(@Param("cri")Criteria cri,@Param("userNo")int userNo);
	// 마켓 리스트 페이징 처리
	public int marketTotal(Criteria cri);
	
	
	
	
	// 마켓 등록한 상품 수정
	public int update(ProductDTO updateDto);
	// 마켓 등록한 상품 삭제
	public int delete();
	//재고상점 상품 이동 및 상품 수정
	public int updateProduct();	
	// 재고상점 상품 삭제
	public int deleteProduct();
	//검색
	public List<ProductDTO> search(String productName);
	
}
