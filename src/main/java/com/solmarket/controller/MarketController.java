package com.solmarket.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.solmarket.dto.*;
import com.solmarket.service.MarketService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/market/*")
@Controller
public class MarketController {
	
	@Autowired
	private MarketService service;
	
	/* ====================== 장터 등록 (장터 상태 0) ====================== */
	@GetMapping("/market_register")
	public void market_register() {
		log.info("[GetMapping] ========== 장터 등록 폼 호출 ==========");
	}
	
	@PostMapping("/market_register")
	public String market_registerMarket(MarketDTO insertDTO, RedirectAttributes rttr) {
		log.info("[PostMapping] ========== 장터 등록 폼 전송 ==========");
		if(service.registerMarket(insertDTO)) {
			rttr.addAttribute("marketNo", insertDTO.getMarketNo());
			return "redirect:/manager_index";
		}
		return "redirect:/market/market_register";
	}
	
	/* ============ 장터 참여 신청 목록 보기 (상품 상태 0 & 장터 번호) ============ */
	@GetMapping("/market_receive")
	public void market_receive(int marketNo, Model model) {
		log.info("[GetMapping] ========== 장터 참여 신청 리스트 호출 ==========");
		List<ProductDTO> list = service.showReceive(marketNo);
		model.addAttribute("product", list);
	}
	
	/* ================= 장터 참여 신청 상품 상세 ================= */
	@GetMapping("/market_receiveDetail")
	public void market_productDetail(int marketNo, int productNo, Model model) {
		log.info("[GetMapping] ========== 장터 참여 신청 상품 상세 호출 ==========");
		ProductDTO productDTO = service.showProduct(marketNo, productNo);
		model.addAttribute("marketNo", marketNo);
		model.addAttribute("product", productDTO);
	}
	
	/* ================= 상품 승인 (상품 상태 0 → 1) ================== */
	/* ================= 상품 거부 (상품 상태 0 → 2) ================== */
	@PostMapping("/market_receiveDetail")
	public String market_productAccept(int productNo) {
		log.info("[PostMapping] ========== 장터 참여 승인 / 거부 ==========");
		if(service.ProductAccept(productNo)) {
			log.info("상품 승인 완료");
			return "redirect:/market/market_receiveDetail";			
		}
		else if(service.ProductAccept(productNo)) {
			log.info("상품 거부 완료");
			return "redirect:/market/market_receiveDetail";
		}
		return "redirect:/market/market_receive";			
	}
	
	/* ==================== 장터 참여 승인 목록 보기 ==================== */
	@GetMapping("/market_accept")
	public void market_accept(int marketNo, Model model) {
		log.info("[GetMapping] ========== 참여 승인 리스트 호출 ==========");
		List<ProductDTO> list = service.showProductAcceptList(marketNo);
		model.addAttribute("marketNo", marketNo);
		model.addAttribute("product", list);
	}
	
	/* ======================= 장터 상세 페이지 ======================= */
	@GetMapping("/market_detail")
	public void market_detail(int marketNo, Model model) {
		log.info("[GetMapping] ========== 장터 상세 페이지 호출 ==========");
		List<NoticeDTO> notice = service.showNoticeList(marketNo);
		List<AttachDTO> marketImg = service.MarketImg(marketNo);
		List<ProductDTO> product = service.ProductList(marketNo);
		AttachDTO productImg = service.ProductImg(marketNo);
		String marketLoc = service.showMarketLoc(marketNo);
		List<ReviewDTO> review = service.ReviewList(marketNo);
		model.addAttribute("notice", notice);
		model.addAttribute("marketImg", marketImg);
		model.addAttribute("product", product);
		model.addAttribute("productImg", productImg);
		model.addAttribute("marketLoc", marketLoc);
		model.addAttribute("review", review);
	}
	
	/* ======================= 장터 후기 목록 보기 (사용자) ======================= */
	@GetMapping("/market_detailReview")
	public void market_detailReview(int marketNo, Model model) {
		log.info("[GetMapping] ========== 장터 후기 더보기 호출 ==========");
		List<AttachDTO> img = service.MarketImg(marketNo);
		List<ReviewDTO> list = service.ReviewList(marketNo);
		double rate = service.MarketRate(marketNo);
		model.addAttribute("img", img);
		model.addAttribute("reviews", list);
		model.addAttribute("marketRate", rate);
	}
	
	@PostMapping("/market_detailReview")
	public void market_registerReview(ReviewDTO reviewDTO, RedirectAttributes rttr) {
		log.info("[PostMapping] ========== 장터 후기 작성 등록 ==========");
		if(service.registerReview(reviewDTO)) {
			service.ReviewRate(reviewDTO);
			rttr.addAttribute("review", reviewDTO);
		}
	}
	
	/* ================== 장터 판매 상품 목록 보기 ================== */
	@GetMapping("/market_myseller")
	public void seller_list(int marketNo, Model model) {
		log.info("[GetMapping] ========== 장터 참여자 리스트 호출 ==========");
		List<ProductDTO> list = service.ProductList(marketNo);
		AttachDTO img = service.ProductImg(marketNo);
		model.addAttribute("img", img);
		model.addAttribute("product", list);
	}
	
	/* ====================== 장터 공지 목록 보기 ====================== */
	@GetMapping("/market_notice")
	public void market_notice(int marketNo, Model model) {
		log.info("[GetMapping] ========== 장터 공지 리스트 호출 ==========");
		List<NoticeDTO> list = service.showNoticeList(marketNo);
		model.addAttribute("marketNo", marketNo);
		model.addAttribute("notice", list);
	}
	
	/* ====================== 장터 공지 등록 ====================== */
	@GetMapping("/market_noticeForm")
	public void market_noticeForm(int marketNo, Model model) {
		log.info("[GetMapping] ========== 장터 공지 폼 호출 ==========");
		model.addAttribute("marketNo", marketNo);
	}
	
	@PostMapping("/market_noticeForm")
	public String market_noticeFormPost(NoticeDTO noticeDTO, RedirectAttributes rttr) {
		log.info("[PostMapping] ========== 장터 공지 폼 전송 ==========");
		if(service.registerNotice(noticeDTO)) {
			rttr.addAttribute("noticeDTO", noticeDTO);
			return "redirect:/market/market_notice";
		}
		return "redirect:/market/market_noticeForm";
	}
	
	/* ====================== 장터 후기 목록 보기 (운영자) ====================== */
	@GetMapping("/market_review")
	public void market_review(int marketNo, Model model) {
		log.info("[GetMapping] ========== 장터 후기 리스트 호출 ==========");
		List<ReviewDTO> list = service.ReviewList(marketNo);
		model.addAttribute("marketNo", marketNo);
		model.addAttribute("review", list);
	}
	
	@PostMapping("/market_reviewDelete")
	public String market_reviewDelete(int reviewNo) {
		log.info("[PostMapping] ========== 장터 후기 삭제 요청 ==========");
		service.deleteReview(reviewNo);
		return "redirect:/market/market_review";
	}
	
}