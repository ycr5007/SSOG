package com.solmarket.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.solmarket.dto.*;

public interface MarketMapper {
	
	/* ====================== 장터 등록 ====================== */
	public int insert(MarketDTO insertDTO); // 장터 등록 (장터 상태 0)
	
	/* ================= 장터 참여 신청 목록 보기 ================= */
	public List<ProductDTO> selectReceive(int marketNo); // 상품 조회 (상품 상태 0 & 장터 번호)
	
	/* ================= 장터 참여 신청 상품 상세 ================= */
	public ProductDTO selectProduct(@Param("marketNo")int marketNo, @Param("productNo")int productNo); // 상품 조회 (상품 번호)
	
	/* ================= 장터 참여 승인 / 거부 ================== */
	public int updateProductAccept(int productNo); // 상품 승인 (상품 상태 0 → 1)
	public int updateProductDeny(int productNo); // 상품 거부 (상품 상태 0 → 2)
	
	/* ================= 장터 참여 승인 목록 보기 ================= */
	public List<ProductDTO> selectAcceptList(int marketNo); // 상품 조회 (상품 상태 1 & 장터 번호)
	
	/* ====================== 장터 오픈 ====================== */
	public int updateMarketOn(int marketNo); // 장터 오픈 (장터 상태 1 → 2)
	public int updateProductOn(int productNo); // 장터 오픈 (상품 상태 1 → 3)
	
	/* ====================== 장터 위치 불러오기 ====================== */
	public String selectMarketLoc(int marketNo); // 장터 위치 정보 조회
	
	/* ====================== 장터 공지 목록 보기 ====================== */
	public List<NoticeDTO> selectNoticeList(int marketNo); // 공지 게시판 조회
	
	/* ====================== 장터 공지 등록 ====================== */
	public int insertNotice(NoticeDTO noticeDTO); // 공지, 이벤트 게시글 등록
	
	/* ================== 장터 판매 상품 목록 보기 ================== */
	public List<ProductDTO> selectProductList(int marketNo); // 상품 조회 (상품 상태 3 & 장터 번호)
	
	/* ====================== 장터 종료 ====================== */
	public int updateMarketOff(int marketNo); // 장터 종료 (장터 상태 2 → 3)
	public int updateProductOff(int productNo); // 장터 종료 (상품 상태 3 → 4)
	
	/* ====================== 장터 후기 목록 보기 ====================== */
	public List<ReviewDTO> selectReviewList(int marketNo); // 한 줄 후기 조회 (장터 번호)
	
	/* ====================== 장터 평점 불러오기 ====================== */
	public double selectMarketRate(int marketNo); // 장터 총 평점 불러오기
	
	/* ====================== 장터 후기 등록 ====================== */
	public int insertReview(ReviewDTO reviewDTO); // 장터 한 줄 후기 등록
	public int updateReviewRate(ReviewDTO reviewDTO); // 장터 등록 시 장터 평점 업데이트
	
	/* ====================== 장터 후기 삭제 (운영자) ====================== */
	public int deleteReview(int reviewNo);
}