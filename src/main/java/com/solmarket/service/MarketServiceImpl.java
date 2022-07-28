package com.solmarket.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.solmarket.dto.*;
import com.solmarket.mapper.AttachMapper;
import com.solmarket.mapper.MarketMapper;

@Service("service")
public class MarketServiceImpl implements MarketService {
	
	@Autowired
	public MarketMapper mapper;
	
	@Autowired
	public AttachMapper attachMapper;

	@Override
	public Integer getMarketStatus(int marketNo) {
		return mapper.getMarketStatus(marketNo);
	}
	
	
	/* ====================== 장터 등록 ====================== */
	@Override
	public boolean registerMarket(MarketDTO insertDTO) {
		
		boolean result=mapper.insert(insertDTO) == 1 ? true : false;
		
		// 첨부파일 삽입 - 첨부파일이 없다면 되돌려보내기
		if (insertDTO.getAttach() == null) {
			return false;
		}

		insertDTO.getAttach().setNo(insertDTO.getMarketNo());
		attachMapper.insertMarketImg(insertDTO.getAttach());
			
		return result;
	}

	/* ================= 장터 셀러 모집 이미지 등록 ================= */
	@Override
	public boolean RecruitImg(AttachDTO attachDTO) {
		return attachMapper.insertRecruitImg(attachDTO) == 1 ? true : false;
	}
	
	
	/* ================= 장터 참여 신청 목록 보기 ================= */
	@Override
	public List<ProductDTO> showReceive(int marketNo, Criteria cri) {
		return mapper.selectReceive(marketNo, cri);
	}
	
	@Override
	public int TotalReceive(int marketNo) {
		return mapper.selectTotalReceive(marketNo);
	}
	
	/* ================= 장터 참여 신청 상품 상세 ================= */
	@Override
	public ProductDTO showProduct(int marketNo, int productNo) {
		return mapper.selectProduct(marketNo, productNo);
	}

	/* ================= 장터 참여 승인 / 거부 ================== */
	@Override
	public boolean ProductAccept(int productNo) {
		return mapper.updateProductAccept(productNo) == 1 ? true : false;
	}

	@Override
	public boolean ProductDeny(int productNo) {
		return mapper.updateProductDeny(productNo) == 1 ? true : false;
	}

	/* ================= 장터 참여 승인 목록 보기 ================= */
	@Override
	public List<ProductDTO> showProductAcceptList(int marketNo, Criteria cri) {
		return mapper.selectAcceptList(marketNo, cri);
	}
	
	@Override
	public int TotalAccept(int marketNo) {
		return mapper.selectTotalAccept(marketNo);
	}

	/* ====================== 장터 위치 정보 불러오기 ====================== */
	@Override
	public String showMarketLoc(int marketNo) {
		return mapper.selectMarketLoc(marketNo);
	}
	
	/* ====================== 장터 공지 목록 보기 ====================== */
	@Override
	public List<NoticeDTO> showNoticeList(int marketNo, Criteria cri) {
		return mapper.selectNoticeList(marketNo, cri);
	}
	
	@Override
	public int TotalNotice(int marketNo) {
		return mapper.selectTotalNotice(marketNo);
	}

	/* ====================== 장터 공지 등록 ====================== */
	@Override
	public boolean registerNotice(NoticeDTO noticeDTO) {
		return mapper.insertNotice(noticeDTO) == 1 ? true : false;
	}
	
	/* ================== 장터 판매 상품 목록 보기 ================== */
	@Override
	public List<ProductDTO> ProductList(int marketNo, Criteria cri) {
		return mapper.selectProductList(marketNo, cri);
	}
	
	@Override
	public int TotalProduct(int marketNo) {
		return mapper.selectTotalProduct(marketNo);
	}

	/* ====================== 첨부 파일 ====================== */
	@Override
	public boolean MarketImg(AttachDTO attachDTO) {
		return attachMapper.insertMarketImg(attachDTO) == 1 ? true : false;
	}
	
	@Override
	public List<AttachDTO> showMarketImg(int marketNo) {
		return attachMapper.selectMarketImg(marketNo);
	}
	
	@Override
	public List<AttachDTO> showProductImg(int marketNo) {
		ProductDTO dto = new ProductDTO();
		dto.setMarketNo(marketNo);
		int productNo = dto.getProductNo();
		return attachMapper.selectProductImg(productNo);
	}

	/* ====================== 장터 후기 ====================== */
	@Override
	public List<ReviewDTO> ReviewList(int marketNo, Criteria cri) {
		return mapper.selectReviewList(marketNo, cri);
	}
	
	@Override
	public int TotalReview(int marketNo) {
		return mapper.selectTotalReview(marketNo);
	}
	
	@Override
	public double MarketRate(int marketNo) {
		return mapper.selectMarketRate(marketNo);
	}

	@Override
	public boolean registerReview(ReviewDTO reviewDTO) {
		if(reviewDTO.getReviewContent() == null) {
			return false;
		}
		return mapper.insertReview(reviewDTO) == 1 ? true : false;
	}
	
	@Override
	public boolean ReviewRate(int marketNo) {
		return mapper.updateReviewRate(marketNo) == 1 ? true : false;
	}

	/* ==================== 장터 후기 삭제 (운영자) ==================== */
	@Override
	public boolean deleteReview(int reviewNo) {
		return mapper.deleteReview(reviewNo) == 1 ? true : false;
	}

	@Override
	public Integer getMarketNo(int userNo) {
		return mapper.getMarketNo(userNo);
	}

}