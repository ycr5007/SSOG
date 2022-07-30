package com.solmarket.controller;

import java.security.Principal;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.solmarket.dto.*;
import com.solmarket.mapper.MemberMapper;
import com.solmarket.service.MarketService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/market/*")
@Controller
public class MarketController {
	
	@Autowired
	private MarketService service;
	
	@Autowired
	private MemberMapper memberMapper;
	
	/* ====================== 장터 등록 (장터 상태 0) ====================== */
	@GetMapping("/market_register")
	public void market_register(Principal principal, Model model) {
		log.info("[GetMapping] ========== 장터 등록 폼 호출 ==========");
		// userNo 가져오기
		String userid = principal.getName();
		UserDTO userDTO = memberMapper.read(userid);
		model.addAttribute("userDTO", userDTO);
	}

	@GetMapping("/mapPopup")
	public void mapPopupGet() {
		log.info("[GetMapping] ========== 주소 검색 팝업 호출 ==========");
	}

	@PostMapping("/mapPopup")
	public void mapPopupPost() {
		log.info("[PostMapping] ========== 주소 팝업 전송 ==========");
	}

	@PostMapping("/market_register")
	public String market_registerMarket(MarketDTO insertDTO, AttachDTO attachDTO, RedirectAttributes rttr) {
		log.info("[PostMapping] ========== 장터 등록 폼 전송 ==========");
		log.info("inserDTO : " + insertDTO);
		log.info("attachDTO : " + attachDTO);
		
		if(service.registerMarket(insertDTO)) {
			rttr.addAttribute("marketNo", insertDTO.getMarketNo());
			
			return "redirect:/manager_index";
		}
		return "redirect:/market/market_register";
	}
	
	/* ====================== 장터 참여자 모집 ====================== */
	@GetMapping("/recruitPopup")
	public void recruitGet(int marketNo, Model model) {
		log.info("[GetMapping] ========== 셀러 모집 파일 업로드 팝업 호출 ==========");
		model.addAttribute("marketNo", marketNo);
	}
	
	@PostMapping("/recruitPopup")
	public String recruitPost(AttachDTO attachDTO, RedirectAttributes rttr) {
		log.info("[PostMapping] ========== 셀러 모집 파일 업로드 팝업 전송 ==========");
		log.info("attachDTO : " + attachDTO);
		if(service.RecruitImg(attachDTO)) {
			rttr.addFlashAttribute("msg", "등록되었습니다.");
		}else {
			rttr.addFlashAttribute("msg", "등록 실패. 다시 등록해주세요.");
		}
		rttr.addAttribute("marketNo", attachDTO.getNo());
		return "redirect:/market/recruitPopup";
	}
	
	/* ============ 장터 참여 신청 목록 보기 (상품 상태 0 & 장터 번호) ============ */
	@GetMapping("/market_receive")
	public void market_receive(int marketNo, @ModelAttribute("cri")Criteria cri, Model model) {
		log.info("[GetMapping] ========== 장터 참여 신청 리스트 호출 ==========");
		List<ProductDTO> list = service.showReceive(marketNo, cri);
		PageDTO pageDTO = new PageDTO(cri, service.TotalReceive(marketNo));
		model.addAttribute("product", list);
		model.addAttribute("pageDTO", pageDTO);
		model.addAttribute("marketNo", marketNo);
	}
	
	/* ================= 장터 참여 신청 상품 상세 ================= */
	@GetMapping("/market_receiveDetail")
	public void market_productDetail(int marketNo, int productNo, @ModelAttribute("cri")Criteria cri, Model model) {
		log.info("[GetMapping] ========== 장터 참여 신청 상품 상세 호출 ==========");
		ProductDTO productDTO = service.showProduct(marketNo, productNo);
		model.addAttribute("marketNo", marketNo);
		model.addAttribute("product", productDTO);
	}
	
	/* ==================== 장터 참여 승인 ==================== */
	@GetMapping("/market_receiveAccept")
	public String market_receiveAccept(int marketNo, int productNo, @ModelAttribute("cri")Criteria cri, RedirectAttributes rttr) {
		log.info("[PostMapping] ========== 장터 참여 승인 ==========");
		if(service.ProductAccept(productNo)) {
			rttr.addAttribute("marketNo", marketNo);
			rttr.addAttribute("productNo", productNo);
			rttr.addAttribute("pageNum", cri.getPageNum());
			rttr.addAttribute("amount", cri.getAmount());
			return "redirect:/market/market_receive";
		}
		return "redirect:/market/market_receiveDetail";
	}
	
	/* ==================== 장터 참여 거부 ==================== */
	@GetMapping("/market_receiveDeny")
	public String market_receiveDeny(int marketNo, int productNo, @ModelAttribute("cri")Criteria cri, RedirectAttributes rttr) {
		log.info("[PostMapping] ========== 장터 참여 거부 ==========");
		if(service.ProductDeny(productNo)) {
			rttr.addAttribute("marketNo", marketNo);
			rttr.addAttribute("pageNum", cri.getPageNum());
			rttr.addAttribute("amount", cri.getAmount());
			return "redirect:/market/market_receive";
		}
		return "redirect:/market/market_receiveDetail";
	}
	
	/* ==================== 장터 참여 승인 목록 보기 ==================== */
	@GetMapping("/market_accept")
	public void market_accept(int marketNo, @ModelAttribute("cri")Criteria cri, Model model) {
		log.info("[GetMapping] ========== 참여 승인 리스트 호출 ==========");
		List<ProductDTO> list = service.showProductAcceptList(marketNo, cri);
		PageDTO pageDTO = new PageDTO(cri, service.TotalAccept(marketNo));
		model.addAttribute("marketNo", marketNo);
		model.addAttribute("product", list);
		model.addAttribute("pageDTO", pageDTO);
	}
	
	/* ======================= 장터 상세 페이지 ======================= */
	@GetMapping("/market_detail")
	public void market_detail(int marketNo, @ModelAttribute("cri")Criteria cri, Model model) {
		log.info("[GetMapping] ========== 장터 상세 페이지 호출 ==========");
		MarketDTO marketDTO = new MarketDTO();
		marketDTO.setMarketNo(marketNo);
		List<ProductDTO> list = service.showProductAcceptList(marketNo, cri);
		List<ReviewDTO> review = service.ReviewList(marketNo, cri);
		model.addAttribute("marketLoc", service.showMarketLoc(marketNo));
		model.addAttribute("marketRate", service.MarketRate(marketNo));
		model.addAttribute("marketDTO", marketDTO);
		model.addAttribute("product", list);
		model.addAttribute("review", review);
	}
	
	/* ======================= 장터 후기 목록 보기 (사용자) ======================= */
	@GetMapping("/market_detailReview")
	public void market_detailReview(Principal principal, int marketNo, @ModelAttribute("cri")Criteria cri, Model model) {
		log.info("[GetMapping] ========== 장터 후기 더보기 호출 ==========");
		// user 정보 가져와 userNo 세팅
		String userid = principal.getName();
		UserDTO userDTO = memberMapper.read(userid);
		int userNo = userDTO.getUserNo();
		
		List<ReviewDTO> review = service.ReviewList(marketNo, cri);
		model.addAttribute("userNo", userNo);
		model.addAttribute("marketNo", marketNo);
		model.addAttribute("review", review);
		model.addAttribute("marketRate", service.MarketRate(marketNo));
	}
	
	@PostMapping("/market_detailReview")
	public String market_registerReview(Principal principal, ReviewDTO reviewDTO, int marketNo, RedirectAttributes rttr) {
		log.info("[PostMapping] ========== 장터 후기 작성 등록 ==========");		
		if(service.registerReview(reviewDTO)) {
			service.ReviewRate(marketNo);
			rttr.addAttribute("marketNo", marketNo);
		}
		return "redirect:/market/market_detailReview";
	}
	
	/* ================== 장터 판매 상품 목록 보기 ================== */
	@GetMapping("/market_myseller")
	public void seller_list(int marketNo, @ModelAttribute("cri")Criteria cri, Model model) {
		log.info("[GetMapping] ========== 장터 참여자 리스트 호출 ==========");
		List<ProductDTO> list = service.ProductList(marketNo, cri);
		PageDTO pageDTO = new PageDTO(cri, service.TotalProduct(marketNo));
		model.addAttribute("marketNo", marketNo);
		model.addAttribute("product", list);
		model.addAttribute("pageDTO", pageDTO);
	}
	
	/* ====================== 장터 공지 목록 보기 ====================== */
	@GetMapping("/market_notice")
	public void market_notice(int marketNo, @ModelAttribute("cri")Criteria cri, Model model) {
		log.info("[GetMapping] ========== 장터 공지 리스트 호출 ==========");
		List<NoticeDTO> list = service.showNoticeList(marketNo, cri);
		PageDTO pageDTO = new PageDTO(cri, service.TotalNotice(marketNo));
		model.addAttribute("marketNo", marketNo);
		model.addAttribute("notice", list);
		model.addAttribute("pageDTO", pageDTO);
	}
	
	/* ====================== 장터 공지 등록 ====================== */
	@GetMapping("/market_noticeForm")
	public void market_noticeForm(int marketNo, Model model) {
		log.info("[GetMapping] ========== 장터 공지 폼 호출 ==========");
		model.addAttribute("marketNo", marketNo);
	}
	
	@PostMapping("/market_noticeForm")
	public String market_noticeFormPost(NoticeDTO noticeDTO, @ModelAttribute("cri")Criteria cri, RedirectAttributes rttr) {
		log.info("[PostMapping] ========== 장터 공지 폼 전송 ==========");
		if(service.registerNotice(noticeDTO)) {
			rttr.addAttribute("marketNo", noticeDTO.getMarketNo());
			rttr.addAttribute("pageNum", cri.getPageNum());
			rttr.addAttribute("amount", cri.getAmount());
			return "redirect:/market/market_notice";
		}
		return "redirect:/market/market_noticeForm";
	}
	
	/* ====================== 장터 후기 목록 보기 (운영자) ====================== */
	@GetMapping("/market_review")
	public void market_review(int marketNo, @ModelAttribute("cri")Criteria cri, Model model) {
		log.info("[GetMapping] ========== 장터 후기 리스트 호출 ==========");
		List<ReviewDTO> list = service.ReviewList(marketNo, cri);
		PageDTO pageDTO = new PageDTO(cri, service.TotalReview(marketNo));
		model.addAttribute("marketNo", marketNo);
		model.addAttribute("review", list);
		model.addAttribute("pageDTO", pageDTO);
	}
	
	@PostMapping("/market_review")
	public String market_reviewDelete(int marketNo, int reviewNo, @ModelAttribute("cri")Criteria cri, RedirectAttributes rttr) {
		log.info("[PostMapping] ========== 장터 후기 삭제 작업 ==========");
		service.deleteReview(reviewNo);
		rttr.addAttribute("marketNo", marketNo);
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		return "redirect:/market/market_review";
	}
	
}