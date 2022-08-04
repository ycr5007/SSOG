package com.solmarket.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.solmarket.dto.Criteria;
import com.solmarket.dto.MarketDTO;
import com.solmarket.dto.ProductDTO;
import com.solmarket.dto.ProductListDTO;

public interface ProductMapper {
	
	// 마켓 참여 신청 및 상품 등록
	public int insert(ProductDTO product);
	// 판매자 이름 가져오기
	public String userName(int userNo);
	// 상품 리스트 보여주기
	public List<ProductDTO> select(@Param("cri")Criteria cri,@Param("userNo")int userNo);
	// 리스트에서 상품명 클릭시
	public ProductDTO read(int productNo);
	// 상품 리스트 페이징 처리
	public int totalCnt(int userNo);
	// 마켓 등록한 상품 수정
	public int update(ProductDTO updateDto);
	// 장터 이름 가져오기
	public String marketName(int martketNo);
	//오픈 예정 장터 리스트 보여주기
	public List<MarketDTO> marketList(@Param("cri")Criteria cri,@Param("userNo")int userNo);
	// 장터 리스트 페이징 처리
	public int marketTotal(Criteria cri);
	// 인덱스에서 참여 중인 장터 리스트 보여주기
	public List<MarketDTO> mList();
	// 인덱스에서 오픈 예정 장터 리스트 보여주기
	public List<MarketDTO> oList();
	// 인덱스에서 상품 리스트 보여주기
	public List<ProductDTO> pList();
	// 판매 상품 리스트 보여주기
	public List<ProductDTO> sellList(@Param("cri")Criteria cri,@Param("userNo")int userNo);
	// 판매 상품 리스트 페이징
	public int sellTotal(int userNo);
	// 장터 종료 후 재고 상품 리스트 보여주기
	public List<ProductDTO> remainList(@Param("cri")Criteria cri,@Param("userNo")int userNo);
	// 장터 종료 후 재고 상품 리스트 페이징
	public int remainTotal(int userNo);
	// 온라인 상품 리스트 보여주기
	public List<ProductDTO> onlineList(@Param("cri")Criteria cri,@Param("userNo")int userNo);
	// 온라인 상품 리스트 페이징 처리
	public int onlineTotal(int userNo);
	// 참여중인 장터 리스트 보여주기
	public List<MarketDTO> ingMarketList(@Param("cri")Criteria cri,@Param("userNo")int userNo);
	// 장터 리스트 페이징 처리
	public int ingMarketTotal(Criteria cri);
	
	
	// 마켓 등록한 상품 삭제
	public int delete();
	//재고상점 상품 이동 및 상품 수정
	public int updateProduct();	
	// 재고상점 상품 삭제
	public int deleteProduct();
	
}
