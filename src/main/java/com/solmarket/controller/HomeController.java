package com.solmarket.controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.solmarket.dto.Criteria;
import com.solmarket.dto.CustomUser;
import com.solmarket.dto.MarketDTO;
import com.solmarket.dto.NoticeDTO;
import com.solmarket.dto.PageDTO;
import com.solmarket.dto.ProductDTO;
import com.solmarket.dto.ReviewDTO;
import com.solmarket.dto.UserDTO;
import com.solmarket.mapper.MemberMapper;
import com.solmarket.service.AdminService;
import com.solmarket.service.IndexService;
import com.solmarket.service.MarketService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class HomeController {

	@Autowired
	private IndexService service;
	
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private MemberMapper memberMapper;
	
	@Autowired
	private MarketService marketService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model, HttpServletRequest req) {

		String sessionId = req.getSession().getId();
		try {
			System.out.println(req.getSession().getId());
			adminService.visitInsert(sessionId);
		} catch (Exception e) {
			log.info("이미 존재하는 세션입니다...");
		}
		
		//서비스 호출
		List<MarketDTO> list = service.getList();
		//list 담기
		model.addAttribute("list",list);
		
		return "index";
	}
	
	@RequestMapping(value = "/manager_index", method = RequestMethod.GET)
	public String index(Model model, Principal principal, @ModelAttribute("cri")Criteria cri) {
		// userNo 가져오기 위한 작업
		String userid = principal.getName();
		UserDTO userDTO = memberMapper.read(userid);
		
		// 마켓 no 가져오기
		Integer marketNo = marketService.getMarketNo(userDTO.getUserNo());
		if(marketNo == null) {
			marketNo = 0;
		}
		
		// 장터 상태 가져오기
		Integer marketStatus = marketService.getMarketStatus(marketNo);
		if(marketNo == 0) {
			marketStatus = -1;
		}else {
			// 장터 참여 신청 목록 가져오기
			List<ProductDTO> receive = marketService.showReceive(marketNo, cri);
			model.addAttribute("product", receive);
			
			// 장터 공지 가져오기
			List<NoticeDTO> notice = marketService.showNoticeList(marketNo, cri);
			model.addAttribute("notice", notice);
			
			// 장터 판매 상품 가져오기
			List<ProductDTO> product = marketService.ProductList(marketNo, cri);
			model.addAttribute("product", product);
			
			// 장터 리뷰 가져오기
			List<ReviewDTO> review = marketService.ReviewList(marketNo, cri);
			model.addAttribute("review", review);
		}
	
		model.addAttribute("marketNo", marketNo);
		model.addAttribute("marketStatus", marketStatus);
        
        return "manager_index";
    }
	
	@ResponseBody
	@GetMapping("/auth")
	public Authentication auth() {
		return SecurityContextHolder.getContext().getAuthentication();
	}
	
}