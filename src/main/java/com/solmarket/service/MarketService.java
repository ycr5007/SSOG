package com.solmarket.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.solmarket.dto.*;

public interface MarketService {
	
	/* ====================== 장터 등록 ====================== */
	public boolean registerMarket(MarketDTO insertDTO); // 장터 등록 (장터 상태 0)
	
	/* ================= 장터 참여 신청 목록 보기 ================= */
	public List<ProductDTO> showReceive(@Param("marketNo")int marketNo, @Param("criteria")Criteria criteria); // 상품 조회 (상품 상태 0 & 장터 번호)
	public int TotalReceive(int marketNo); // 총 신청 개수
	
	/* ================= 장터 참여 신청 상품 상세 ================= */
	public ProductDTO showProduct(int marketNo, int productNo); // 상품 조회 (상품 번호)
	
	/* ================= 장터 참여 승인 / 거부 ================== */
	public boolean ProductAccept(int productNo); // 상품 승인 (상품 상태 0 → 1)
	public boolean ProductDeny(int productNo); // 상품 거부 (상품 상태 0 → 2)
	
	/* ================= 장터 참여 승인 목록 보기 ================= */
	public List<ProductDTO> showProductAcceptList(@Param("marketNo")int marketNo, @Param("criteria")Criteria criteria); // 상품 조회 (상품 상태 1 & 장터 번호)
	public int TotalAccept(int marketNo); // 총 승인 개수
	
	/* ====================== 장터 오픈 ====================== */
	public boolean MarketOn(int marketNo); // 장터 오픈 (장터 상태 1 → 2)
	public boolean ProductOn(int productNo); // 장터 오픈 (상품 상태 1 → 3)
	
	/* ====================== 장터 위치 불러오기 ====================== */
	public String showMarketLoc(int marketNo); // 장터 위치 정보 조회
	
	/* ====================== 장터 공지 목록 보기 ====================== */
	public List<NoticeDTO> showNoticeList(@Param("marketNo")int marketNo, @Param("criteria")Criteria criteria); // 공지 게시판 조회
	public int TotalNotice(int marketNo); // 공지 총 개수
	
	/* ====================== 장터 공지 등록 ====================== */
	public boolean registerNotice(NoticeDTO noticeDTO); // 공지, 이벤트 게시글 등록
	
	/* ================== 장터 판매 상품 목록 보기 ================== */
	public List<ProductDTO> ProductList(@Param("marketNo")int marketNo, @Param("criteria")Criteria criteria); // 상품 조회 (상품 상태 3 & 장터 번호)
	public int TotalProduct(int marketNo); // 판매 상품 총 개수
	
	/* ====================== 장터 종료 ====================== */
	public boolean MarketOff(int marketNo); // 장터 종료 (장터 상태 2 → 3)
	public boolean ProductOff(int productNo); // 장터 종료 (상품 상태 3 → 4)

	/* ====================== 첨부파일 ====================== */
	public boolean MarketImg(AttachDTO attachDTO); // 장터 이미지 삽입
	public boolean RecruitImg(AttachDTO attachDTO); // 셀러 모집 이미지 삽입
	public List<AttachDTO> showMarketImg(int marketNo); // 장터 이미지 가져오기
	public List<AttachDTO> showProductImg(int marketNo); // 상품 이미지 가져오기
	
	/* ====================== 장터 후기 목록 보기 ====================== */
	public List<ReviewDTO> ReviewList(@Param("marketNo")int marketNo, @Param("criteria")Criteria criteria); // 한 줄 후기 조회 (장터 번호)
	public int TotalReview(int marketNo); // 후기 총 개수
	
	/* ====================== 장터 총 평점 불러오기 ====================== */
	public double MarketRate(int marketNo);
	
	/* ====================== 장터 후기 등록 ====================== */
	public boolean findReveiwer(@Param("marketNo")int marketNo, @Param("userNo")int userNo); // 후기 작성한 적 있는지 확인
	public boolean registerReview(ReviewDTO reviewDTO);
	public boolean ReviewRate(ReviewDTO reviewDTO); // 장터 등록 시 장터 평점 업데이트
	
	/* ====================== 장터 후기 삭제 (운영자) ====================== */
	public boolean deleteReview(int reviewNo);
}