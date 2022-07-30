package com.solmarket.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.solmarket.dto.Criteria;
import com.solmarket.dto.MarketDTO;
import com.solmarket.dto.ProductDTO;
import com.solmarket.dto.ProductListDTO;

public interface ProductService {
	// 상품 등록 
	public boolean insert(ProductListDTO proList);
	//판매자 이름 가져오기
	public String userName(int userNo);
	// 리스트보여주기
	public List<ProductDTO> getList(@Param("cri")Criteria cri,@Param("userNo")int userNo); 
	// 리스트에서 상품이름 클릭시
	public ProductDTO getRow(int productNo);
	// 리스트 페이징 처리
	public int getTotalCnt(int userNo);
	// 상품 수정 오프라인에서 온라인으로 변경
	public boolean update(ProductDTO updateDto);
	// 장터 이름 가져오기
	public String marketName(int marketNo);
	// 오픈예정 장터 리스트 보여주기
	public List<MarketDTO> marketList(@Param("cri")Criteria cri,@Param("userNo")int userNo); 
	// 오픈 예정 장터 리스트 페이징 처리
	public int marketTotal(Criteria cri);
	// 인덱스에서 참여 중인 장터 리스트 보여주기
	public List<MarketDTO> mList();
	// 인덱스에서 오픈 예정 장터 리스트 보여주기
	public List<MarketDTO> oList();
	// 인덱스에서 상품 리스트 보여주기
	public List<ProductDTO> pList();
	// 판매 상품 리스트
	public List<ProductDTO> sellList(@Param("cri")Criteria cri,@Param("userNo")int userNo);
	// 판매 상품 리스트 페이징
	public int sellTotal(int userNo);
	// 장터 종료 후 남은 상품 리스트
	public List<ProductDTO> remainList(@Param("cri")Criteria cri,@Param("userNo")int userNo);
	// 장터 종료 후 남은 상품 리스트 페이징
	public int remainTotal(int userNo);
	// 온라인 상품 리스트 보여주기
	public List<ProductDTO> onlineList(@Param("cri")Criteria cri,@Param("userNo")int userNo);
	// 온라인 상품 리스트 페이징 처리
	public int onlineTotal(int userNo);
	// 참여 중인 장터 리스트 보여주기
	public List<MarketDTO> ingMarketList(@Param("cri") Criteria cri, @Param("userNo") int userNo);
	// 참여 중인 장터 리스트 페이징 처리
	public int ingMarketTotal(Criteria cri);

}
